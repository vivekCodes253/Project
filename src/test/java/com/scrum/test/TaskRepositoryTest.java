package com.scrum.test;

import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.scrum.business.Task;
import com.scrum.jdbc.JDBCops;
import com.scrum.repositories.TaskRepository;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;
public class TaskRepositoryTest {
	

	@Mock private JDBCops jdbcops;
	 
	  @Rule public MockitoRule rule = MockitoJUnit.rule();
	 
	TaskRepository taskRepo = new TaskRepository();
	
	@Test
	public void getDeadlineTasksTest() {
		Date today = null;
			try {
				 today = new SimpleDateFormat("yyyy-MM-dd").parse("2019-09-01");
			} catch (ParseException e) {}
							
			
			Task t1 = new Task("ET","Trial task1","vj69875","2019-08-29","2019-09-03" ,"Requirement Analysis","Types of Test cases are being considered");
			Task t2 = new Task("ET","Trial task1","vj69875","2019-08-29","2019-09-07" ,"Requirement Analysis","Types of Test cases are being considered");
			
			List<Task> taskList = new ArrayList<>();
			taskList.add(t1);
			taskList.add(t2);
			
			int count = taskRepo.getDeadlineTasksCountFromDate(taskList, today);
			
			
			assertTrue(count==1);
			
	}
	
	  @Test
	  public void test() {
	    MockitoAnnotations.initMocks(this);
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    taskrepo.allTasks("xxxx");
	    Mockito.verify(jdbcops).allTasks("xxxx");
	}
	  
	  @Test
	  public void testAllTasks() {
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    Mockito.when(jdbcops.allTasks("xxxx")).thenReturn(createTestTasks());
	    List<Task> actual = taskrepo.allTasks("xxxx");
	    Assert.assertEquals("BO67895", actual.get(0).getJira_Number());
	    Assert.assertEquals("Bid/Offer", actual.get(0).getTask_name());
	    Mockito.verify(jdbcops).allTasks("xxxx");
	}

	  @Test
	  public void testgetTaskById() {
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    Mockito.when(jdbcops.taskById("B067895")).thenReturn(createTestTask());
	    Task actual = taskrepo.getTaskById("B067895");
	    Assert.assertEquals("BO67895", actual.getJira_Number());
	    Assert.assertEquals("Bid/Offer", actual.getTask_name());
	    Mockito.verify(jdbcops).taskById("B067895");
	}
	  
	  @Test
	  public void testSaveTask() {
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    Task sampleTask = createTestTask();
	    Mockito.when(jdbcops.editTask(sampleTask)).thenReturn(createTestTask());
	    Task actual = taskrepo.saveTask(sampleTask);
	    Assert.assertEquals("BO67895", actual.getJira_Number());
	    Assert.assertEquals("Bid/Offer", actual.getTask_name());
	    Mockito.verify(jdbcops).editTask(sampleTask);
	}
	  
	  @Test
	  public void testAddTask() {
	    MockitoAnnotations.initMocks(this);
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    Task task = createTestTask();
	    List<Task> tasks = new ArrayList<Task>();
	    tasks.add(task);
	    taskrepo.addTask(task);
	    Mockito.verify(jdbcops).addTasks(tasks);
	}
	  
	  @Test
	  public void testModifyTaskOwner() {
	    MockitoAnnotations.initMocks(this);
	    TaskRepository taskrepo = new TaskRepository(jdbcops);
	    Task task = createTestTask();
	    taskrepo.modifyTaskOwner(task);
	    Mockito.verify(jdbcops).modifyTaskOwner(task);
	}
	  
	  
	  
	  private List<Task> createTestTasks() {
		    Task task = new Task();
		    task.setJira_Number("BO67895");
		    task.setTask_name("Bid/Offer");
		    List<Task> tasks = new ArrayList<Task>();
		    tasks.add(task);
		    return tasks;
		  }
	  
	  private Task createTestTask() {
		    Task task = new Task();
		    task.setJira_Number("BO67895");
		    task.setTask_name("Bid/Offer");
		    return task;
		  }
}
