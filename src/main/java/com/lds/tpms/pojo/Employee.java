package com.lds.tpms.pojo;

public class Employee {
    private Integer  empId;

    private String empName;

    private String password;

    private String  empNo;

    private String realName;

    private Integer empSex;

    private String empType;

    private Integer dId;

    private Department department;

    private AttRecord attRecord;

    private Leave leave;

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", password='" + password + '\'' +
                ", empNo='" + empNo + '\'' +
                ", realName='" + realName + '\'' +
                ", empSex=" + empSex +
                ", empType='" + empType + '\'' +
                ", dId=" + dId +
                ", department=" + department +
                ", attRecord=" + attRecord +
                ", leave=" + leave +
                '}';
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getEmpSex() {
        return empSex;
    }

    public void setEmpSex(Integer empSex) {
        this.empSex = empSex;
    }

    public String getEmpType() {
        return empType;
    }

    public void setEmpType(String empType) {
        this.empType = empType;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public AttRecord getAttRecord() {
        return attRecord;
    }

    public void setAttRecord(AttRecord attRecord) {
        this.attRecord = attRecord;
    }

    public Leave getLeave() {
        return leave;
    }

    public void setLeave(Leave leave) {
        this.leave = leave;
    }

    public Employee(Integer empId, String empName, String password, String empNo, String realName, Integer empSex, String empType, Integer dId, Department department, AttRecord attRecord, Leave leave) {
        this.empId = empId;
        this.empName = empName;
        this.password = password;
        this.empNo = empNo;
        this.realName = realName;
        this.empSex = empSex;
        this.empType = empType;
        this.dId = dId;
        this.department = department;
        this.attRecord = attRecord;
        this.leave = leave;
    }

    public Employee() {
    }
}