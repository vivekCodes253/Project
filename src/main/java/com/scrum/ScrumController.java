package com.scrum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scrum.business.TaskRepository;
import com.scrum.log.LoggerMain;


@Controller
public class ScrumController {
	LoggerMain lm = new LoggerMain();
	
	@Autowired
	TaskRepository taskRepo;
	
	@RequestMapping("/")
	public String hello() {	
		//LoggerMain.logger.warn("New Introduction");
		return "particles";
	}
	
	@RequestMapping("/tasks")
	String taskHandler(Model model) {
		model.addAttribute("tasks", taskRepo.allTasks());
		return "tasks";
	}
	
	@RequestMapping("/addTasks")
	public String addTasks() {	
		//LoggerMain.logger.warn("New Introduction");
		return "AddTask";
	}
	
}
