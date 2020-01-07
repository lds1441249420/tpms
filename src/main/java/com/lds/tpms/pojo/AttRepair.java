package com.lds.tpms.pojo;

public class AttRepair {
    private Integer repairId;

    private Integer repairEmpId;

    private String repairEmpNo;

    private String repairEmpRealName;

    private Integer repairDeptId;

    private String repairRecordDate;

    private String repairRecordAt;

    private String repairDesc;

    private Integer repairStatus;

    @Override
    public String toString() {
        return "AttRepair{" +
                "repairId=" + repairId +
                ", repairEmpId=" + repairEmpId +
                ", repairEmpNo='" + repairEmpNo + '\'' +
                ", repairEmpRealName='" + repairEmpRealName + '\'' +
                ", repairDeptId=" + repairDeptId +
                ", repairRecordDate='" + repairRecordDate + '\'' +
                ", repairRecordAt='" + repairRecordAt + '\'' +
                ", repairDesc='" + repairDesc + '\'' +
                ", repairStatus=" + repairStatus +
                '}';
    }

    public Integer getRepairId() {
        return repairId;
    }

    public void setRepairId(Integer repairId) {
        this.repairId = repairId;
    }

    public Integer getRepairEmpId() {
        return repairEmpId;
    }

    public void setRepairEmpId(Integer repairEmpId) {
        this.repairEmpId = repairEmpId;
    }

    public String getRepairEmpNo() {
        return repairEmpNo;
    }

    public void setRepairEmpNo(String repairEmpNo) {
        this.repairEmpNo = repairEmpNo;
    }

    public String getRepairEmpRealName() {
        return repairEmpRealName;
    }

    public void setRepairEmpRealName(String repairEmpRealName) {
        this.repairEmpRealName = repairEmpRealName;
    }

    public Integer getRepairDeptId() {
        return repairDeptId;
    }

    public void setRepairDeptId(Integer repairDeptId) {
        this.repairDeptId = repairDeptId;
    }

    public String getRepairRecordDate() {
        return repairRecordDate;
    }

    public void setRepairRecordDate(String repairRecordDate) {
        this.repairRecordDate = repairRecordDate;
    }

    public String getRepairRecordAt() {
        return repairRecordAt;
    }

    public void setRepairRecordAt(String repairRecordAt) {
        this.repairRecordAt = repairRecordAt;
    }

    public String getRepairDesc() {
        return repairDesc;
    }

    public void setRepairDesc(String repairDesc) {
        this.repairDesc = repairDesc;
    }

    public Integer getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(Integer repairStatus) {
        this.repairStatus = repairStatus;
    }

    public AttRepair(Integer repairId, Integer repairEmpId, String repairEmpNo, String repairEmpRealName, Integer repairDeptId, String repairRecordDate, String repairRecordAt, String repairDesc, Integer repairStatus) {
        this.repairId = repairId;
        this.repairEmpId = repairEmpId;
        this.repairEmpNo = repairEmpNo;
        this.repairEmpRealName = repairEmpRealName;
        this.repairDeptId = repairDeptId;
        this.repairRecordDate = repairRecordDate;
        this.repairRecordAt = repairRecordAt;
        this.repairDesc = repairDesc;
        this.repairStatus = repairStatus;
    }

    public AttRepair() {
    }
}
