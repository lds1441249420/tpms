package com.lds.tpms.controller;

import com.lds.tpms.pojo.Employee;
import com.lds.tpms.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("emp")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/genEmpNoByDeptId")
    @ResponseBody
    public String genEmpNoByDeptId(@Param("deptId") String deptId) {
        String empNo = employeeService.getEmpNoByDeptId(Integer.parseInt(deptId));
        return empNo;
    }

    @RequestMapping("/addEmp")
    public String addEmp(@Param("empName") String empName,
                         @Param("password") String password,
                         @Param("empSex") String empSex,
                         @Param("deptId") String deptId,
                         @Param("empNo") String empNo,
                         Model model, HttpServletRequest request) throws UnsupportedEncodingException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        empName = java.net.URLDecoder.decode(empName, "UTF-8");

        int result = employeeService.addEmp(password, empNo, empName, empSex, deptId);

        if (result > 0) {
            return "redirect:/dept/selAllDept";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/addemp";
        }
    }

    @RequestMapping("/addEmpAdmin")
    public String addEmpAdmin(@Param("empName") String empName,
                         @Param("password") String password,
                         @Param("empSex") String empSex,
                         @Param("deptId") String deptId,
                         @Param("empNo") String empNo,
                         Model model, HttpServletRequest request) throws UnsupportedEncodingException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        empName = java.net.URLDecoder.decode(empName, "UTF-8");

        int result = employeeService.addEmp(password, empNo, empName, empSex, deptId);

        if (result > 0) {
            return "redirect:/emp/selAllEmpBydId";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/addemp";
        }
    }

    @RequestMapping("/selAllEmpBydId")
    public String selAllEmpBydId(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

/*        if (!empType.equals("super")) {
            request.setAttribute("msg", "你无权进行此操作！");
            request.setAttribute("employee", null);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return null;
        }*/

        List<Employee> employees = employeeService.selAllEmpBydId(employee.getdId());


        model.addAttribute("emps", employees);
        model.addAttribute("timestamp", System.currentTimeMillis());

        return empType + "/allemp";

    }

    @RequestMapping("/delEmpById")
    public String delEmpById(@Param("empId") String empId, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        int result = employeeService.delEmpById(empId);

        if (result > 0) {
            return "redirect:/emp/selAllEmpBydId";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/allemp";
        }
    }

}
