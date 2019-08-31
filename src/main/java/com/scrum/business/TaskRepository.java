package com.scrum.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scrum.jdbc.JDBCops;

@Service
public class TaskRepository {

	JDBCops jdbctasks;

	@Autowired
	public TaskRepository(JDBCops jdbctasks) {
	
		this.jdbctasks = jdbctasks;
	}
	
	public List<Task> allTasks()
	{
		return jdbctasks.allTasks();
	}
	
	public Task getTaskById(String taskId) {
		return jdbctasks.taskById(taskId);
		
	}
	public Task saveTask(Task t) {
		return jdbctasks.editTask(t);
	}
	
}
