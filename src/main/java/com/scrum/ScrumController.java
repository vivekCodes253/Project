package com.scrum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scrum.business.TaskRepository;
import com.scrum.log.LoggerMain;

@Controller
public class ScrumController {

	@Autowired
	TaskRepository taskRepo;

	@RequestMapping("/")
	public String hello() {

		LoggerMain.logger.info("Root page called");
		// LoggerMain.logger.warn("New Introduction");
		return "particles";
	}

	@RequestMapping("/tasks")
	String taskHandler(Model model) {
		LoggerMain.logger.info("All tasks requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "tasks";
	}

	@RequestMapping("/addtasks")
	public String addTasks() {
		LoggerMain.logger.info("Task addition requested");
		// LoggerMain.logger.warn("New Introduction");
		return "addtask";
	}
	
	@RequestMapping("/template")
	public String nytemplate() {
		// LoggerMain.logger.warn("New Introduction");
		return "templatex";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		// LoggerMain.logger.warn("New Introduction");
		return "dashboard";
	}

}
