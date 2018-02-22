package com.service.csedemo.controller;



import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

public class TestCsedemo {

        CsedemoDelegate csedemoDelegate = new CsedemoDelegate();


    @Test
    public void testhelloworld(){

        String expactReturnValue = "cse demo service hello:hello" ; // You should put the expect String type value here.

        String returnValue = csedemoDelegate.helloworld("hello");

        assertEquals(expactReturnValue, returnValue);
    }

}