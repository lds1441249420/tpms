package com.lds.tpms.dao;

import org.apache.ibatis.annotations.Param;

public interface InfoMapper {
    int infoEdit(@Param("empNo") String empNo, @Param("empName") String empName, @Param("realName") String realName, @Param("empSex") Integer empSex);

    int updatePwd(@Param("newPwd") String newPwd, @Param("empNo") String empNo);
}
