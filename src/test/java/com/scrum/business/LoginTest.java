package com.scrum.business;

import org.junit.Assert;
import org.junit.Test;

public class LoginTest {

	@Test
	public void testUsername() {
		Login login = new Login();
		login.setUsername("SR45678");
		Assert.assertEquals(login.getUsername(),"SR45678");
	}
	
	@Test
	public void testPassword() {
		Login login = new Login();
		login.setPassword("45678");
		Assert.assertEquals(login.getPassword(),"45678");
	}
}
