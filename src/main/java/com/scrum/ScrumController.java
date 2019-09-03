package com.scrum;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scrum.business.Employee;
import com.scrum.business.Task;
import com.scrum.log.LoggerMain;
import com.scrum.mailer.Mailer;
import com.scrum.repositories.EmployeeRepository;
import com.scrum.repositories.LoginRepository;
import com.scrum.repositories.TaskRepository;

@Controller
public class ScrumController {

	@Autowired
	TaskRepository taskRepo;
	
	@Autowired
	EmployeeRepository empRepo;
	
	@Autowired
	LoginRepository logRepo;


	/* Function Name 	: landingPage
	 * Purpose 			: Redirects Get mappings to login page
	 * Input 			: -
	 * Return 			: String mapping to login page*/
	@GetMapping("/")
	public String landingPage() {
		LoggerMain.logger.info("Login page called");
		return "login";
	}
	
	
	/* Function Name 	: landingPagePost
	 * Purpose 			: Redirects Post mappings to login and dashboard page
	 * Input 			: Model, request objects : type hidden html object value to redirect to correct page
	 * Return 			: String mapping to multiple pages page*/
	@PostMapping("/")
	public String landingPagePost(HttpServletRequest request,Model model, @RequestParam(required=false) String type) {

		if("submitemail".equals(type)) {
			return submitMail(request,model);
		}
		else if("addtask".equals(type)) {
			return "";
		}
		else if("editpage".equals(type)) {
			return addMembers(request,model);
		}
		else if("dashboard".equals(type)) {
			return dailyUpdateScreenDisplay(request,model);
		}
		else if("save".equals(type)) {
			return taskSaveHandler(request,model);
		} else {
			return loginCheck(request,model);
		}
	}
	
	
	/* Function Name 	: dailyUpdateScreenDisplay
	 * Purpose 			: Redirects dashboard page
	 * Input 			: Model object
	 * Return 			: String mapping to dashboard page*/
	@RequestMapping("/dashboard")
	public String dailyUpdateScreenDisplay(HttpServletRequest request,Model model) {
		String username;
		username=(String) request.getSession().getAttribute("username");
		if(username == null)
		{
			return "login";
		}
		else
		{
		LoggerMain.logger.info("Dashboard page called");
		List<Task> tasks = taskRepo.allTasks();
		model.addAttribute("tasks", tasks);
		model.addAttribute("taskcount",tasks.size());
		model.addAttribute("members",empRepo.getEmployeeNames(tasks));
		model.addAttribute("deadlinetaskcount",taskRepo.getDeadlineTasksCount(tasks));
		model.addAttribute("todaytaskcount",taskRepo.getTodayTasksCount(tasks));
		return "dailyupdatecapturescreen";
		}
	}
	

