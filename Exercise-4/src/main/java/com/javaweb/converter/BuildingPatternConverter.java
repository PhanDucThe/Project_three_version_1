package com.javaweb.converter;

import com.javaweb.designpattern.BuilderPattern;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

@Component
public class BuildingPatternConverter {

    public BuilderPattern toBuildingDesignPattern(BuildingSearchRequest buildingSearchRequest) {
        BuilderPattern builderPattern = new BuilderPattern.Builder()
                .setName(buildingSearchRequest.getName())
                .setFloorArea(buildingSearchRequest.getFloorArea())
                .setDistrict(buildingSearchRequest.getDistrict())
                .setWard(buildingSearchRequest.getWard())
                .setStreet(buildingSearchRequest.getStreet())
                .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
                .setDirection(buildingSearchRequest.getDirection())
                .setLevel(buildingSearchRequest.getLevel())
                .setAreaFrom(buildingSearchRequest.getAreaFrom())
                .setAreaTo(buildingSearchRequest.getAreaTo())
                .setRentPriceFrom(buildingSearchRequest.getRentPriceFrom())
                .setRentPriceTo(buildingSearchRequest.getRentPriceTo())
                .setManagerName(buildingSearchRequest.getManagerName())
                .setManagerPhone(buildingSearchRequest.getManagerPhone())
                .setStaffId(buildingSearchRequest.getStaffId())
                .setTypeCode(buildingSearchRequest.getTypeCode())
                .build();

        return builderPattern;
    }

}
