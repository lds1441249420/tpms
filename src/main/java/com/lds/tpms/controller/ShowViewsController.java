package com.lds.tpms.controller;

import com.lds.tpms.pojo.*;
import com.lds.tpms.service.AttendService;
import com.lds.tpms.service.DepartmentService;
import com.lds.tpms.service.EmployeeService;
import com.lds.tpms.utils.DateUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("show")
public class ShowViewsController {

    @Autowired
    EmployeeService employeeService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    AttendService attendService;

    @RequestMapping("/showWelcome")
    public String showWelcome(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        String empType = employee.getEmpType();
        return empType + "/" + empType;
    }

    @RequestMapping("/showEditInfo")
    public String showEdit(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        String empType = employee.getEmpType();
        return empType + "/editinfo";
    }

    @RequestMapping("/showUpdatePwd")
    public String showUpdatePwd(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        String empType = employee.getEmpType();
        return empType + "/updatePwd";
    }

    @RequestMapping("/showAddDept")
    public String showAdd(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        String empType = employee.getEmpType();
        return empType + "/adddept";
    }

    @RequestMapping("/showAppoint")
    public String showAppoint(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        List<Department> departments = departmentService.selAllDept();

        model.addAttribute("depts", departments);
        return empType + "/appoint";
    }

    @RequestMapping("/showEditDept")
    public String showEdit(@Param("deptId") String deptId, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        Department department = departmentService.selDeptById(Integer.parseInt(deptId));

        model.addAttribute("dept", department);

        String empType = employee.getEmpType();
        return empType + "/editdept";
    }

    @RequestMapping("/showAddEmp")
    public String showAddEmp(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        List<Department> departments = departmentService.selAllDept();

        model.addAttribute("depts", departments);
        return empType + "/addemp";
    }

    @RequestMapping("/showSetWorkTime")
    public String showSetWorkTime(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        AttTime attTime = attendService.selWorkTimeByDeptId(deptId);

        model.addAttribute("attTime", attTime);
        return empType + "/setworktime";
    }

    @RequestMapping("/showAddRest")
    public String showAddRest(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");

        String empType = employee.getEmpType();
        return empType + "/addrest";
    }

    @RequestMapping("/showAttend")
    public String showAttend(HttpServletRequest request, Model model) throws ParseException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();
        Integer empId = employee.getEmpId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf4 = new SimpleDateFormat("a");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");

        //当前日期
        String formatDate2 = sdf2.format(localTime);
        //上午还是下午
        String formatDate4 = sdf4.format(localTime);
        //星期几
        String formatDate5 = sdf5.format(localTime);

        //判断该部门今天是否为节假日
        String restDesc = attendService.isRestByDeptId(formatDate2, deptId);

        //查询该部门出勤时间
        AttTime attTime = attendService.selWorkTimeByDeptId(deptId);

        //查询今日该员工的打卡记录
        AttRecord recordAm = attendService.selEmpRecordByDate(formatDate2, empId, "am");
        AttRecord recordPm = attendService.selEmpRecordByDate(formatDate2, empId, "pm");

        //判断当前状态
        String status = DateUtil.whatStatus(attTime);

        model.addAttribute("status", status);
        model.addAttribute("flag1", formatDate4);
        model.addAttribute("flag2", formatDate5);
        if (restDesc != null) {
            model.addAttribute("flag2", restDesc + "假期内");
        }
        model.addAttribute("attTime", attTime);
        model.addAttribute("recordAm", recordAm);
        model.addAttribute("recordPm", recordPm);

