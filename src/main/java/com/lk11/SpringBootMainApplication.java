package com.lk11;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
public class SpringBootMainApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMainApplication.class, args);
	}
}
