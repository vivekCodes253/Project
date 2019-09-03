package com.scrum.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;
import com.scrum.misc.DateTimeOps;

@Service
public class TaskRepository {

	JDBCops jdbctasks;

	@Autowired
	public TaskRepository(JDBCops jdbctasks) {
	
		this.jdbctasks = jdbctasks;
	}
	
	public TaskRepository() {} //testing
		
	
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
	
	public int getDeadlineTasksCount(List<Task> tasks) {
		int count = 0;
		Date date;
		Date today = new Date();
		for(Task task : tasks) {
			date = task.getEnd_date();
			System.out.println(today+" "+date);
			if(DateTimeOps.getDifferenceDays(today,date)<4)
				count++;
		}
		return count;
	}
	
	public int getDeadlineTasksCountFromDate(List<Task> tasks, Date today) {
		int count = 0;
		Date date;
		
		for(Task task : tasks) {
			date = task.getEnd_date();
			System.out.println(today+" "+date);
			if(DateTimeOps.getDifferenceDays(today,date)<4)
				count++;
		}
		return count;
	}

	public int getTodayTasksCount(List<Task> tasks) {
		int count = 0;
		Date date;
		Date today = new Date();
		for(Task task : tasks) {
			date = task.getEnd_date();
			System.out.println(today+" "+date);
			if(DateTimeOps.getDifferenceDays(today,date)<1)
				count++;
		}
		return count;
	}
	
}
