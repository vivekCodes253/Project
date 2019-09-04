package com.scrum.business;

import java.util.List;

public interface TasksData {

	public List<Task> allTasks(String username);

	public List<Employee> allEmployee(String username);

	List<Employee> specificEmployees(String type);

	String addEmployee(Employee employee);

	public boolean verifyUser(String username, String password);

	public Task taskById(String task_id);

	public Task editTask(Task t);
}