	/* Function Name 	: addtasks
	 * Purpose 			: Redirects Add Tasks page
	 * Input 			: Model object
	 * Return 			: String mapping to Add Tasks page*/
	@RequestMapping("/addtasks")
	String addTasks(HttpServletRequest request,Model model) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
		LoggerMain.logger.info("Task addition requested");
		model.addAttribute("employeelist",empRepo.allEmployee());
		return "addtasks";
		}
	}
	
	
	/* Function Name 	: modifyTasks
	 * Purpose 			: Redirects Modify Tasks page
	 * Input 			: Model object
	 * Return 			: String mapping to Modify Tasks page*/
	@GetMapping("/modify")
	String modifyTasks(HttpServletRequest request,Model model) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
		LoggerMain.logger.info("Task modification requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "modify";
		}
	}
	
	
	/* Function Name 	: modifyTaskTaskData
	 * Purpose 			: Asynchronously loads task data onto modify page - AJAX
	 * Input 			: Requested task id
	 * Return 			: JSON object of required task*/
	@GetMapping("/getTaskDetails")
	@ResponseBody	
	public  Task modifyTasksTaskData(HttpServletRequest request,@RequestParam String task_id) {
		LoggerMain.logger.info("Task "+task_id+" loaded for modification");
		return taskRepo.getTaskById(task_id);	
	}
	
	
	/* Function Name 	: addMembers
	 * Purpose 			: Redirects to Add Members page
	 * Input 			: Model object
	 * Return 			: String mapping to Add Members page*/
	@GetMapping("/addmembers")
	public String addMembers(HttpServletRequest request,Model model) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
		LoggerMain.logger.info("Member addition requested");
		model.addAttribute("managerlist", empRepo.specificEmployees("Manager"));
		return "addmembers";
		}
	}
	
	
	/* Function Name 	: addMembersPost
	 * Purpose 			: Redirects to Add Members page after saving the passed new employee
	 * Input 			: Model object
	 * Return 			: String mapping to Add Members page*/
	@PostMapping("/addmembers")
	public String addMembersPost(HttpServletRequest request,Model model,@RequestParam String SOEID, @RequestParam String name,
			@RequestParam String manager,@RequestParam String scrum_master,@RequestParam String role) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
		Employee employee = new Employee(name,SOEID,role,scrum_master,manager,"1");
		empRepo.addEmployee(employee);
		LoggerMain.logger.info("New employee "+name+" SOEID : "+SOEID+" added!");
		return addMembers(request,model);
		}
	}
	
	
	/* Function Name 	: submitMail
	 * Purpose 			: Sends email to all registered users with summary - TODO summary
	 * Input 			: HTTPRequest object, Model object
	 * Return 			: String mapping to login page*/
	public String submitMail(HttpServletRequest request,Model model) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
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
	}
	
	/* Function Name 	: loginCheck
	 * Purpose 			: Validated user login
	 * Input 			: HTTPRequest object, Model object
	 * Return 			: String mapping to login page if fail else maps to dashboard*/
	public String loginCheck(HttpServletRequest request,Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoggerMain.logger.info("Attepting login username : "+username);
		if(logRepo.verifyUser(username,password)) {
			LoggerMain.logger.info("Login success");
			request.getSession().setAttribute("username", username);
			return dailyUpdateScreenDisplay(request,model);
		} else{
			LoggerMain.logger.info("Login failed!" );
			model.addAttribute("Error","Wrong credentials");
			return "login";
		}
	}

	
	/* Function Name 	: taskSavveHandler
	 * Purpose 			: Saves updates to tasks
	 * Input 			: HTTPRequest object, Model object
	 * Return 			: String mapping to dashboard page*/
	@RequestMapping("/save")
	String taskSaveHandler(HttpServletRequest request, Model model) {
		String username=(String) request.getSession().getAttribute("username");
		if(username==null)
		{
			return "login";
		}
		else
		{
		Date start_date=Date.valueOf("2019-09-18");		//dummy date value
		Date end_date=Date.valueOf(request.getParameter("end_date"));
		Task t = new Task(request.getParameter("jira_Number"),
				"",request.getParameter("owner"),start_date,end_date,
				request.getParameter("task_status"),request.getParameter("update_space"));
		taskRepo.saveTask(t);
		return dailyUpdateScreenDisplay(request,model);
		}
	}
	
	
	
	//-----------DEBUG CODES-------------------------
	@RequestMapping("/particles")
	public String particles() {
		
		return "particles";
	}
	
	@RequestMapping("/tasks")
	String taskHandler(Model model) {
		//LoggerMain.logger.info("All tasks requested");
		model.addAttribute("tasks", taskRepo.allTasks());
		return "tasks";
	}
	
	@RequestMapping("/dashboarddebug")
	public String dashboard() {
		// LoggerMain.logger.warn("New Introduction");
		return "dashboard";
	}
	
	@RequestMapping("/template")
	public String nytemplate() {
		// LoggerMain.logger.warn("New Introduction");
		return "templatex";
	}
	
	//-----------DEBUG CODES-------------------------
}
