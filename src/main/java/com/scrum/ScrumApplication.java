package com.scrum;

import java.util.List;

import org.apache.log4j.BasicConfigurator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.unbescape.csv.CsvEscape;

import com.scrum.business.Task;
import com.scrum.fileops.FileReader;
import com.scrum.jdbc.JDBCops;
import com.scrum.log.LoggerMain;

@SpringBootApplication
public class ScrumApplication {

	private static String CSV_FILE_PATH = "values.csv";
	
	public static void main(String[] args) {
		BasicConfigurator.configure();
		LoggerMain loggermain = new LoggerMain();
		updateTasks(CSV_FILE_PATH);
		SpringApplication.run(ScrumApplication.class, args);
	}
	
	/* Function Name 	: updateTasks
	 * Purpose 			: Checks csv files for any task update
	 * Input 			: Path to file
	 * Return 			: */
	public static void updateTasks(String dataPath) {
		List<Task> tasks = FileReader.readTasksFromCSV(dataPath);
		JDBCops jdbctasks = new JDBCops();
		jdbctasks.addTasks(tasks);
			
	}

}
