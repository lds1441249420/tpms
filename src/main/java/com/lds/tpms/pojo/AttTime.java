package com.lds.tpms.pojo;

public class AttTime {
    private int deptId;

    private String timeWork;

    private String timeOff;

    @Override
    public String toString() {
        return "AttTime{" +
                "deptId=" + deptId +
                ", timeWork='" + timeWork + '\'' +
                ", timeOff='" + timeOff + '\'' +
                '}';
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getTimeWork() {
        return timeWork;
    }

    public void setTimeWork(String timeWork) {
        this.timeWork = timeWork;
    }

    public String getTimeOff() {
        return timeOff;
    }

    public void setTimeOff(String timeOff) {
        this.timeOff = timeOff;
    }

    public AttTime(int deptId, String timeWork, String timeOff) {
        this.deptId = deptId;
        this.timeWork = timeWork;
        this.timeOff = timeOff;
    }

    public AttTime() {
    }
}
