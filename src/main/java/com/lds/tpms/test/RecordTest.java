package com.lds.tpms.test;

import com.lds.tpms.service.AttendService;
import org.springframework.beans.factory.annotation.Autowired;

public class RecordTest {
    @Autowired
    static AttendService attendService;

    public static void main(String[] args) {
        attendService.attend("2019-11-25", "07:29:56", 9, 2, 0, "am");
    }
}
