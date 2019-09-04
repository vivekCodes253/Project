package com.scrum.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.BasicConfigurator;
import org.springframework.stereotype.Component;

import com.mysql.cj.jdbc.CallableStatement;
import com.scrum.business.Employee;
import com.scrum.business.Task;
import com.scrum.business.TasksData;
import com.scrum.log.LoggerMain;

@Component
public class JDBCops implements TasksData {

	private final String PASSWORD 			= "c0nygre";
	private final String USER_ID 			= "root";
	private final String SCHEMA				= "scrum";
	private final String PORT			 	= "3306";
	private final String CONNECTION_URL 	= "jdbc:mysql://localhost:" + PORT + "/" + SCHEMA + "?useSSL="
			+ "false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

	private Connection cn;
	private Statement st;
	private ResultSet rs;

	private void init() throws Exception {
		try {
			Driver d = new com.mysql.cj.jdbc.Driver();
			DriverManager.registerDriver(d);
			cn = DriverManager.getConnection(CONNECTION_URL, USER_ID, PASSWORD);
			st = cn.createStatement();
		} catch (Exception e) {
			LoggerMain.logger.error(e+"");
		}
	}

	private void closeConnection() {
		if (cn != null) {
			try {
				if (!cn.isClosed())
					cn.close();
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
				LoggerMain.logger.error(ex+"");
			}
		}
	}

	@Override
	public List<Task> allTasks(String username) {
		List<Task> Tasks = new ArrayList<>();
		try {
			LoggerMain.logger.info("All tasks requested");
			Driver d = new com.mysql.cj.jdbc.Driver();
			DriverManager.registerDriver(d);
			cn = DriverManager.getConnection(CONNECTION_URL, USER_ID, PASSWORD);
			CallableStatement cStmt = null;
			String plsql = "{CALL getAllTask(?)}";
			cStmt = (CallableStatement) cn.prepareCall(plsql);
			cStmt.setString(1, username);
			rs = cStmt.executeQuery();
			System.out.println("Callable statement");
			while (rs.next()) {
				Tasks.add(new Task(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}

		return Tasks;
	}

	@Override
	public List<Employee> allEmployee(String username) {
		List<Employee> Employee = new ArrayList<>();
		try {
			BasicConfigurator.configure();
			init();
			LoggerMain.logger.info("All tasks requested");
			rs = st.executeQuery(
					"SELECT name, soeid , role , sec_scrum , manager_soeid , project_id FROM employees WHERE manager_soeid='"
							+ username + "'");
			while (rs.next()) {
				Employee.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6)));
				System.out.println("Hello employee " + rs.getString(1));
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}
		return Employee;
	}

	@Override
	public List<Employee> specificEmployees(String type) {
		List<Employee> Employee = new ArrayList<>();
		try {
			init();
			BasicConfigurator.configure();
			LoggerMain.logger.info("All tasks requested");
			rs = st.executeQuery(
					"SELECT name, soeid , role , sec_scrum , manager_soeid , project_id FROM employees where role = '"
							+ type + "'");
			while (rs.next()) {
				Employee.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6)));
				System.out.println("hello "+ rs.getString(1));
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}

		return Employee;
	}

	@Override
	public void addEmployee(Employee employee) {
		try {
			init();
			PreparedStatement st = cn
					.prepareStatement("insert into Employees(soeid,name,role,Sec_scrum,manager_soeid,project_id)  "
							+ "values(?,?,?,?,?,?)");
			st.setString(1, employee.getSoeid());
			st.setString(2, employee.getName());
			st.setString(3, employee.getRole());
			st.setString(4, employee.getSecondary_scrum());
			st.setString(5, employee.getManager_id());
			st.setString(6, employee.getProject_id());

			st.executeUpdate();
		} catch (Exception ex) {
			LoggerMain.logger.error(ex+"");
		}
	}

	@Override
	public boolean verifyUser(String username, String hash) {
		try {
			init();
			PreparedStatement st = cn
					.prepareStatement("SELECT username,password FROM login WHERE username=? and password=?");
			st.setString(1, username);
			st.setString(2, hash);

			rs = st.executeQuery();
			rs.last();

			int noOfResults = rs.getRow();
			return (noOfResults > 0);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}
		return false;
	}

	@Override
	public Task taskById(String taskId) {
		Task task = null;
		try {
			init();
			LoggerMain.logger.info("Task searhed by id " + taskId);
			rs = st.executeQuery("SELECT jira_no,task_name,owner,start_date,end_date,"
					+ "task_status,update_space FROM Task_details where jira_no='" + taskId + "'");
			rs.first();
			return (new Task(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
					rs.getString(6), rs.getString(7)));

		} catch (Exception ex) {
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}

		return task;

	}

	@Override
	public Task editTask(Task task) {
		try {
			init();
			PreparedStatement st = cn.prepareStatement(
					"UPDATE task_details SET task_status = ?, update_space = ? WHERE " + "jira_no = ?");
			st.setString(1, task.getTask_status());
			st.setString(2, task.getUpdate_space());
			st.setString(3, task.getJira_Number());
			st.executeUpdate();

			PreparedStatement st1 = cn
					.prepareStatement("INSERT INTO update_details(Jira_no,owner,update_space) VALUES(?,?,?)");
			st1.setString(1, task.getJira_Number());
			st1.setString(2, task.getOwner());
			st1.setString(3, task.getUpdate_space());
			st1.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			closeConnection();
		}
		return task;
	}

	public List<String> getEmployeeEmailIds() {
		List<String> mailIds = new ArrayList<>();
		try {
			init();
			LoggerMain.logger.info("Employee mail ids requested");
			rs = st.executeQuery("SELECT email_id FROM employeemail");

			while (rs.next()) {
				mailIds.add(rs.getString(1));
				// System.out.println("Hello " + rs.getString(1));
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}
		return mailIds;
	}

	public String getEmployeeBySOEID(String SOEID) {
		try {
			init();
			rs = st.executeQuery("SELECT name FROM employees where soeid = '" + SOEID + "'");

			while (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex+"");
			return "";
		} finally {
			closeConnection();
		}
		return "";
	}

	public void addTasks(List<Task> tasks) {
		try {
			init();
			PreparedStatement st;
			for (Task task : tasks) {
				st = cn.prepareStatement(
						"insert into task_details(Jira_no,task_name,Owner,start_date,end_date,task_status,update_space)  "
								+ "values(?,?,?,?,?,?,?)");
				st.setString(1, task.getJira_Number());
				st.setString(2, task.getTask_name());
				st.setString(3, task.getOwner());
				st.setDate(4, new java.sql.Date(task.getStart_date().getTime()));
				st.setDate(5, new java.sql.Date(task.getEnd_date().getTime()));
				st.setString(6, task.getTask_status());
				st.setString(7, task.getUpdate_space());

				st.executeUpdate();
			}
		} catch (Exception ex) {
			LoggerMain.logger.error(ex+"");
		} finally {
			closeConnection();
		}

	}

	public void modifyTaskOwner(Task task) {
		System.out.println("Hell");
		try {
			init();
			PreparedStatement st = cn.prepareStatement("UPDATE task_details SET owner=? WHERE " + "jira_no = ?");
			st.setString(1, task.getOwner());
			st.setString(2, task.getJira_Number());
			st.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			closeConnection();
		}

	}
}
