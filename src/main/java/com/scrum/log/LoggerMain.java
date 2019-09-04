package com.scrum.log;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

<<<<<<< HEAD
import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
=======
>>>>>>> 8f558d17fde2928172922e76f1c837d390826408
import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.slf4j.LoggerFactory;

public class LoggerMain {
	public static Logger logger = LoggerFactory.getLogger(LoggerMain.class);
<<<<<<< HEAD
	static final String LOG_PROPERTIES_FILE = "log4j.properties";
=======
	//static final String LOG_PROPERTIES_FILE = "log4j.properties";
>>>>>>> 8f558d17fde2928172922e76f1c837d390826408

	public LoggerMain() {
		BasicConfigurator.configure();
		//initializeLogger();
	}

	/*private static void initializeLogger() {
		
		Properties logProperties = new Properties();
		try {
			logProperties.load(new FileInputStream(LOG_PROPERTIES_FILE));
			PropertyConfigurator.configure(logProperties);
			logger.info("New session");
		} catch (IOException e) {
			logger.error("Unable to load logging property :", e);
		}
	}*/
}
