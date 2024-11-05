package com.javaweb.converter;

import com.javaweb.config.ModelMapperConfig;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BuildingSearchConverter {

    @Autowired
    private ModelMapperConfig modelMapperConfig;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
        buildingSearchResponse = modelMapperConfig.modelMapper().map(buildingEntity, BuildingSearchResponse.class);

        if (buildingEntity.getDistrict().equals("QUAN_1")) {
            buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + "Quận 1 ");
        }
        else if (buildingEntity.getDistrict().equals("QUAN_2")) {
            buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + "Quận 2 ");
        }
        else {
            buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + "Quận 4 ");
        }

        List<RentAreaEntity> rentAreaEntity = new ArrayList<>();
        rentAreaEntity = buildingEntity.getRentAreaEntity();
        List<String> str = new ArrayList<>();
        for (RentAreaEntity rentAreaEntity1 : rentAreaEntity) {
            str.add("" + rentAreaEntity1.getValue() + "");
        }
        buildingSearchResponse.setRentArea(String.join(",",str));


        return buildingSearchResponse;
    }
}
