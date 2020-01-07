package com.lds.tpms.pojo;

public class Leave {
    private Integer leaveId;

    private Integer leaveEmpId;

    private String leaveEmpRealName;

    private Integer leaveDeptId;

    private String leaveBegin;

    private String leaveEnd;

    private String leaveType;

    private String leaveDesc;

    private Integer approval;

    @Override
    public String toString() {
        return "Leave{" +
                "leaveId=" + leaveId +
                ", leaveEmpId=" + leaveEmpId +
                ", leaveEmpRealName='" + leaveEmpRealName + '\'' +
                ", leaveDeptId=" + leaveDeptId +
                ", leaveBegin='" + leaveBegin + '\'' +
                ", leaveEnd='" + leaveEnd + '\'' +
                ", leaveType='" + leaveType + '\'' +
                ", leaveDesc='" + leaveDesc + '\'' +
                ", approval=" + approval +
                '}';
    }

    public Integer getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(Integer leaveId) {
        this.leaveId = leaveId;
    }

    public Integer getLeaveEmpId() {
        return leaveEmpId;
    }

    public void setLeaveEmpId(Integer leaveEmpId) {
        this.leaveEmpId = leaveEmpId;
    }

    public String getLeaveEmpRealName() {
        return leaveEmpRealName;
    }

    public void setLeaveEmpRealName(String leaveEmpRealName) {
        this.leaveEmpRealName = leaveEmpRealName;
    }

    public Integer getLeaveDeptId() {
        return leaveDeptId;
    }

    public void setLeaveDeptId(Integer leaveDeptId) {
        this.leaveDeptId = leaveDeptId;
    }

    public String getLeaveBegin() {
        return leaveBegin;
    }

    public void setLeaveBegin(String leaveBegin) {
        this.leaveBegin = leaveBegin;
    }

    public String getLeaveEnd() {
        return leaveEnd;
    }

    public void setLeaveEnd(String leaveEnd) {
        this.leaveEnd = leaveEnd;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public String getLeaveDesc() {
        return leaveDesc;
    }

    public void setLeaveDesc(String leaveDesc) {
        this.leaveDesc = leaveDesc;
    }

    public Integer getApproval() {
        return approval;
    }

    public void setApproval(Integer approval) {
        this.approval = approval;
    }

    public Leave(Integer leaveId, Integer leaveEmpId, String leaveEmpRealName, Integer leaveDeptId, String leaveBegin, String leaveEnd, String leaveType, String leaveDesc, Integer approval) {
        this.leaveId = leaveId;
        this.leaveEmpId = leaveEmpId;
        this.leaveEmpRealName = leaveEmpRealName;
        this.leaveDeptId = leaveDeptId;
        this.leaveBegin = leaveBegin;
        this.leaveEnd = leaveEnd;
        this.leaveType = leaveType;
        this.leaveDesc = leaveDesc;
        this.approval = approval;
    }

    public Leave() {
    }
}
