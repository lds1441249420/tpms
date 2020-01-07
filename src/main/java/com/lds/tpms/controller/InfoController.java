package com.lds.tpms.controller;

import com.lds.tpms.pojo.Employee;
import com.lds.tpms.service.InfoService;
import com.lds.tpms.service.LoginService;
import com.lds.tpms.utils.MD5Util;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("info")
public class InfoController {

    @Autowired
    InfoService infoService;
    @Autowired
    LoginService loginService;

    @RequestMapping("/edit")
    public String edit(@Param("empName") String empName, @Param("realName") String realName, @Param("sex") String sex, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        empName = java.net.URLDecoder.decode(empName, "UTF-8");
        realName = java.net.URLDecoder.decode(realName, "UTF-8");

        String empNo = employee.getEmpNo();
        String empType = employee.getEmpType();

        int result = infoService.infoEdit(empNo, empName, realName, sex);

        employee = loginService.login(empNo);
        request.getSession().setAttribute("employee", employee);

        if (result > 0) {
            return "redirect:/show/showWelcome";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/edit";
        }

    }

    @RequestMapping("/updatePwd")
    public String updatePwd(HttpServletRequest request, @Param("newPwd") String newPwd, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empNo = employee.getEmpNo();
        String empType = employee.getEmpType();

        String slat = empNo;
        String pwd = MD5Util.getMD5(newPwd, slat);

        int result = infoService.updatePwd(pwd, empNo);

        if (result > 0) {
            return "redirect:/show/showWelcome";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/updatePwd";
        }

    }

}
