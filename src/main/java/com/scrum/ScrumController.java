package com.scrum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scrum.log.LoggerMain;


@Controller
public class ScrumController {
	
	@RequestMapping("/")
	public String hello() {
		LoggerMain lm = new LoggerMain();
		LoggerMain.logger.warn("New Intro");
		return "Landing";
	}
}
