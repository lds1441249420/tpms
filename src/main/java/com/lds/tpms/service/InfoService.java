package com.lds.tpms.service;

import com.lds.tpms.dao.InfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoService {
    @Autowired
    InfoMapper infoMapper;

    public int infoEdit(String empNo, String empName, String realName, String empSex) {

        int sex = Integer.parseInt(empSex);

        int result = infoMapper.infoEdit(empNo, empName, realName, sex);

        return result;
    }

    public int updatePwd(String newPwd, String empNo) {
        int result = infoMapper.updatePwd(newPwd, empNo);
        return result;
    }
}
