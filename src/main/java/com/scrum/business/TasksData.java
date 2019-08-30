package com.scrum.business;

import java.util.List;


public interface TasksData {

	public List<Task> allTasks();
	public List<Employee> allEmployee();
	List<Employee> specificEmployees(String type);
	void addEmployee(Employee employee);
	public boolean verifyUser(String username, String password);
}
