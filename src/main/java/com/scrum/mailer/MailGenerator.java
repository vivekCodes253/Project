package com.scrum.mailer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;

public class MailGenerator {

	private static JDBCops jdbctasks = new JDBCops();

	public static String generateSummary(String username, Map<String, String[]> attendees, String dateString, String scrumMaster) {

		List<Task> tasks = jdbctasks.allTasks(username);
		List<String> present = new ArrayList<>();
		List<String> absent = new ArrayList<>();
		for (Map.Entry<String, String[]> entry : attendees.entrySet()) {
			if("present".equals(entry.getValue()[0]))
				present.add(entry.getKey());
			else if("absent".equals(entry.getValue()[0]))
				absent.add(entry.getKey());
				
		}
		StringBuilder sb = new StringBuilder();
		sb.append("<head><style>td,th{border: 1px solid black;} table{border-collapse:collapse;}</style><H2>Scrum Summary</H2>-"+dateString+"<br><H3>Attended by</H3><ul>");
		sb.append("<li>"+scrumMaster+" - Scrum Master</li>");
		for(String name : present) {
			sb.append("<li>"+name+"</li>");
		}
		sb.append("</ul><h3>Task Status</h3><table><tr><th>Jira</th><th>Owner</th><th>Task Name</th><th>Status</th><th>Update</th></tr>");
		
		for (Task task : tasks) {
			sb.append("<tr><td>" + task.getJira_Number() + "</td><td>" + task.getOwner() + "</td><td>"
					+ task.getTask_name() + "</td><td>" + task.getTask_status() + "</td><td>" + task.getUpdate_space()+"</td></tr>");

		}
		sb.append("</table><br>With Regards,<br>FXLM 19");
		return sb.toString();
	}
}
