package com.lds.tpms.dao;

import com.lds.tpms.pojo.Employee;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {

    Employee getEmpByName(@Param("empNo") String empNo);

    List<Employee> selAllEmpBydId(@Param("dId") Integer dId);

    List<Employee> selAllStaffBydId(@Param("dId") Integer dId);

    Employee selEmpByEmpId(@Param("empId") Integer empId);

    List<String> getEmpNosByDeptId(@Param("dId") Integer dId);

    int cancelAdmin(@Param("dId") Integer dId);

    int appointAdmin(@Param("empId") Integer empId);

    int addEmp(@Param("password") String password, @Param("empNo") String empNo, @Param("realName") String realName,
               @Param("empSex") Integer empSex, @Param("empType") String empType, @Param("dId") Integer dId);

    int delEmpById(@Param("empId") Integer empId);

    int countStaffByDeptId(@Param("deptId") Integer deptId);

    int countStaffAttByDateAndDeptIdAndType(@Param("deptId") Integer deptId, @Param("beginDate") String beginDate, @Param("endDate") String endDate, @Param("type") Integer type);
}