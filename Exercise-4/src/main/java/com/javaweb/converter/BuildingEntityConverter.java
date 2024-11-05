package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingUpdateOrCreater;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BuildingEntityConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingEntity toBuildingEntity(BuildingUpdateOrCreater buildingUpdateOrCreater) {
        BuildingEntity buildingEntity = new BuildingEntity();
        modelMapper.map(buildingUpdateOrCreater, buildingEntity);
        String typeCode = new String();
        typeCode = buildingEntity.getType();
        typeCode = typeCode.substring(1, typeCode.length() - 1);
        typeCode = typeCode.replaceAll(" ", "");
        buildingEntity.setType(typeCode);
        return buildingEntity;
    }
}
