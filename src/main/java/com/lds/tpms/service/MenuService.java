package com.lds.tpms.service;

import com.lds.tpms.dao.MenuMapper;
import com.lds.tpms.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    @Autowired
    MenuMapper menuMapper;

    public List<Menu> selMenuAll(String empType) {
        List<Menu> menus = menuMapper.selMenuByPid(0, empType);
        for (Menu menu : menus) {
            menu.setChildren(menuMapper.selMenuByPid(menu.getId(), empType));
        }
        return menus;
    }
}
