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

@Component
public class JDBCops implements DataOps{
	
	private final String PASSWORD 		= 	"c0nygre";
	private final String USER_ID 		= 	"root";
	private final String SCHEMA			=	"";
	private final String PORT			=	"3306";
	private final String CONNECTION_URL = 	"jdbc:mysql://localhost:"+PORT+"/"+SCHEMA+"?useSSL=" +
										"false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	
	private Connection cn;
	private Statement st;
	private ResultSet rs;
	//private Contact contact;
	
	private void init() throws Exception {
		Driver d = new com.mysql.cj.jdbc.Driver();
		DriverManager.registerDriver(d);
		cn = DriverManager.getConnection(CONNECTION_URL,USER_ID,PASSWORD);
		st = cn.createStatement();
	}
	
	private void closeConnection() {
		if(cn != null){
			try{
				if(!cn.isClosed())
					cn.close();
			}
			catch(Exception ex){
				System.out.println(ex.getMessage());
			}
		}
	}
	
	
}
