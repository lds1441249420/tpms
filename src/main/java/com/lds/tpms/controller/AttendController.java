package com.lds.tpms.controller;

import com.lds.tpms.pojo.AttRest;
import com.lds.tpms.pojo.AttTime;
import com.lds.tpms.pojo.Employee;
import com.lds.tpms.service.AttendService;
import com.lds.tpms.service.EmployeeService;
import com.lds.tpms.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("att")
public class AttendController {
    @Autowired
    AttendService attendService;
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/setWorkTimeByDeptId")
    public String setWorkTimeByDeptId(@RequestParam("timeWork") String timeWork, @RequestParam("timeOff") String timeOff, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        int result = attendService.setWorkTimeByDeptId(timeWork, timeOff, deptId);

        if (result > 0) {
            AttTime attTime = attendService.selWorkTimeByDeptId(deptId);
            model.addAttribute("attTime", attTime);
            model.addAttribute("msg", "更新成功！");
            return empType + "/setworktime";
        } else {
            model.addAttribute("msg", "更新失败！");
            return empType + "/setworktime";
        }
    }

    @RequestMapping("/selAllRestByDeptId")
    public String selAllRestByDeptId(HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        List<AttRest> attRests = attendService.selAllRestByDeptId(deptId);
        model.addAttribute("attRests", attRests);
        return empType + "/allrest";

    }

    @RequestMapping("/delRestByRestId")
    public String delRestByRestId(@RequestParam("restId") String restId, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

        int result = attendService.delRestByRestId(restId);

        if (result > 0) {
            return "redirect:/att/selAllRestByDeptId";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/allrest";
        }
    }

    @RequestMapping("/addRestByDeptId")
    public String addRestByDeptId(@RequestParam("beginDay") String beginDay, @RequestParam("endDay") String endDay, @RequestParam("restDesc") String restDesc, HttpServletRequest request, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        int result = attendService.addRestByDeptId(beginDay, endDay, restDesc, deptId);

        if (result > 0) {
            return "redirect:/att/selAllRestByDeptId";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/addrest";
        }
    }

    @RequestMapping("/selRecordByDate")
    public String selRecordByDate(HttpServletRequest request, String date, Model model) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf4 = new SimpleDateFormat("a");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");
        //当前日期
        String formatDate2 = sdf2.format(localTime);
        //上午还是下午
        String formatDate4 = sdf4.format(localTime);
        //星期几
        String formatDate5 = sdf5.format(localTime);

        List<Employee> employeesAm = null;
        List<Employee> employeesPm = null;
        if (date != null) {
            //查询所有员工所传日期上午打卡记录
            employeesAm = attendService.selDeptRecordByDate(date, deptId, "am");
            //查询所有员工所传日期下午打卡记录
            employeesPm = attendService.selDeptRecordByDate(date, deptId, "pm");
        } else {
            //查询所有员工今天上午打卡记录
            employeesAm = attendService.selDeptRecordByDate(formatDate2, deptId, "am");
            //查询所有员工今天下午打卡记录
            employeesPm = attendService.selDeptRecordByDate(formatDate2, deptId, "pm");
        }

        //判断该部门今天是否为节假日
        String restDesc = attendService.isRestByDeptId(formatDate2, deptId);

