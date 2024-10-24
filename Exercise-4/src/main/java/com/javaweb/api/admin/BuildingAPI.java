package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "BuildingAPIOfAdmin")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @PostMapping(value = "/api/building")
    public BuildingDTO AddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        // Xuong DB DE UPdate or Them Moi;

        return buildingDTO;
    }

    @DeleteMapping(value = "/api/building/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids) {
        // Xuong DB DE XOA THEO ID
        System.out.println("OK");
    }

    @GetMapping(value = "/api/building/{id}/staffs")
    public ResponseDTO loadstaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaff(id);
        return result;
    }

    @PostMapping(value = "/api/building/assigment")
    public void updateAssigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        System.out.println("OK");
    }
}
