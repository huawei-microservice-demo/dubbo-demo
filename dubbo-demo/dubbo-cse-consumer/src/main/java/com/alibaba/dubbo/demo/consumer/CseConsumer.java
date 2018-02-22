package com.alibaba.dubbo.demo.consumer;

import com.alibaba.dubbo.demo.DemoService;
import cse.gen.dubboEnv.csedemo.csedemo.CsedemoImplIntf;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.alibaba.dubbo.demo.DemoService;
/**
 * Created by ken.lj on 2017/7/31.
 */
public class CseConsumer {

    public static void main(String[] args) {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"META-INF/spring/dubbo-demo-cseconsumer.xml"});
        context.start();
        
        CseConsumer cusumer = new CseConsumer();

        String hello ;
        while (true) {
        	
        	String all = System.getProperty("all");

        	//cusumer.InvokeCSESvc(context);// 执行远程方法
        	cusumer.InvokeDubboSvc(context);
        	//if (all!=null && all.equals("true")) {
        	//	cusumer.InvokeDubboSvc(context);
        	//}
	        try {
	            Thread.sleep(5000);
	          } catch(Exception e) {
            }    
       }
    }
        
    void InvokeCSESvc(ClassPathXmlApplicationContext context ) {
    	CsedemoImplIntf demoCSEService = (CsedemoImplIntf) context.getBean("demoCseService"); // 获取远程服务代理
           try {

               String hello = demoCSEService.helloworld("world"); // 执行远程方法

               System.out.println("CSE service hello:" + hello); // 显示调用结果
        	   
           } catch(Exception e) {
        	   System.out.println("demoCSEService invoke helloworld exception.");
           }

    }
    
    void InvokeDubboSvc(ClassPathXmlApplicationContext context ) {
        DemoService demoService = (DemoService) context.getBean("demoService"); // 获取远程服务代理
        try {
        String hello = demoService.sayHello("world"); // 执行远程方法

        System.out.println("dubbo service hello:" + hello); // 显示调用结果
        } catch(Exception e) {
     	   System.out.println("demoCSEService invoke helloworld exception.");
        }
    }
}
