package com.lds.tpms.service;

import com.lds.tpms.dao.DepartmentMapper;
import com.lds.tpms.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> selAllDept() {
        List<Department> departments = departmentMapper.selAllDept();
        return departments;
    }

    public Department selDeptById(Integer deptId) {
        Department department = departmentMapper.selDeptById(deptId);
        return department;
    }

    public int addDept(String deptName, String deptDesc) {
        int resut = departmentMapper.addDept(deptName, deptDesc);
        return resut;
    }

    public String checkName(String deptName) {
        Department department = departmentMapper.selDeptByName(deptName);

        if (department == null) {
            return "0";
        } else {
            return "1";
        }
    }

    public int delDept(String deptId) {
        int result = departmentMapper.delDept(Integer.parseInt(deptId));
        return result;
    }

    public int updateDept(String deptId, String deptName, String deptDesc) {
        int result = departmentMapper.updateDept(Integer.parseInt(deptId), deptName, deptDesc);
        return result;
    }

    public int appoint(String deptId, String empNo) {
        int result = departmentMapper.appoint(Integer.parseInt(deptId), empNo);
        return result;
    }
}
