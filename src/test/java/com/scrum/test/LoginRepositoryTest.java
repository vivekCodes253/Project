package com.scrum.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;
import com.scrum.repositories.LoginRepository;
import com.scrum.repositories.TaskRepository;

public class LoginRepositoryTest {

	@Mock
	private JDBCops jdbcops;

	@Rule
	public MockitoRule rule = MockitoJUnit.rule();
	
	@Test
	public void testTrueVerifyUser() {
		LoginRepository loginrepo = new LoginRepository(jdbcops);
		Mockito.when(jdbcops.verifyUser("BS67895","123")).thenReturn(true);
		Boolean actual = loginrepo.verifyUser("BS67895","123");
		Assert.assertEquals(true, actual);
		Mockito.verify(jdbcops).verifyUser("BS67895","123");
	}
	
	@Test
	public void testFalseVerifyUser() {
		LoginRepository loginrepo = new LoginRepository(jdbcops);
		Mockito.when(jdbcops.verifyUser("BS67895","xxxx")).thenReturn(false);
		Boolean actual = loginrepo.verifyUser("BS67895","xxxx");
		Assert.assertEquals(false, actual);
		Mockito.verify(jdbcops).verifyUser("BS67895","xxxx");
	}
}
