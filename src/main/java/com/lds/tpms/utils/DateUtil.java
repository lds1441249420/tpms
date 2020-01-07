package com.lds.tpms.utils;

import com.lds.tpms.pojo.AttTime;
import com.lds.tpms.service.AttendService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
    public static String whatStatus(AttTime attTime) throws ParseException {

        Date localTime = new Date();
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");

        String timeWork = attTime.getTimeWork();
        String timeOff = attTime.getTimeOff();
        long workTime = sdf3.parse(timeWork).getTime();
        long offTime = sdf3.parse(timeOff).getTime();
        long thisTime = sdf3.parse(sdf3.format(localTime)).getTime();

        String status = null;
        if (thisTime < workTime) {
            status = "beforeWork";
        }
        if (thisTime > workTime && thisTime < offTime) {
            status = "inWork";
        }
        if (thisTime > offTime) {
            status = "afterWork";
        }

        return status;
    }

    public static List<String> lastWeek(String dateStr) {
        List<String> dateWeekList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE, -7); //把日期往后增加一天,整数  往后推,负数往前移动
        date = calendar.getTime(); //这个时间就是日期往后推一天的结果

        String time = "";
        //count 用来存取与当天日期的相差数
        int count = 0;
        for (int i = 1; i < 6; i++) {
            //新建日历
            Calendar cal = Calendar.getInstance();
            //在日历中找到当前日期
            cal.setTime(date);
            //当前日期是本周第几天，默认按照中国习惯星期一为一周的第一天(末尾的+1的由来)
            count = -cal.get(Calendar.DAY_OF_WEEK) + 1;
            //循环。当天与本周周一到周日相差的天数
            cal.add(Calendar.DATE, count + i);
            //转化格式
            time = sdf.format(cal.getTime());
            //存入list
            dateWeekList.add(time);
        }
        return dateWeekList;
    }

    public static List<String> weekDay(String dateStr, Integer amount) {
        List<String> dateWeekList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE, amount * 7); //把日期往后增加一天,整数  往后推,负数往前移动
        date = calendar.getTime(); //这个时间就是日期往后推一天的结果

        String time = "";
        //count 用来存取与当天日期的相差数
        int count = 0;
        for (int i = 1; i < 6; i++) {
            //新建日历
            Calendar cal = Calendar.getInstance();
            //在日历中找到当前日期
            cal.setTime(date);
            //当前日期是本周第几天，默认按照中国习惯星期一为一周的第一天(末尾的+1的由来)
            count = -cal.get(Calendar.DAY_OF_WEEK) + 1;
            //循环。当天与本周周一到周日相差的天数
            cal.add(Calendar.DATE, count + i);
            //转化格式
            time = sdf.format(cal.getTime());
            //存入list
            dateWeekList.add(time);
        }

        return dateWeekList;
    }

    public static List<String> thisWeek(String dateStr) {

        List<String> dateWeekList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");

        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String time = "";
        //count 用来存取与当天日期的相差数
        int count = 0;
        for (int i = 1; i < 6; i++) {
            //新建日历
            Calendar cal = Calendar.getInstance();
            //在日历中找到当前日期
            cal.setTime(date);
            //当前日期是本周第几天，默认按照中国习惯星期一为一周的第一天(末尾的+1的由来)
            count = -cal.get(Calendar.DAY_OF_WEEK) + 1;
            //循环。当天与本周周一到周日相差的天数
            cal.add(Calendar.DATE, count + i);
            //转化格式
            time = sdf.format(cal.getTime());
            //存入list
            dateWeekList.add(time);
        }

        String format = sdf5.format(date);

        switch (format) {
            case "星期一":
                for (int i = 0; i < 5; i++) {
                    dateWeekList.remove(0);
                }
                break;
            case "星期二":
                for (int i = 1; i < 5; i++) {
                    dateWeekList.remove(1);
                }
                break;
            case "星期三":
                for (int i = 2; i < 5; i++) {
                    dateWeekList.remove(2);
                }
                break;
            case "星期四":
                for (int i = 3; i < 5; i++) {
                    dateWeekList.remove(3);
                }
                break;
            case "星期五":
                for (int i = 4; i < 5; i++) {
                    dateWeekList.remove(4);
                }
                break;
        }

        return dateWeekList;
    }

}
