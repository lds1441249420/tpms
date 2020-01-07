package com.lds.tpms.controller;

import com.lds.tpms.pojo.Department;
import com.lds.tpms.pojo.Employee;
import com.lds.tpms.service.DepartmentService;
import com.lds.tpms.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/selAllDept")
    public String selAllDept(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empNo = employee.getEmpNo();
        String empType = employee.getEmpType();

/*        if (!empType.equals("super")) {
            request.setAttribute("msg", "你无权进行此操作！");
            request.setAttribute("employee", null);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return null;
        }*/

        List<Department> departments = departmentService.selAllDept();

        for (Department department : departments) {
            department.setEmpNo(employeeService.selEmpNameByEmpNo(department.getEmpNo()));
        }

        model.addAttribute("depts", departments);
        model.addAttribute("timestamp", System.currentTimeMillis());

        return empType + "/alldept";

    }

    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(@Param("deptName") String deptName) {
        String result = departmentService.checkName(deptName);
        return result;
    }

    @RequestMapping("/addDept")
    public String addDept(@Param("deptName") String deptName, @Param("deptDesc") String deptDesc, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        int result = departmentService.addDept(deptName, deptDesc);

        if (result > 0) {
            return "redirect:/dept/selAllDept";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/adddept";
        }

    }

    @RequestMapping("/deptIsExist")
    @ResponseBody
    public String deptIsExist(@Param("deptId") String deptId, HttpServletRequest request) {
        List<Employee> employees = employeeService.selEmpByDeptId(Integer.parseInt(deptId));

        if (!employees.toString().equals("[]")) {
            //System.out.println("此部门还有员工!");
            return "1";
        } else {
            return "0";
        }

    }

    @RequestMapping("/delDept")
    public String delDept(@Param("deptId") String deptId, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        int result = departmentService.delDept(deptId);

        if (result > 0) {
            return "redirect:/dept/selAllDept";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/alldept";
        }
    }


    @RequestMapping("/updateDept")
    public String updateDept(@Param("deptId") String deptId, @Param("deptName") String deptName, @Param("deptDesc") String deptDesc, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        int result = departmentService.updateDept(deptId, deptName, deptDesc);

        String empType = employee.getEmpType();
        if (result > 0) {
            return "redirect:/dept/selAllDept";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/editdept";
        }
    }


    @RequestMapping("/getEmpsByDeptId")
    @ResponseBody
    public List<Employee> getEmpsByDeptId(HttpServletRequest request, @Param("deptId") String deptId) {
        List<Employee> employees = employeeService.selEmpByDeptId(Integer.parseInt(deptId));

        if (!employees.toString().equals("[]")) {
            return employees;
        } else {
            return null;
        }

    }

    @RequestMapping("/appoint")
    public String appoint(HttpServletRequest request, @Param("deptId") String deptId, @Param("empId") String empId, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        //取消原来的管理员
        employeeService.cancelAdmin(deptId);
        //将新指定的员工身份设置为管理员
        employeeService.appointAdmin(empId);

        Employee employee1 = employeeService.selEmpByEmptId(empId);

        int result = departmentService.appoint(deptId, employee1.getEmpNo());

        if (result > 0) {
            return "redirect:/dept/selAllDept";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/alldept";
        }
    }
}
