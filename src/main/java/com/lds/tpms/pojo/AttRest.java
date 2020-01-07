package com.lds.tpms.pojo;

public class AttRest {

    private Integer restId;

    private String beginDay;

    private String endDay;

    private String restDesc;

    private Integer deptId;

    @Override
    public String toString() {
        return "AttRest{" +
                "restId=" + restId +
                ", beginDay='" + beginDay + '\'' +
                ", endDay='" + endDay + '\'' +
                ", restDesc='" + restDesc + '\'' +
                ", deptId=" + deptId +
                '}';
    }

    public Integer getRestId() {
        return restId;
    }

    public void setRestId(Integer restId) {
        this.restId = restId;
    }

    public String getBeginDay() {
        return beginDay;
    }

    public void setBeginDay(String beginDay) {
        this.beginDay = beginDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public String getRestDesc() {
        return restDesc;
    }

    public void setRestDesc(String restDesc) {
        this.restDesc = restDesc;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public AttRest(Integer restId, String beginDay, String endDay, String restDesc, Integer deptId) {
        this.restId = restId;
        this.beginDay = beginDay;
        this.endDay = endDay;
        this.restDesc = restDesc;
        this.deptId = deptId;
    }

    public AttRest() {
    }
}
