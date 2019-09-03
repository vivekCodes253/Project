package com.scrum.test;

import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.scrum.business.Task;
import com.scrum.repositories.TaskRepository;

public class TaskRepositoryTest {
	

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
}
