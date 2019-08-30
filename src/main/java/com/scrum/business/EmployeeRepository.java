package com.scrum.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scrum.jdbc.JDBCops;

@Service
public class EmployeeRepository {

	JDBCops jdbctasks;

	@Autowired
	public EmployeeRepository(JDBCops jdbctasks) {
	
		this.jdbctasks = jdbctasks;
	}
	
	public List<Employee> allEmployee()
	{
		return jdbctasks.allEmployee();
	}
	
	public List<Employee> specificEmployees(String type)
	{
		return jdbctasks.specificEmployees(type);
	}
	
	public void addEmployee(Employee employee) {
		jdbctasks.addEmployee(employee);
	}
	
	
	
}
