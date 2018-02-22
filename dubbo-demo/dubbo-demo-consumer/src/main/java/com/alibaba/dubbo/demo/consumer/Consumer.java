package com.alibaba.dubbo.demo.consumer;

import com.alibaba.dubbo.demo.DemoService;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by ken.lj on 2017/7/31.
 */
public class Consumer {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "META-INF/spring/dubbo-demo-consumer.xml" });
		context.start();

		DemoService demoService = (DemoService) context.getBean("demoService"); // 获取远程服务代理
		try {
			String str = System.getProperty("RUNNUM");
			int count = 10000;
			if (str != null) {
				count = Integer.parseInt(str);
			}
			boolean perfTest = false;
			str = System.getProperty("PERFTEST");
			if (str != null) {
				perfTest = true;
				 System.out.println("------invoke times is %d" + String.valueOf(count));
			} 
			
			long start = System.currentTimeMillis();
            boolean bPrint = false;
            str = System.getProperty("PRINTINFO");
			if (str != null) {
				bPrint = true;
			} 
			String hello = "";
			while (true) {
				// System.out.println("begin invoke -----"); // 显示调用结果
				try {
					hello = demoService.sayHello("world"); // 执行远程方法
				} catch (Exception e) {
					System.out.println("sayHello exception --------" + e);
					try {
						Thread.sleep(1000);
					} catch (Exception b) {
					}
				}
				if (perfTest) {
					count--;
					if (bPrint) {
						System.out.println("dubbo consume sayHello:" + hello); // 显示调用结果
					}
					if (count <= 0) {
						break;
					}
				} else {
					System.out.println("dubbo consume sayHello:" + hello); // 显示调用结果
					try {
						Thread.sleep(5000);
					} catch (Exception b) {
					}
				}

			}
			long end = System.currentTimeMillis(); // 获取结束时间
			System.out.println("-----run time ： " + (end - start) + "ms");

		} catch (Exception e) {

		}

	}
}
