package com.scrum.mailer;

import java.util.List;

import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;

public class MailGenerator {
	
	private static JDBCops jdbctasks = new JDBCops();
	
	public static String generateSummary(String username) {
		
		List<Task> tasks = jdbctasks.allTasks(username);
		StringBuilder sb = new StringBuilder();
		for (Task task : tasks) {
			sb.append("\nJIRA : " +task.getJira_Number()+  "Task Owner" +task.getOwner() +" Task name : "+task.getTask_name() + " Status" + task.getUpdate_space() + " End Date " + task.getEnd_date());
			
		}
		return sb.toString() ;
		//return null;
	}
}
