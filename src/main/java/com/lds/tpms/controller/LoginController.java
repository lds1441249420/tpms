package com.lds.tpms.controller;

import com.lds.tpms.pojo.Employee;
import com.lds.tpms.pojo.Menu;
import com.lds.tpms.service.LoginService;
import com.lds.tpms.service.MenuService;
import com.lds.tpms.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    LoginService loginService;
    @Autowired
    MenuService menuService;

    @RequestMapping("/checkPwd")
    @ResponseBody
    public String checkPwd(@RequestParam("username") String empNo,
                           @RequestParam("password") String password) {
        Employee employee = loginService.login(empNo);
        //计算密码，盐值为员工号
        String slat = empNo;
        String pwd = MD5Util.getMD5(password, slat);

        if (employee == null) {
            return "0";
        }

        if (!pwd.equals(employee.getPassword())) {
            return "1";
        } else {
            return "2";
        }

    }

    @RequestMapping("/login")
    public String Login(@RequestParam("username") String empNo,
                        @RequestParam("password") String password,
                        HttpServletRequest request) {

        //查询员工信息
        Employee employee = loginService.login(empNo);

        //判断员工身份
        String empType = employee.getEmpType();

        System.out.println("Someone Login-->用户名：" + empNo + ",密码：" + password + ",类型：" + empType);
        request.getSession().setAttribute("employee", employee);

        List<Menu> menus = menuService.selMenuAll(empType);
        request.getSession().setAttribute("menus", menus);

        return "redirect:/show/showWelcome";
    }

    @RequestMapping("/logout")
    public String Logout(HttpServletRequest request) {
        request.getSession().setAttribute("employee", null);
        return "redirect:/index.jsp";
    }

}
