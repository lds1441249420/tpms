package com.lds.tpms.service;

import com.lds.tpms.dao.EmployeeMapper;
import com.lds.tpms.pojo.Employee;
import com.lds.tpms.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public String selEmpNameByEmpNo(String empNo) {
        Employee employee = employeeMapper.getEmpByName(empNo);
        if (employee == null) {
            return "未指定";
        }
        return employee.getRealName();
    }

    public List<Employee> selEmpByDeptId(Integer deptId) {
        List<Employee> employees = employeeMapper.selAllEmpBydId(deptId);
        return employees;
    }

    public List<Employee> selAllStaffBydId(Integer deptId) {
        List<Employee> employees = employeeMapper.selAllStaffBydId(deptId);
        return employees;
    }

    public Employee selEmpByEmptId(String empId) {
        Employee employee = employeeMapper.selEmpByEmpId(Integer.parseInt(empId));
        return employee;
    }

    public String getEmpNoByDeptId(Integer dId) {
        String empNoStr = null;
        List<String> empNosByDeptId = employeeMapper.getEmpNosByDeptId(dId);

        //如果该部门还没有员工
        if (empNosByDeptId.toString().equals("[]")) {
            if (dId < 10) {
                empNoStr = "0" + dId + "001";
            } else {
                empNoStr = dId + "001";
            }
            return empNoStr;
        }

        Integer empNo = Integer.parseInt(empNosByDeptId.get(0));
        Boolean flag = false;

        do {
            if (dId < 10) {
                empNoStr = "0" + (++empNo).toString();
            } else {
                empNoStr = (++empNo).toString();
            }

            for (String empNoByDeptId : empNosByDeptId) {
                flag = true;
                if (empNoStr.equals(empNoByDeptId)) {
                    flag = false;
                    break;
                }
            }

        } while (!flag);
        return empNoStr;
    }

    public int addEmp(String password, String empNo, String realName, String empSex, String dId) {

        String pwd = MD5Util.getMD5(password, empNo);

        int result = employeeMapper.addEmp(pwd, empNo, realName, Integer.parseInt(empSex), "staff", Integer.parseInt(dId));
        return result;
    }

    public int cancelAdmin(String deptId) {
        int result = employeeMapper.cancelAdmin(Integer.parseInt(deptId));
        return result;
    }

    public int appointAdmin(String empId) {
        int result = employeeMapper.appointAdmin(Integer.parseInt(empId));
        return result;
    }

    public List<Employee> selAllEmpBydId(Integer deptId) {
        List<Employee> employees = employeeMapper.selAllEmpBydId(deptId);
        return employees;
    }

    public int delEmpById(String empId) {
        int result = employeeMapper.delEmpById(Integer.parseInt(empId));
        return result;
    }

    public int countStaffByDeptId(Integer deptId) {
        int result = employeeMapper.countStaffByDeptId(deptId);
        return result;
    }

    public int countStaffAttByDateAndDeptIdAndType(Integer deptId, String beginDateStr, String endDateStr, Integer attType) {
        int result = employeeMapper.countStaffAttByDateAndDeptIdAndType(deptId, beginDateStr, endDateStr, attType);
        return result;
    }
}
