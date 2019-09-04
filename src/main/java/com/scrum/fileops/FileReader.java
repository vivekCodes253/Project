package com.scrum.fileops;

import java.io.*;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import com.scrum.business.Task;
import com.scrum.log.LoggerMain;

public class FileReader {

	public static List<Task> readTasksFromCSV(String filePath) {
		List<Task> taskList = new ArrayList<>();
		String fileData = fileread(filePath);
		String[] elements = fileData.split(",");
		for (int i = 0; i < elements.length;) {
			LoggerMain.logger.info("Adding task "+ elements[i + 1]+" Jira no "+ elements[i]+" from "+filePath);
			taskList.add(new Task(elements[i], elements[i + 1], elements[i + 2], elements[i + 3], elements[i + 4],
					elements[i + 5], elements[i + 6]));
			i += 7;
			
		}

		return taskList;
	}

	/*
	 * Function Name : fileread Purpose : read data from file Input : filepath
	 * Return : Read message or status
	 */
	public static String fileread(String filepath) {
		File file = new File(filepath);
		String str, read_string = "";
		try {
			BufferedReader in = new BufferedReader(new java.io.FileReader(file));
			while ((str = in.readLine()) != null) {
				read_string += str;
			}
		} catch (FileNotFoundException ex) {
			return ("\nFile not found, create one or check the path!\n");
		} catch (Exception e) {
			return (e + "\n");
		}

		return read_string;
	}

}
