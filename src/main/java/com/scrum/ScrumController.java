package com.scrum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scrum.business.Employee;
import com.scrum.business.EmployeeRepository;
import com.scrum.business.TaskRepository;
import com.scrum.log.LoggerMain;

@Controller
public class ScrumController {

	@Autowired
	TaskRepository taskRepo;
	
	@Autowired
	EmployeeRepository empRepo;

	@RequestMapping("/")
	public String hello() {

		LoggerMain.logger.info("Root page called");
		// LoggerMain.logger.warn("New Introduction");
		
		return "login";
	}

	@RequestMapping("/tasks")
	String taskHandler(Model model) {
		LoggerMain.logger.info("All tasks requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "tasks";
	}

	@RequestMapping("/addtasks")
	String addTasks(Model model) {
		LoggerMain.logger.info("Task addition requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "addtasks";
	}
	@RequestMapping("/modify")
	String modifyTasks(Model model) {
		LoggerMain.logger.info("Task addition requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "modify";
	}
	
	@GetMapping("/addmembers")
	public String addMembers(Model model) {
		LoggerMain.logger.info("Member addition requested");
		model.addAttribute("managerlist", empRepo.specificEmployees("Manager"));
		
		
		return "addmembers";
	}
	
	@PostMapping("/addmembers")
	public String addMember(Model model,@RequestParam String SOEID, @RequestParam String name,@RequestParam String manager,@RequestParam String scrum_master,@RequestParam String role) {
		
		Employee employee = new Employee(name,SOEID,role,scrum_master,manager,"1");
		empRepo.addEmployee(employee);
		
		System.out.println();
		
		return "addmembers";
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
