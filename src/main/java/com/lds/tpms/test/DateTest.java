package com.lds.tpms.test;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

public class DateTest {
    public static void main(String[] args) {
        Date localTime = new Date();
        //设置时间格式
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a E");

        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf4 = new SimpleDateFormat("a");
        SimpleDateFormat sdf5 = new SimpleDateFormat("E");

        //获取的时间，是本机的时间
        String formatDate1 = sdf1.format(localTime);

        String formatDate2 = sdf2.format(localTime);
        String formatDate3 = sdf3.format(localTime);
        String formatDate4 = sdf4.format(localTime);
        String formatDate5 = sdf5.format(localTime);

        System.out.println(formatDate1);

        System.out.println(formatDate2);
        System.out.println(formatDate3);
        System.out.println(formatDate4);
        System.out.println(formatDate5);

        System.out.println();

        Date date = null;
        Date date1 = null;
        try {
            // 注意格式需要与上面一致，不然会出现异常
            date = sdf3.parse("13:52:14");
            date1 = sdf3.parse("12:00:00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("字符串转换成时间:" + sdf1.format(date));

        System.out.println(date.getTime());
        System.out.println(date1.getTime());
        System.out.println(date.getTime() < date1.getTime());
    }
}
