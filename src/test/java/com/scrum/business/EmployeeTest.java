package com.scrum.business;

import org.junit.Assert;
import org.junit.Test;



public class EmployeeTest {
	
	@Test
	public void testName() {
		Employee e = new Employee();
		e.setName("reema");
		Assert.assertEquals(e.getName(),"reema");
	}
	
	@Test
	public void testSoeid() {
		Employee e = new Employee();
		e.setSoeid("BS65643");
		Assert.assertEquals(e.getSoeid(),"BS65643");
	}
	
	@Test
	public void testRole() {
		Employee e = new Employee();
		e.setRole("manager");
		Assert.assertEquals(e.getRole(),"manager");
	}
	
	@Test
	public void testSecondary_scrum() {
		Employee e = new Employee();
		e.setSecondary_scrum("YES");
		Assert.assertEquals(e.getSecondary_scrum(),"YES");
	}
	
	@Test
	public void testManager_id() {
		Employee e = new Employee();
		e.setManager_id("BS65643");
		Assert.assertEquals(e.getManager_id(),"BS65643");
	}
	
	@Test
	public void testProject_id() {
		Employee e = new Employee();
		e.setProject_id("BS65643");
		Assert.assertEquals(e.getProject_id(),"BS65643");
	}

}
