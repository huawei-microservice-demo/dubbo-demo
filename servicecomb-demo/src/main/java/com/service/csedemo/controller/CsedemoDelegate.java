package com.service.csedemo.controller;

import org.springframework.stereotype.Component;


@Component
public class CsedemoDelegate {

    public String helloworld(String name){

        // Do Some Magic Here!
        return "cse demo service hello:" + name;
    }
}
