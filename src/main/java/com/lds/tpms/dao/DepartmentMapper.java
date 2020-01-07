package com.lds.tpms.dao;

import com.lds.tpms.pojo.Department;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper {

    Department selectByPrimaryKey(Integer deptId);

    List<Department> selAllDept();

    Department selDeptById(@Param("deptId") Integer deptId);

    int addDept(@Param("deptName") String deptName, @Param("deptDesc") String deptDesc);

    Department selDeptByName(@Param("deptName") String deptName);

    int delDept(@Param("deptId") Integer deptId);

    int updateDept(@Param("deptId") Integer deptId,@Param("deptName") String deptName, @Param("deptDesc") String deptDesc);

    int appoint(@Param("deptId") Integer deptId, @Param("empNo") String empNo);
}