        if (date != null) {
            model.addAttribute("today", date);
        } else {
            model.addAttribute("today", formatDate2);
        }
        model.addAttribute("flag1", formatDate4);
        model.addAttribute("flag2", formatDate5);
        if (restDesc != null) {
            model.addAttribute("flag2", restDesc + "假期内");
        }
        model.addAttribute("employeesAm", employeesAm);
        model.addAttribute("employeesPm", employeesPm);
        return empType + "/todayrecord";
    }

    @RequestMapping("/attend")
    public String attend(HttpServletRequest request, Model model) throws ParseException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        Integer deptId = employee.getdId();
        String empType = employee.getEmpType();
        Integer empId = employee.getEmpId();

        Date localTime = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf4 = new SimpleDateFormat("a");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");
        //当前日期
        String formatDate2 = sdf2.format(localTime);
        //现在几点
        String formatDate3 = sdf3.format(localTime);
        //上午还是下午
        String formatDate4 = sdf4.format(localTime);

        //查询该部门出勤时间
        AttTime attTime = attendService.selWorkTimeByDeptId(deptId);

        //计算当前状态
        String status = DateUtil.whatStatus(attTime);

        Integer attType = 0;
        String attAt = null;
        if (status.equals("beforeWork")) {
            attType = 0;
            attAt = "am";
        }
        if (status.equals("afterWork")) {
            attType = 0;
            attAt = "pm";
        }
        if (status.equals("inWork") && formatDate4.equals("上午")) {
            attType = 1;
            attAt = "am";
        }
        if (status.equals("inWork") && formatDate4.equals("下午")) {
            attType = 2;
            attAt = "pm";
        }

        int result = attendService.attend(formatDate2, formatDate3, empId, deptId, attType, attAt);

        if (result > 0) {
            return "redirect:/show/showAttend";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/attend";
        }
    }

    @RequestMapping("/repair")
    public String repair(HttpServletRequest request, Model model, @RequestParam("dateStr") String dateStr, @RequestParam("type") String type, @RequestParam("desc") String desc) throws UnsupportedEncodingException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        dateStr = java.net.URLDecoder.decode(dateStr, "UTF-8");
        type = java.net.URLDecoder.decode(type, "UTF-8");
        desc = java.net.URLDecoder.decode(desc, "UTF-8");

        int result = attendService.repair(employee, dateStr, type, desc, deptId);

        if (result > 0) {
            return "redirect:/show/showRepair";
        } else {
            model.addAttribute("msg", "操作失败!");
            return empType + "/repair";
        }
    }

    @RequestMapping("/repairExamine")
    public String repairExamine(HttpServletRequest request, Model model, @RequestParam("repairId") Integer repairId, @RequestParam("repairStatus") String repairStatus) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        if (repairStatus.equals("del")) {
            attendService.delRepair(repairId);
        } else {
            attendService.repairExamine(repairId, Integer.parseInt(repairStatus));
        }

        return "redirect:/show/showRepairExamine";
    }

    @RequestMapping("/addLeave")
    public String addLeave(HttpServletRequest request, Model model, @RequestParam("beginDay") String leaveBegin, @RequestParam("endDay") String leaveEnd,
                           @RequestParam("leaveType") String leaveType, @RequestParam("leaveDesc") String leaveDesc) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();
        Integer empId = employee.getEmpId();
        String realName = employee.getRealName();

        int result = attendService.addLeave(empId, realName, deptId, leaveBegin, leaveEnd, leaveType, leaveDesc);

        if (result > 0) {
            return "redirect:/show/showRepair";
        } else {
            return "redirect:/show/showRepair";
        }
    }

    @RequestMapping("/leaveExamine")
    public String leaveExamine(HttpServletRequest request, Model model, @RequestParam("leaveId") Integer leaveId, @RequestParam("approval") String approval) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();
        Integer deptId = employee.getdId();

        if (approval.equals("del")) {
            attendService.delLeave(leaveId);
        } else {
            attendService.leaveExamine(leaveId, Integer.parseInt(approval));
        }

        return "redirect:/show/showLeaveExamine";
    }

    @RequestMapping("/testInsertRecord")
    public String testInsertRecord(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        String empType = employee.getEmpType();

/*        INSERT INTO `att_record`
        (`att_date`, `att_time`, `att_emp_id`, `att_dept_id`, `att_type`, `att_at`)
        VALUES
         ('2019-11-25', '17:05:01', '9', '2', '2', 'pm')*/

        attendService.attend("2019-11-26", "07:29:56", 7, 2, 0, "am");
        return empType + "/" + empType;
    }

}
