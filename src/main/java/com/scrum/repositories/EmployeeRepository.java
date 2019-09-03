package com.scrum.repositories;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scrum.business.Employee;
import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;
import com.scrum.misc.DateTimeOps;

@Service
public class EmployeeRepository {

	JDBCops jdbctasks;

	@Autowired
	public EmployeeRepository(JDBCops jdbctasks) {
	
		this.jdbctasks = jdbctasks;
	}
	
	public EmployeeRepository() {};		//For testing
	
	public List<Employee> allEmployee(String username)
	{
		return jdbctasks.allEmployee(username);
	}
	
	public List<Employee> specificEmployees(String type)
	{
		return jdbctasks.specificEmployees(type);
	}
	
	public void addEmployee(Employee employee) {
		jdbctasks.addEmployee(employee);
	}

	public List<String> getMailIds() {
		
		return jdbctasks.getEmployeeEmailIds();
	}

	public List<String> getEmployeeNames(List<Task> allTasks) {
		
		List<String> names = new ArrayList<>();
		for(Task task : allTasks) {
			names.add(jdbctasks.getEmployeeBySOEID(task.getOwner()));
		}
		return names;
	}

	public Employee getFreeEmployeeNames() {
		
		return jdbctasks.getFreeEmployees();
	}

	
	
	
	
}
