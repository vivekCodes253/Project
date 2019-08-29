package com.scrum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scrum.log.LoggerMain;


@Controller
public class ScrumController {
	LoggerMain lm = new LoggerMain();
	
	@RequestMapping("/")
	public String hello() {	
		LoggerMain.logger.warn("New Introduction");
		return "Landing";
	}
	
	
}
