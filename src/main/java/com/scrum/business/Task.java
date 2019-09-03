package com.scrum.business;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Task {
	private String jira_Number;
	private String task_name;
	private String owner;
	private Date start_date;
	private Date end_date;
	private String task_status;
	private String update_space;

	public Task() {
		
	}
	public String getJira_Number() {
		return jira_Number;
	}

	public void setJira_Number(String jira_Number) {
		this.jira_Number = jira_Number;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}

	public String getUpdate_space() {
		return update_space;
	}

	public void setUpdate_space(String update_space) {
		this.update_space = update_space;
	}

	public Task(String jira_Number, String task_name, String owner, Date start_date, Date end_date, String task_status,
			String update_space) {

		this.jira_Number = jira_Number;
		this.task_name = task_name;
		this.owner = owner;
		this.start_date = start_date;
		this.end_date = end_date;
		this.task_status = task_status;
		this.update_space = update_space;
	}

	public Task(String jira_Number, String task_name, String owner, String start_date, String end_date,
			String task_status, String update_space) {
		Date start_date_date = null, end_date_date = null;
		try {
			start_date_date = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
		} catch (ParseException e) {
			start_date_date = new Date();
		}
		try {
			end_date_date = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
		} catch (ParseException e) {
			end_date_date = new Date();
		}
		this.jira_Number = jira_Number;
		this.task_name = task_name;
		this.owner = owner;
		this.start_date = start_date_date;
		this.end_date = end_date_date;
		this.task_status = task_status;
		this.update_space = update_space;
	}

	@Override
	public String toString() {
		return "Task [jira_Number=" + jira_Number + ", task_name=" + task_name + ", owner=" + owner + ", start_date="
				+ start_date + ", end_date=" + end_date + ", task_status=" + task_status + ", update_space="
				+ update_space + "]";
	}

}