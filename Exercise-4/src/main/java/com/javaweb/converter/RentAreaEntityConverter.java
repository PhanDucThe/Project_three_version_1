package com.javaweb.converter;

import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingUpdateOrCreater;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaEntityConverter {

    public List<RentAreaEntity> toRentAreaEntity(BuildingUpdateOrCreater buildingUpdateOrCreater) {
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        String rentArea = buildingUpdateOrCreater.getRentArea();

        // 200, 300, 400
        String[] item = rentArea.split(",\\s*");
        List<Long> item1 = new ArrayList<>();
        for (String s : item) {
            item1.add(Long.parseLong(s));
        }
        for (Long it : item1) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(it);
            rentAreaEntityList.add(rentAreaEntity);
        }


        return rentAreaEntityList;
    }
}
