package com.scrum;

import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.scrum.business.Task;
import com.scrum.fileops.FileReader;
import com.scrum.jdbc.JDBCops;
import com.scrum.log.LoggerMain;

@SpringBootApplication
public class ScrumApplication {

	public static void main(String[] args) {
		LoggerMain loggermain = new LoggerMain();
		updateTasks("values.csv");
		SpringApplication.run(ScrumApplication.class, args);
	}
	
	public static void updateTasks(String dataPath) {
		List<Task> tasks = FileReader.readTasksFromCSV(dataPath);
		JDBCops jdbctasks = new JDBCops();
		jdbctasks.addTasks(tasks);
			
	}

}