        return empType + "/attend";
    }

    @RequestMapping("/showRepair")
    public String showRepair(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer empId = employee.getEmpId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        //当前日期
        String formatDate2 = sdf2.format(localTime);

        List<String> lastWeek = DateUtil.weekDay(formatDate2, -1);
        List<String> thisWeek = DateUtil.thisWeek(formatDate2);

        List<Map<String, String>> notAttRecords = null;
        try {
            notAttRecords = attendService.selLastAndThisWeekNotAttend(lastWeek, thisWeek, empId);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        model.addAttribute("notAttRecords", notAttRecords);
        return empType + "/repair";
    }

    @RequestMapping("/showRepairExamine")
    public String showRepairExamine(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        //当前日期
        String formatDate2 = sdf2.format(localTime);

        List<String> lastWeek = DateUtil.weekDay(formatDate2, -1);
        List<String> thisWeek = DateUtil.thisWeek(formatDate2);

        List<AttRepair> lastAttRepairs = attendService.selRepairByDeptId(lastWeek.get(0), lastWeek.get(lastWeek.size() - 1), deptId);
        if (thisWeek.size() != 0) {
            List<AttRepair> thisAttRepairs = attendService.selRepairByDeptId(thisWeek.get(0), thisWeek.get(thisWeek.size() - 1), deptId);
            lastAttRepairs.addAll(thisAttRepairs);
        }

        model.addAttribute("allRepairs", lastAttRepairs);

        return empType + "/repairexamine";
    }

    @RequestMapping("/showAddLeave")
    public String showAddLeave(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        return empType + "/addleave";
    }

    @RequestMapping("/showLeaveExamine")
    public String showLeaveExamine(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        List<Leave> leaves = attendService.selLeaveByDeptId(deptId);

        model.addAttribute("leaves", leaves);
        return empType + "/leaveexamine";
    }

    @RequestMapping("/showLeave")
    public String showLeave(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer empId = employee.getEmpId();

        List<Leave> leaves = attendService.selLeavesByEmpId(empId);

        model.addAttribute("leaves", leaves);
        return empType + "/leave";
    }

    @RequestMapping("/showEchartsAdmin")
    public String showEchartsAdmin(HttpServletRequest request, Model model) throws ParseException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();
        Integer empId = employee.getEmpId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf3 = new SimpleDateFormat("MM-dd");
        //当前日期
        String formatDate2 = sdf2.format(localTime);

        List<String> weekDays = null;
        Integer countStaff = 0;
        Integer sum = 0;
        Integer countAtt0 = 0;
        Integer countAtt1 = 0;
        Integer countAtt2 = 0;
        Integer countAtt3 = 0;

        //查询上四周的日期区间
        weekDays = DateUtil.weekDay(formatDate2, -4);
        //查询该部门员工人数
        countStaff = employeeService.countStaffByDeptId(deptId);
        //计算应该有的出勤次数
        sum = countStaff * 2 * 5;
        //查询该部门员工上四周正常出勤记录
        countAtt0 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 0);
        //查询该部门员工上四周迟到记录
        countAtt1 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 1);
        //查询该部门员工上四周早退记录
        countAtt2 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 2);
        //计算缺卡次数
        countAtt3 = sum - countAtt0 - countAtt1 - countAtt2;

        model.addAttribute("d4Att0", countAtt0);
        model.addAttribute("d4Att1", countAtt1);
        model.addAttribute("d4Att2", countAtt2);
        model.addAttribute("d4Att3", countAtt3);
        model.addAttribute("d4", sdf3.format(sdf2.parse(weekDays.get(0))) + "-" + sdf3.format(sdf2.parse(weekDays.get(weekDays.size() - 1))));

        weekDays = DateUtil.weekDay(formatDate2, -3);
        //查询该部门员工人数
        countStaff = employeeService.countStaffByDeptId(deptId);
        //计算应该有的出勤次数
        sum = countStaff * 2 * 5;
        //查询该部门员工上四周正常出勤记录
        countAtt0 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 0);
        //查询该部门员工上四周迟到记录
        countAtt1 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 1);
        //查询该部门员工上四周早退记录
        countAtt2 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 2);
        //计算缺卡次数
        countAtt3 = sum - countAtt0 - countAtt1 - countAtt2;

        model.addAttribute("d3Att0", countAtt0);
        model.addAttribute("d3Att1", countAtt1);
        model.addAttribute("d3Att2", countAtt2);
        model.addAttribute("d3Att3", countAtt3);
        model.addAttribute("d3", sdf3.format(sdf2.parse(weekDays.get(0))) + "-" + sdf3.format(sdf2.parse(weekDays.get(weekDays.size() - 1))));

        weekDays = DateUtil.weekDay(formatDate2, -2);
        //查询该部门员工人数
        countStaff = employeeService.countStaffByDeptId(deptId);
        //计算应该有的出勤次数
        sum = countStaff * 2 * 5;
        //查询该部门员工上四周正常出勤记录
        countAtt0 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 0);
        //查询该部门员工上四周迟到记录
        countAtt1 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 1);
        //查询该部门员工上四周早退记录
        countAtt2 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 2);
        //计算缺卡次数
        countAtt3 = sum - countAtt0 - countAtt1 - countAtt2;

        model.addAttribute("d2Att0", countAtt0);
        model.addAttribute("d2Att1", countAtt1);
        model.addAttribute("d2Att2", countAtt2);
        model.addAttribute("d2Att3", countAtt3);
        model.addAttribute("d2", sdf3.format(sdf2.parse(weekDays.get(0))) + "-" + sdf3.format(sdf2.parse(weekDays.get(weekDays.size() - 1))));

        weekDays = DateUtil.weekDay(formatDate2, -1);
        //查询该部门员工人数
        countStaff = employeeService.countStaffByDeptId(deptId);
        //计算应该有的出勤次数
        sum = countStaff * 2 * 5;
        //查询该部门员工上四周正常出勤记录
        countAtt0 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 0);
        //查询该部门员工上四周迟到记录
        countAtt1 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 1);
        //查询该部门员工上四周早退记录
        countAtt2 = employeeService.countStaffAttByDateAndDeptIdAndType(deptId, weekDays.get(0), weekDays.get(weekDays.size() - 1), 2);
        //计算缺卡次数
        countAtt3 = sum - countAtt0 - countAtt1 - countAtt2;

        model.addAttribute("d1Att0", countAtt0);
        model.addAttribute("d1Att1", countAtt1);
        model.addAttribute("d1Att2", countAtt2);
        model.addAttribute("d1Att3", countAtt3);
        model.addAttribute("d1", sdf3.format(sdf2.parse(weekDays.get(0))) + "-" + sdf3.format(sdf2.parse(weekDays.get(weekDays.size() - 1))));

        return empType + "/echarts";
    }

}
