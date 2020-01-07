package com.lds.tpms.pojo;

public class AttRecord {
    private int attId;

    private String  attDate;

    private String  attTime;

    private Integer attEmpId;

    private Integer attDeptId;

    private int attType;

    private String attAt;

    private Employee employee;

    @Override
    public String toString() {
        return "AttRecord{" +
                "attId=" + attId +
                ", attDate='" + attDate + '\'' +
                ", attTime='" + attTime + '\'' +
                ", attEmpId=" + attEmpId +
                ", attDeptId=" + attDeptId +
                ", attType=" + attType +
                ", attAt='" + attAt + '\'' +
                ", employee=" + employee +
                '}';
    }

    public int getAttId() {
        return attId;
    }

    public void setAttId(int attId) {
        this.attId = attId;
    }

    public String getAttDate() {
        return attDate;
    }

    public void setAttDate(String attDate) {
        this.attDate = attDate;
    }

    public String getAttTime() {
        return attTime;
    }

    public void setAttTime(String attTime) {
        this.attTime = attTime;
    }

    public Integer getAttEmpId() {
        return attEmpId;
    }

    public void setAttEmpId(Integer attEmpId) {
        this.attEmpId = attEmpId;
    }

    public Integer getAttDeptId() {
        return attDeptId;
    }

    public void setAttDeptId(Integer attDeptId) {
        this.attDeptId = attDeptId;
    }

    public int getAttType() {
        return attType;
    }

    public void setAttType(int attType) {
        this.attType = attType;
    }

    public String getAttAt() {
        return attAt;
    }

    public void setAttAt(String attAt) {
        this.attAt = attAt;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public AttRecord(int attId, String attDate, String attTime, Integer attEmpId, Integer attDeptId, int attType, String attAt, Employee employee) {
        this.attId = attId;
        this.attDate = attDate;
        this.attTime = attTime;
        this.attEmpId = attEmpId;
        this.attDeptId = attDeptId;
        this.attType = attType;
        this.attAt = attAt;
        this.employee = employee;
    }

    public AttRecord() {
    }
}
