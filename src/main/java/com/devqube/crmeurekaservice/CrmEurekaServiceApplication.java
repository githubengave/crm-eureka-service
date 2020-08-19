package com.devqube.crmeurekaservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class CrmEurekaServiceApplication {
	public static void main(String[] args) {
		SpringApplication.run(CrmEurekaServiceApplication.class, args);
	}

}
