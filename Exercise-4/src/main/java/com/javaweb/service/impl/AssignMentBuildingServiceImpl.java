package com.javaweb.service.impl;

import com.javaweb.entity.AssignMentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.IAssignMentBuildingRepository;
import com.javaweb.repository.IBuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignMentsBuildingService;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssignMentBuildingServiceImpl implements IAssignMentsBuildingService {

    @Autowired
    private IAssignMentBuildingRepository assignMentBuildingRepository;

    @Autowired
    private IBuildingRepository buildingRepository;

    @Autowired
    private UserRepository UserRepository;


    @Override
    public void assignMentsBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<Long> staffId = new ArrayList<>();
        staffId = assignmentBuildingDTO.getStaffs();

        for (Long id : staffId) {
            AssignMentBuildingEntity assignMentBuildingEntity = new AssignMentBuildingEntity();
            BuildingEntity buildingEntity = new BuildingEntity();
            buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
            assignMentBuildingEntity.setBuilding(buildingEntity);

            UserEntity userEntity = new UserEntity();
            userEntity = UserRepository.findById(id).get();
            assignMentBuildingEntity.setUserEntity(userEntity);

            assignMentBuildingRepository.save(assignMentBuildingEntity);
        }
    }
}
