package com.javaweb.service;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.BuildingUpdateOrCreater;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface IBuildingService {
    ResponseDTO listStaff(Long buildingId);
    List<BuildingSearchResponse> getAllBuilding(BuildingSearchRequest buildingSearchRequest);
    void saveBuilding(BuildingUpdateOrCreater buildingUpdateOrCreater);
    void deleteBuilding(List<Long> ids);
}
