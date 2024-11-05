package com.javaweb.repository.custom.impl;

import com.javaweb.designpattern.BuilderPattern;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        if (buildingSearchRequest.getAreaFrom() != null || buildingSearchRequest.getAreaTo() != null) {
            sql.append(" INNER JOIN rentarea ON building.id = rentarea.buildingid ");
        }
        if (buildingSearchRequest.getStaffId() != null) {
            sql.append(" INNER JOIN assignmentbuilding ON building.id = assignmentbuilding.buildingid ");
        }
    }

    public void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (fieldName.equals("staffId") == false && fieldName.startsWith("rentPrice") == false) {
                    if (fieldName.startsWith("area") == false && fieldName.equals("typeCode") == false) {
                        Object value = item.get(buildingSearchRequest);
                        if (value != null && value != "") {
                            if (value instanceof Long) {
                                sql.append(" AND building." + fieldName + " = " + value);
                            }
                            else if (value instanceof String) {
                                sql.append(" AND building." + fieldName + " LIkE '%" + value + "%' ");
                            }
                        }
                    }
                }
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if (areaFrom != null || areaTo != null) {
            if (areaFrom != null) {
                sql.append(" AND rentarea.value >= " + areaFrom);
            }
            if (areaTo != null) {
                sql.append(" AND rentarea.value <= " + areaTo);
            }
        }

        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if (rentPriceFrom != null || rentPriceTo != null) {
            if (rentPriceFrom != null) {
                sql.append(" AND building.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                sql.append(" AND building.rentprice <= " + rentPriceTo);
            }
        }

        if (buildingSearchRequest.getTypeCode() != null && buildingSearchRequest.getTypeCode().size() != 0) {
            List<String> tmp = new ArrayList<String>();
            for (String x : buildingSearchRequest.getTypeCode()) {
                tmp.add(x);
            }
            String firstIndex = tmp.get(0);
            sql.append(" AND ( building.type LIKE '%" + firstIndex + "%' ");
            for (int i = 1; i < tmp.size(); i++) {
                sql.append(" OR building.type LIKE '%" + tmp.get(i) + "%' ");
                if (i == tmp.size() - 1) {
                    sql.append(")");
                }
            }

        }

        if (buildingSearchRequest.getStaffId() != null) {
            sql.append(" AND assignmentbuilding.staffid = " + buildingSearchRequest.getStaffId());
        }
    }

    @Override
    public List<BuildingEntity> getAllBuilding(BuildingSearchRequest buildingSearchRequest) {

        // B1 Viet Day du Cau Lenh SQL.
        StringBuilder sql = new StringBuilder("SELECT DISTINCT building.* FROM building ");

        StringBuilder query = new StringBuilder(" WHERE 1 = 1 ");

        joinTable(buildingSearchRequest, sql);
        queryNormal(buildingSearchRequest, query);
        querySpecial(buildingSearchRequest, query);
        

        sql.append(query.toString());

        Query q = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);


        return q.getResultList();
    }
}
