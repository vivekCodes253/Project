package com.scrum.business;

public class Employee {
	String name;
	String soeid;
	String role;
	String secondary_scrum;
	String manager_id;
	String project_id;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSoeid() {
		return soeid;
	}

	public void setSoeid(String soeid) {
		this.soeid = soeid;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getSecondary_scrum() {
		return secondary_scrum;
	}

	public void setSecondary_scrum(String secondary_scrum) {
		this.secondary_scrum = secondary_scrum;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public Employee(String name, String soeid, String role, String secondary_scrum, String manager_id,
			String project_id) {
		this.name = name;
		this.soeid = soeid;
		this.role = role;
		this.secondary_scrum = secondary_scrum;
		this.manager_id = manager_id;
		this.project_id = project_id;
	}

	public Employee() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Employee [name=" + name + ", soeid=" + soeid + ", role=" + role + ", secondary_scrum=" + secondary_scrum
				+ ", manager_id=" + manager_id + ", project_id=" + project_id + "]";
	}

}
