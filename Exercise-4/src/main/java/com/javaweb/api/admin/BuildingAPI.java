package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.request.BuildingUpdateOrCreater;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IAssignMentsBuildingService;
import com.javaweb.service.IBuildingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "BuildingAPIOfAdmin")
@Slf4j
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private IAssignMentsBuildingService iAssignMentsBuildingService;

    @PostMapping(value = "/api/building")
    public Long AddOrUpdateBuilding(@RequestBody BuildingUpdateOrCreater buildingUpdateOrCreater) {
        buildingService.saveBuilding(buildingUpdateOrCreater);
        log.info("Building saved successfully");
        return 1l;
    }

    @DeleteMapping(value = "/api/building/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids) {
        // Xuong DB DE XOA THEO ID
        buildingService.deleteBuilding(ids);
    }

    @GetMapping(value = "/api/building/{id}/staffs")
    public ResponseDTO loadstaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaff(id);
        return result;
    }

    @PostMapping(value = "/api/building/assigment")
    public void updateAssigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        iAssignMentsBuildingService.assignMentsBuilding(assignmentBuildingDTO);
    }

    @PutMapping(value = "/api/building/update")
    public void updateBuilding(@RequestBody BuildingUpdateOrCreater buildingUpdateOrCreater) {
        buildingService.saveBuilding(buildingUpdateOrCreater);
        System.out.println("YES");
    }
}
