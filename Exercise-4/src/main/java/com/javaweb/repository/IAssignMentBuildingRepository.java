package com.javaweb.repository;


import com.javaweb.entity.AssignMentBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IAssignMentBuildingRepository extends JpaRepository<AssignMentBuildingEntity, Long> {
}
