package com.scrum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.scrum.log.LoggerMain;

@SpringBootApplication
public class ScrumApplication {

	public static void main(String[] args) {
		LoggerMain loggermain = new LoggerMain();
		SpringApplication.run(ScrumApplication.class, args);
	}

}
