package com.lds.tpms.service;

import com.lds.tpms.dao.AttendMapper;
import com.lds.tpms.dao.EmployeeMapper;
import com.lds.tpms.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AttendService {
    @Autowired
    AttendMapper attendMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    public AttTime selWorkTimeByDeptId(Integer deptId) {
        AttTime attTime = attendMapper.selWorkTimeByDeptId(deptId);
        return attTime;
    }

    public int setWorkTimeByDeptId(String timeWork, String timeOff, Integer deptId) {
        int result = attendMapper.setWorkTimeByDeptId(timeWork.length() == 5 ? timeWork + ":00" : timeWork, timeOff.length() == 5 ? timeOff + ":00" : timeOff, deptId);
        if (result == 0) {
            int result1 = attendMapper.addWorkTimeByDeptId(timeWork.length() == 5 ? timeWork + ":00" : timeWork, timeOff.length() == 5 ? timeOff + ":00" : timeOff, deptId);
            return result1;
        }
        return result;
    }

    public List<AttRest> selAllRestByDeptId(Integer deptId) {
        List<AttRest> attRests = attendMapper.selAllRestByDeptId(deptId);
        return attRests;
    }

    public int delRestByRestId(String restId) {
        int result = attendMapper.delRestByRestId(Integer.parseInt(restId));
        return result;
    }

    public int addRestByDeptId(String beginDay, String endDay, String restDesc, Integer deptId) {
        int result = attendMapper.addRestByDeptId(beginDay, endDay, restDesc, deptId);
        return result;
    }

    public List<Employee> selDeptRecordByDate(String date, Integer deptId, String at) {
        //查询该部门所有员工
        List<Employee> employees = employeeMapper.selAllStaffBydId(deptId);

        //查询所有员工的打卡记录
        for (Employee employee : employees) {
            employee.setAttRecord(attendMapper.selRecordByDate(date, employee.getEmpId(), at));
        }

        //没有打卡记录的查询是否有请假记录
        for (Employee employee : employees) {
            if (employee.getAttRecord() == null) {
                employee.setLeave(attendMapper.selLeaveByEmpId(date, employee.getEmpId()));
            }
        }

        return employees;
    }

    public AttRecord selEmpRecordByDate(String date, Integer empId, String at) {
        AttRecord attRecord = attendMapper.selRecordByDate(date, empId, at);
        return attRecord;
    }

/*    public List<Employee> findMUnAttEmps(List<Employee> employees, List<AttRecord> attRecords) throws ParseException {
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");
        //判断哪些员工没有打卡
        int index = 0;
        //每一个员工
        for (Employee employee : employees) {
            //比对所有记录
            for (AttRecord attRecord : attRecords) {
                //如果记录中存在你的id，并且打卡时间为上午
                if (attRecord.getAttEmpId() == employee.getEmpId() && sdf3.parse(attRecord.getAttTime()).getTime() <= sdf3.parse("12:00:00").getTime()) {
                    //那么你从员工集合中去除
                    employees.remove(index);
                }
            }
            //下一个员工
            index++;
        }
        return employees;
    }*/

    public String isRestByDeptId(String date, Integer deptId) {
        String restDesc = attendMapper.isRestByDeptId(date, deptId);
        return restDesc;
    }

    public int attend(String attDate, String attTime, Integer empId, Integer deptId, Integer attType, String attAt) {
        int result = attendMapper.attend(attDate, attTime, empId, deptId, attType, attAt);
        return result;
    }

    public List<Map<String, String>> selLastAndThisWeekNotAttend(List<String> lastWeek, List<String> thisWeek, Integer empId) throws ParseException {
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");
        List<Map<String, String>> notAttRecord = new ArrayList<>();
        for (String weekDay : lastWeek) {
            AttRecord am = attendMapper.selRecordByDate(weekDay, empId, "am");
            if (am == null) {
                Map<String, String> info = new HashMap<>();
                info.put("notAttDate", weekDay);
                info.put("notAttWeek", sdf5.format(sdf2.parse(weekDay)));
                info.put("notAttType", "上午缺卡");
                //查询是否申请补卡
                AttRepair isRepair = attendMapper.isRepair(empId, weekDay, "上午缺卡");
                if (isRepair != null) {
                    if (isRepair.getRepairStatus() == 0) {
                        info.put("repairStatus", "审核中");
                    } else if (isRepair.getRepairStatus() == 1) {
                        info.put("repairStatus", "已补卡");
                    } else if (isRepair.getRepairStatus() == 2) {
                        info.put("repairStatus", "被驳回");
                    }

                }
                notAttRecord.add(info);
            }
            AttRecord pm = attendMapper.selRecordByDate(weekDay, empId, "pm");
            if (pm == null) {
                Map<String, String> info = new HashMap<>();
                info.put("notAttDate", weekDay);
                info.put("notAttWeek", sdf5.format(sdf2.parse(weekDay)));
                info.put("notAttType", "下午缺卡");
                //查询是否申请补卡
                AttRepair isRepair = attendMapper.isRepair(empId, weekDay, "下午缺卡");
                if (isRepair != null) {
                    if (isRepair.getRepairStatus() == 0) {
                        info.put("repairStatus", "审核中");
                    } else if (isRepair.getRepairStatus() == 1) {
                        info.put("repairStatus", "已补卡");
                    } else if (isRepair.getRepairStatus() == 2) {
                        info.put("repairStatus", "被驳回");
                    }

                }
                notAttRecord.add(info);
            }
        }

        for (String weekDay : thisWeek) {
            AttRecord am = attendMapper.selRecordByDate(weekDay, empId, "am");
            if (am == null) {
                Map<String, String> info = new HashMap<>();
                info.put("notAttDate", weekDay);
                info.put("notAttWeek", sdf5.format(sdf2.parse(weekDay)));
                info.put("notAttType", "上午缺卡");
                //查询是否申请补卡
                AttRepair isRepair = attendMapper.isRepair(empId, weekDay, "上午缺卡");
                if (isRepair != null) {
                    if (isRepair.getRepairStatus() == 0) {
                        info.put("repairStatus", "审核中");
                    } else if (isRepair.getRepairStatus() == 1) {
                        info.put("repairStatus", "已补卡");
                    } else if (isRepair.getRepairStatus() == 2) {
                        info.put("repairStatus", "被驳回");
                    }

                }
                notAttRecord.add(info);
            }
            AttRecord pm = attendMapper.selRecordByDate(weekDay, empId, "pm");
            if (pm == null) {
                Map<String, String> info = new HashMap<>();
                info.put("notAttDate", weekDay);
                info.put("notAttWeek", sdf5.format(sdf2.parse(weekDay)));
                info.put("notAttType", "下午缺卡");
                //查询是否申请补卡
                AttRepair isRepair = attendMapper.isRepair(empId, weekDay, "下午缺卡");
                if (isRepair != null) {
                    if (isRepair.getRepairStatus() == 0) {
                        info.put("repairStatus", "审核中");
                    } else if (isRepair.getRepairStatus() == 1) {
                        info.put("repairStatus", "已补卡");
                    } else if (isRepair.getRepairStatus() == 2) {
                        info.put("repairStatus", "被驳回");
                    }

                }
                notAttRecord.add(info);
            }
        }

        return notAttRecord;
    }

    public int repair(Employee employee, String dateStr, String type, String desc, Integer deptId) {
        int result = attendMapper.repair(employee.getEmpId(), employee.getEmpNo(), employee.getRealName(), deptId, dateStr, type, desc, 0);
        return result;
    }

    public List<AttRepair> selRepairByDeptId(String beginDate, String endDate, Integer deptId) {
        List<AttRepair> attRepairs = attendMapper.selRepairByDeptId(beginDate, endDate, deptId);
        return attRepairs;
    }

    public int repairExamine(Integer repairId, Integer repairStatus) {
        int result = attendMapper.repairExamine(repairId, repairStatus);
        return result;
    }

    public int delRepair(Integer repairId) {
        int result = attendMapper.delRepair(repairId);
        return result;
    }

    public int addLeave(Integer empId, String realName, Integer deptId, String leaveBegin, String leaveEnd, String leaveType, String leaveDesc) {
        int result = attendMapper.addLeave(empId, realName, deptId, leaveBegin, leaveEnd, leaveType, leaveDesc, 0);
        return result;
    }

    public List<Leave> selLeaveByDeptId(Integer deptId) {
        List<Leave> leaves = attendMapper.selLeaveByDeptId(deptId);
        return leaves;
    }

    public int leaveExamine(Integer leaveId, Integer approval) {
        int result = attendMapper.leaveExamine(leaveId, approval);
        return result;
    }

    public int delLeave(Integer leaveId) {
        int result = attendMapper.delLeave(leaveId);
        return result;
    }

    public List<Leave> selLeavesByEmpId(Integer empId) {
        List<Leave> leaves = attendMapper.selLeavesByEmpId(empId);
        return leaves;
    }

}
