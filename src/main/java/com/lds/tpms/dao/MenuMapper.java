package com.lds.tpms.dao;

import com.lds.tpms.pojo.Menu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

public interface MenuMapper {
    List<Menu> selMenuByPid(@Param("pid") int pid, @Param("empType") String empType);
    /*@Select("select * from menu where pid = #{pid}")*/
}
