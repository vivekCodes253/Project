package com.scrum.jdbc;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.scrum.business.Task;
import com.scrum.business.TasksData;
import com.scrum.log.LoggerMain;

@Component
public class JDBCops implements TasksData {

	private final String PASSWORD = "c0nygre";
	private final String USER_ID = "root";
	private final String SCHEMA = "scrum";
	private final String PORT = "3306";
	private final String CONNECTION_URL = "jdbc:mysql://localhost:" + PORT + "/" + SCHEMA + "?useSSL="
			+ "false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

	private Connection cn;
	private Statement st;
	private ResultSet rs;

	private void init() throws Exception {
		Driver d = new com.mysql.cj.jdbc.Driver();
		DriverManager.registerDriver(d);
		cn = DriverManager.getConnection(CONNECTION_URL, USER_ID, PASSWORD);
		st = cn.createStatement();
	}

	private void closeConnection() {
		if (cn != null) {
			try {
				if (!cn.isClosed())
					cn.close();
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
				LoggerMain.logger.error(ex);
			}
		}
	}

	@Override
	public List<Task> allTasks() {
		List<Task> Tasks = new ArrayList<>();
		try {
			init();
			LoggerMain.logger.info("All tasks requested");
			rs = st.executeQuery("SELECT jira_no,task_name,owner,start_date,end_date,"
					+ "task_status,update_space FROM Task_details");

			while (rs.next()) {
				Tasks.add(new Task(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
						rs.getString(6), rs.getString(7)));
				System.out.println("Hello " + rs.getString(1));
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			LoggerMain.logger.error(ex);
		} finally {
			closeConnection();
		}

		return Tasks;
	}
}

//	@Override
//	public Contact getContactById(int id) {
//		try{
//			init();
//			PreparedStatement st = cn.prepareStatement("SELECT id, name, phone FROM Contact WHERE id=?");
//			st.setInt(1, id);
//			rs = st.executeQuery();
//			while (rs.next()) { 
//				contact = new Contact(rs.getInt(1),rs.getString(2),rs.getString(3));
//			}
//		}
//		catch(Exception ex){
//			System.out.println(ex.getMessage());
//	LoggerMain.logger.error(ex);
//		}
//		finally{
//			closeConnection();
//		}
//		return contact;
//	}
//
//	@Override
//	public Contact editContact(Contact contacts) {
//			try{
//			init();
//			PreparedStatement st = cn.prepareStatement("UPDATE Contact SET Name = ?, Phone = ? WHERE " + 
//			"ID = ?");
//			st.setString(1, contacts.getName());
//			st.setString(2, contacts.getPhone());
//			st.setInt(3, contacts.getId());
//			st.executeUpdate();
//		}
//		catch(Exception ex){
//			System.out.println(ex.getMessage());
//	LoggerMain.logger.error(ex);
//		}
//		finally{
//			closeConnection();
//		}
//		return contacts;
//	}
//
//	@Override
//	public void deleteContact(int id) {
//		try{
//			init();
//			PreparedStatement st = cn.prepareStatement("delete from Contact WHERE " + 
//			"ID = ?");
//			st.setInt(1,id);
//			st.executeUpdate();
//		}
//		catch(Exception ex){
//			System.out.println(ex.getMessage());
// LoggerMain.logger.error(ex);
//		}
//		finally{
//			closeConnection();
//		}	
//	}
//
//	@Override
//	public void addContact(Contact contact) {
//		try{
//			init();
//			PreparedStatement st = cn.prepareStatement("insert into Contact(name,phone)  " + 
//			"values(?,?)");
//			st.setString(1,contact.getName());
//			st.setString(2, contact.getPhone());
//			st.executeUpdate();
//		}
//		catch(Exception ex){LoggerMain.logger.error(ex);
