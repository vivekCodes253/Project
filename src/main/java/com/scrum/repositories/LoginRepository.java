package com.scrum.repositories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scrum.jdbc.JDBCops;

@Service
public class LoginRepository {

	JDBCops jdbctasks;

	@Autowired
	public LoginRepository(JDBCops jdbctasks) {

		this.jdbctasks = jdbctasks;
	}

	public LoginRepository() {
	}; // testing

	public boolean verifyUser(String username, String hash) {
		return jdbctasks.verifyUser(username, hash);
	}

}
