package com.lds.tpms.dao;

import com.lds.tpms.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttendMapper {
    AttTime selWorkTimeByDeptId(@Param("deptId") Integer deptId);

    List<AttRest> selAllRestByDeptId(@Param("deptId") Integer deptId);

    int setWorkTimeByDeptId(@Param("timeWork") String timeWork, @Param("timeOff") String timeOff, @Param("deptId") Integer deptId);

    int addWorkTimeByDeptId(@Param("timeWork") String timeWork, @Param("timeOff") String timeOff, @Param("deptId") Integer deptId);

    int delRestByRestId(@Param("restId") Integer restId);

    int addRestByDeptId(@Param("beginDay") String beginDay, @Param("endDay") String endDay, @Param("restDesc") String restDesc, @Param("deptId") Integer deptId);

    AttRecord selRecordByDate(@Param("date") String date, @Param("empId") Integer empId, @Param("attAt") String attAt);

    String isRestByDeptId(@Param("date") String date, @Param("deptId") Integer deptId);

    Leave selLeaveByEmpId(@Param("date") String date, @Param("empId") Integer empId);

    int attend(@Param("attDate") String attDate, @Param("attTime") String attTime, @Param("empId") Integer empId,@Param("deptId") Integer deptId, @Param("attType") Integer attType, @Param("attAt") String attAt);

    int repair(@Param("repairEmpId") Integer repairEmpId, @Param("repairEmpNo") String repairEmpNo, @Param("repairEmpRealName") String repairEmpRealName,
               @Param("deptId") Integer deptId, @Param("repairRecordDate") String repairRecordDate, @Param("repairRecordAt") String repairRecordAt,
               @Param("repairDesc") String repairDesc, @Param("repairStatus") Integer repairStatus);

    AttRepair isRepair(@Param("repairEmpId") Integer repairEmpId, @Param("repairRecordDate") String repairRecordDate, @Param("repairRecordAt") String repairRecordAt);

    List<AttRepair> selRepairByDeptId(@Param("beginDate") String beginDate, @Param("endDate") String endDate, @Param("deptId") Integer deptId);

    int repairExamine(@Param("repairId") Integer repairId, @Param("repairStatus") Integer repairStatus);

    int delRepair(@Param("repairId") Integer repairId);

    int addLeave(@Param("leaveEmpId") Integer empId, @Param("leaveEmpRealName") String realName, @Param("leaveDeptId") Integer deptId, @Param("leaveBegin") String leaveBegin,
                 @Param("leaveEnd") String leaveEnd, @Param("leaveType") String leaveType, @Param("leaveDesc") String leaveDesc, @Param("approval") Integer approval);

    List<Leave> selLeaveByDeptId(@Param("leaveDeptId") Integer deptId);

    int leaveExamine(@Param("leaveId") Integer repairId, @Param("approval") Integer approval);

    int delLeave(@Param("leaveId") Integer leaveId);

    List<Leave> selLeavesByEmpId(@Param("empId") Integer empId);
}