package com.service.csedemo;

import io.servicecomb.foundation.common.utils.BeanUtils;
import io.servicecomb.foundation.common.utils.Log4jUtils;

public class CsedemoApplication {
    public static void main(String[] args) throws Exception {
        Log4jUtils.init();
        BeanUtils.init();
    }
}
