package com.javaweb.service.impl;

import com.javaweb.converter.BuildingEntityConverter;
import com.javaweb.converter.BuildingPatternConverter;
import com.javaweb.converter.BuildingSearchConverter;
import com.javaweb.converter.RentAreaEntityConverter;
import com.javaweb.designpattern.BuilderPattern;
import com.javaweb.entity.AssignMentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.BuildingUpdateOrCreater;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.IAssignMentBuildingRepository;
import com.javaweb.repository.IBuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements IBuildingService {

    @Autowired
    private IBuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingSearchConverter buildingSearchConverter;

    @Autowired
    private BuildingEntityConverter buildingEntityConverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private RentAreaEntityConverter rentAreaEntityConverter;

    @Autowired
    private IAssignMentBuildingRepository iAssignMentBuildingRepository;

    @Autowired
    private BuildingPatternConverter buildingPatternConverter;

    @Override
    public ResponseDTO listStaff(Long buildingId) {
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");

        List<UserEntity> staffAssigment = userRepository.findByAssmentBuildingAndBuilding(buildingId);
        ResponseDTO result = new ResponseDTO();

        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        for (UserEntity staff : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(staff.getFullName());
            staffResponseDTO.setStaffId(staff.getId());
            if (staffAssigment.contains(staff)) {
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOList.add(staffResponseDTO);
        }
        result.setData(staffResponseDTOList);
        result.setMessage("success");
        return result;
    }

    @Override
    public List<BuildingSearchResponse> getAllBuilding(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingSearchResponse> result = new ArrayList<>();

        // chuyen thanh design pattern da chuyen tim kiem vi neu khong chuyen thì
        // String không lưu được giá trị null;
        //BuilderPattern builderPattern = buildingPatternConverter.toBuildingDesignPattern(buildingSearchRequest);



        List<BuildingEntity> buildingEntities = buildingRepository.getAllBuilding(buildingSearchRequest);

        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
            buildingSearchResponse = buildingSearchConverter.toBuildingSearchResponse(buildingEntity);

            result.add(buildingSearchResponse);
        }

        return result;
    }

    @Override
    public void saveBuilding(BuildingUpdateOrCreater buildingUpdateOrCreater) {
        BuildingEntity buildingEntity = new BuildingEntity();
        buildingEntity = buildingEntityConverter.toBuildingEntity(buildingUpdateOrCreater);

        //Save lai building vao bang de co Id da moi them Duoc dien tich thue.
        buildingRepository.save(buildingEntity);

        // Sau do tach dien tich thua ra de ma save no vao Bang RentArea
        List<RentAreaEntity> rentAreaEntityList = rentAreaEntityConverter.toRentAreaEntity(buildingUpdateOrCreater);
        for (RentAreaEntity rentAreaEntity : rentAreaEntityList) {
            rentAreaRepository.deleteById(rentAreaEntity.getId());
            rentAreaEntity.setBuilding(buildingEntity);
        }
        rentAreaRepository.saveAll(rentAreaEntityList);
    }

    @Override
    public void deleteBuilding(List<Long> ids) {
        for (Long id : ids) {
            BuildingEntity building = buildingRepository.findById(id).get();
            List<RentAreaEntity> rentAreaEntityList = building.getRentAreaEntity();
            for (RentAreaEntity rentAreaEntity : rentAreaEntityList) {
                rentAreaRepository.deleteById(rentAreaEntity.getId());
            }
            List<AssignMentBuildingEntity> assignMentBuildingEntityList = building.getAssignMentBuildingEntity();
            for (AssignMentBuildingEntity assignMentBuildingEntity : assignMentBuildingEntityList) {
                iAssignMentBuildingRepository.delete(assignMentBuildingEntity);
            }
            buildingRepository.delete(building);
        }
    }
}
