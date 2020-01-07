package com.lds.tpms.service;

import com.lds.tpms.dao.EmployeeMapper;
import com.lds.tpms.pojo.Employee;
import com.lds.tpms.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class LoginService {
    @Autowired
    EmployeeMapper employeeMapper;

    public Employee login(String empNo) {
        //获取登录对象
        Employee emp = employeeMapper.getEmpByName(empNo);

        return emp;
    }
}
