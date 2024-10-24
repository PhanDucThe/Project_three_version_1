//package com.javaweb.entity;
//
//import javax.persistence.*;
//import java.util.Date;
//
//@Entity
//@Table(name = "assignmentbuilding")
//public class AssignMentBuildingEntity {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @Column(name = "staffid")
//    private Long staffid;
//
////    @Column(name = "buildingid")
////    private Long buildingid;
//
//    @Column(name = "createddate")
//    private Date createddate;
//
//    @Column(name = "modifieddate")
//    private Date modifieddate;
//
//    @Column(name = "createdby")
//    private String createdby;
//
//    @Column(name = "modifiedby")
//    private String modifiedby;
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    private BuildingEntity building;
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    private UserEntity user;
//
//    public UserEntity getUser() {
//        return user;
//    }
//
//    public void setUser(UserEntity user) {
//        this.user = user;
//    }
//
//    public BuildingEntity getBuilding() {
//        return building;
//    }
//
//    public void setBuilding(BuildingEntity building) {
//        this.building = building;
//    }
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public Long getStaffid() {
//        return staffid;
//    }
//
//    public void setStaffid(Long staffid) {
//        this.staffid = staffid;
//    }
//
////    public Long getBuildingid() {
////        return buildingid;
////    }
////
////    public void setBuildingid(Long buildingid) {
////        this.buildingid = buildingid;
////    }
//
//    public Date getCreateddate() {
//        return createddate;
//    }
//
//    public void setCreateddate(Date createddate) {
//        this.createddate = createddate;
//    }
//
//    public Date getModifieddate() {
//        return modifieddate;
//    }
//
//    public void setModifieddate(Date modifieddate) {
//        this.modifieddate = modifieddate;
//    }
//
//    public String getCreatedby() {
//        return createdby;
//    }
//
//    public void setCreatedby(String createdby) {
//        this.createdby = createdby;
//    }
//
//    public String getModifiedby() {
//        return modifiedby;
//    }
//
//    public void setModifiedby(String modifiedby) {
//        this.modifiedby = modifiedby;
//    }
//}
