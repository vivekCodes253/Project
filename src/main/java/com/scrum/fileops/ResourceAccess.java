package com.scrum.fileops;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ResourceUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.io.File;

public class ResourceAccess{

    private static final Logger LOGGER = LoggerFactory.getLogger(ResourceAccess.class.getName());

    public static Properties fetchProperties(String path){
        Properties properties = new Properties();
        try {
            File file = ResourceUtils.getFile("classpath:" +path+".properties");
            InputStream in = new FileInputStream(file);
            properties.load(in);
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
        return properties;
    }
}
