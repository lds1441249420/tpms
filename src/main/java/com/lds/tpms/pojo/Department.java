package com.lds.tpms.pojo;

public class Department {
    private Integer deptId;

    private String deptName;

    private String empNo;

    private String deptDesc;

    public Department(Integer deptId, String deptName, String empNo, String deptDesc) {
        this.deptId = deptId;
        this.deptName = deptName;
        this.empNo = empNo;
        this.deptDesc = deptDesc;
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", empNo='" + empNo + '\'' +
                ", deptDesc='" + deptDesc + '\'' +
                '}';
    }

    public Department() {
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptDesc() {
        return deptDesc;
    }

    public void setDeptDesc(String deptDesc) {
        this.deptDesc = deptDesc == null ? null : deptDesc.trim();
    }
}