package com.lds.tpms.controller;

import com.lds.tpms.pojo.Employee;
import com.lds.tpms.pojo.Menu;
import com.lds.tpms.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @RequestMapping("/show")
    @ResponseBody
    public List<Menu> showMenu(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        List<Menu> menus = menuService.selMenuAll(empType);
        return menus;
    }
}
