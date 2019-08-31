package com.scrum;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scrum.business.Employee;
import com.scrum.business.EmployeeRepository;
import com.scrum.business.LoginRepository;
import com.scrum.business.Task;
import com.scrum.business.TaskRepository;
import com.scrum.log.LoggerMain;
import com.scrum.mailer.Mailer;

@Controller
public class ScrumController {

	@Autowired
	TaskRepository taskRepo;
	
	@Autowired
	EmployeeRepository empRepo;
	
	@Autowired
	LoginRepository logRepo;

	@GetMapping("/")
	public String hello() {

		LoggerMain.logger.info("Root page called");
		// LoggerMain.logger.warn("New Introduction");
		
		return "login";
	}
	
	@RequestMapping("/particles")
	public String particles() {
		
		return "particles";
	}
	
	@PostMapping("/")
	public String rootMapping(HttpServletRequest request,Model model, @RequestParam(required=false) String type) {

		if("submitemail".equals(type)) {
			return submitMail(request,model);
		}
		else if("dashboard".equals(type)) {
			model.addAttribute("tasks", taskRepo.allTasks());
			return "dailyupdatecapturescreen";
		}
		else if("save".equals(type)) {
			return taskSaveHandler(request,model);
		}else{
			return loginCheck(request,model);
		}
	}
	
	public String submitMail(HttpServletRequest request,Model model) {

		List<String> emailId = empRepo.getMailIds();
		Mailer mailer = new Mailer();
		SimpleDateFormat formatter= new SimpleDateFormat("E d, MMMM 'at' HH:mm z");
		String dateString = formatter.format(new Date(System.currentTimeMillis()));
		for(String email : emailId) {
			String email_message = "Test mail";
			try {
				mailer.sendMail(email,"Scrum summary - "+ dateString, email_message);
			} catch (Exception e) {
				LoggerMain.logger.warn("Exception "+e+" while sending mail to "+email);		
			}
		}
		model.addAttribute("Error", "Session Closed");
		return "login";
	}
	
	public String loginCheck(HttpServletRequest request,Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoggerMain.logger.info("Attepting login username : "+username);
		if(logRepo.verifyUser(username,password)) {
			LoggerMain.logger.info("Login success");
			model.addAttribute("tasks", taskRepo.allTasks());
			return "dailyupdatecapturescreen";
		} else{
			LoggerMain.logger.info("Login failed!" );
			model.addAttribute("Error","Wrong credentials");
			return "login";
		}
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
	@GetMapping("/modify")
	String modifyTasks(Model model) {
		LoggerMain.logger.info("Task addition requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "modify";
	}
	
	@GetMapping("/getx")
	@ResponseBody	
	public  Task modifyTasksPost(@RequestParam String task_id) {
		LoggerMain.logger.info("Task ");
		 System.out.println( taskRepo.getTaskById(task_id));
		return taskRepo.getTaskById(task_id);
		
	}
	
	
	@GetMapping("/addmembers")
	public String addMembers(Model model) {
		LoggerMain.logger.info("Member addition requested");
		model.addAttribute("managerlist", empRepo.specificEmployees("Manager"));
		
		
		return "addmembers";
	}
	
	@PostMapping("/addmembers")
	public String addMember(Model model,@RequestParam String SOEID, @RequestParam String name,@RequestParam String manager,@RequestParam String scrum_master,@RequestParam String role) {
		model.addAttribute("managerlist", empRepo.specificEmployees("Manager"));
		Employee employee = new Employee(name,SOEID,role,scrum_master,manager,"1");
		empRepo.addEmployee(employee);
		
		
		
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
	
	@RequestMapping("/save")
	String taskSaveHandler(HttpServletRequest request, Model model) {
		 Date start_date=Date.valueOf("2019-09-18");
		 Date end_date=Date.valueOf(request.getParameter("end_date"));
		 System.out.println("Date: "+end_date);
		Task t = new Task(request.getParameter("jira_Number"),
				"",request.getParameter("owner"),start_date,end_date,
				request.getParameter("task_status"),request.getParameter("update_space"));
		taskRepo.saveTask(t);
		model.addAttribute("tasks", taskRepo.allTasks());
		return "dailyupdatecapturescreen";
	}
	

}
