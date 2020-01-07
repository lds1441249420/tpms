package com.lds.tpms.test;

import com.lds.tpms.utils.MD5Util;

public class MD5Test {
    public static void main(String[] args) {
        String md5 = MD5Util.getMD5("142857", "99999");//03f89558fa3dbc5ca51fedb93a2cec52
        System.out.println(md5);
    }
}
