package com.scrum.repositories;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

import com.scrum.business.Employee;
import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;
import com.scrum.repositories.EmployeeRepository;
import com.scrum.repositories.TaskRepository;
import com.scrum.repositories.EmployeeRepository;

public class EmployeeRepositoryTest {

	@Mock
	private JDBCops jdbcops;

	@Rule
	public MockitoRule rule = MockitoJUnit.rule();

	@Test
	public void test() {
		MockitoAnnotations.initMocks(this);
		EmployeeRepository emprepo = new EmployeeRepository(jdbcops);
		emprepo.allEmployee("xxxx");
		Mockito.verify(jdbcops).allEmployee("xxxx");
	}

	@Test
	public void testAllEmployee() {
		EmployeeRepository emprepo = new EmployeeRepository(jdbcops);
		Mockito.when(jdbcops.allEmployee("xxxx")).thenReturn(createTestEmployees());
		List<Employee> actual = emprepo.allEmployee("xxxx");
		Assert.assertEquals("BS67895", actual.get(0).getSoeid());
		Assert.assertEquals("Bala Suresh", actual.get(0).getName());
		Mockito.verify(jdbcops).allEmployee("xxxx");
	}

	@Test
	public void testSpecificEmployee() {
		EmployeeRepository emprepo = new EmployeeRepository(jdbcops);
		Mockito.when(jdbcops.specificEmployees("xxxx")).thenReturn(createTestEmployees());
		List<Employee> actual = emprepo.specificEmployees("xxxx");
		Assert.assertEquals("BS67895", actual.get(0).getSoeid());
		Assert.assertEquals("Bala Suresh", actual.get(0).getName());
		Mockito.verify(jdbcops).specificEmployees("xxxx");
	}

	@Test
	public void testAddEmployee() {
		MockitoAnnotations.initMocks(this);
		EmployeeRepository taskrepo = new EmployeeRepository(jdbcops);
		Employee emp = createTestEmployee();
		taskrepo.addEmployee(emp);
		Mockito.verify(jdbcops).addEmployee(emp);
	}

	@Test
	public void testGetMailIds() {
		EmployeeRepository emprepo = new EmployeeRepository(jdbcops);
		Mockito.when(jdbcops.getEmployeeEmailIds()).thenReturn(createTestMailIds());
		List<String> actual = emprepo.getMailIds();
		Assert.assertEquals("samyu@gmail.com", actual.get(0));
		Assert.assertEquals("reema@gmail.com", actual.get(1));
		Mockito.verify(jdbcops).getEmployeeEmailIds();
	}

	@Test
	public void testGetEmployeeNames() {
		EmployeeRepository emprepo = new EmployeeRepository(jdbcops);
		List<Task> tasks = createTestTasks();
		Mockito.when(jdbcops.getEmployeeBySOEID(tasks.get(0).getOwner())).thenReturn("Bala Suresh");
		List<String> actual = emprepo.getEmployeeNames(tasks);
		Assert.assertEquals("Bala Suresh", actual.get(0));
		Mockito.verify(jdbcops).getEmployeeBySOEID(tasks.get(0).getOwner());
	}

	private List<String> createTestMailIds() {
		List<String> email = new ArrayList<String>();
		email.add("samyu@gmail.com");
		email.add("reema@gmail.com");
		return email;
	}

	private List<Employee> createTestEmployees() {
		Employee emp = new Employee();
		emp.setSoeid("BS67895");
		emp.setName("Bala Suresh");
		List<Employee> emps = new ArrayList<Employee>();
		emps.add(emp);
		return emps;
	}

	private Employee createTestEmployee() {
		Employee emp = new Employee();
		emp.setSoeid("BS67895");
		emp.setName("Bala Suresh");
		return emp;
	}

	private List<Task> createTestTasks() {
		Task task = new Task();
		task.setJira_Number("BO67895");
		task.setTask_name("Bid/Offer");
		task.setOwner("BS67895");
		List<Task> tasks = new ArrayList<Task>();
		tasks.add(task);
		return tasks;
	}
}
