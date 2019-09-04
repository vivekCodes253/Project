package com.scrum.business;
import java.sql.Date;


import org.junit.Assert;
import org.junit.Test;


public class TaskTest {
	
	@Test
	public void testJira_Number() {
		Task t = new Task();
		t.setJira_Number("FX1234");
		Assert.assertEquals(t.getJira_Number(),"FX1234");
	}
	
	@Test
	public void testTask_name() {
		Task t = new Task();
		t.setTask_name("FXTrade");
		Assert.assertEquals(t.getTask_name(),"FXTrade");
	}
	
	@Test
	public void testOwner() {
		Task t = new Task();
		t.setOwner("BS1234");
		Assert.assertEquals(t.getOwner(),"BS1234");
	}
	
	@Test
	public void testStart_date() {
		Task t = new Task();
		Date d=Date.valueOf("2019-12-11");
		t.setStart_date(d);
		Assert.assertEquals(t.getStart_date(),d);
	}
	
	@Test
	public void testEnd_date() {
		Task t = new Task();
		Date d=Date.valueOf("2019-12-11");
		t.setEnd_date(d);
		Assert.assertEquals(t.getEnd_date(),d);
	}
	
	@Test
	public void testTask_status() {
		Task t = new Task();
		t.setTask_status("Development");
		Assert.assertEquals(t.getTask_status(),"Development");
	}
	
	@Test
	public void testUpdate_space() {
		Task t = new Task();
		t.setUpdate_space("This is a long long long text!!");
		Assert.assertEquals(t.getUpdate_space(),"This is a long long long text!!");
	}

}
