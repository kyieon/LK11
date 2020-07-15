package com.lk11.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
public class RestConfiguration {
	
	@Value("${rest.ip}")
	private String ip;

	@Value("${rest.port}")
	private int port;

	@Bean
	public ObjectMapper objectMapper() {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper;
	}
	
	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setUriTemplateHandler(initUriTemplateHandler());
		return restTemplate;  
	}
	
	private DefaultUriBuilderFactory initUriTemplateHandler() {
		String baseURL = String.format("http://%s:%d", ip, port);
		DefaultUriBuilderFactory uriFactory = new DefaultUriBuilderFactory(baseURL);
		uriFactory.setEncodingMode(EncodingMode.URI_COMPONENT);  // for backwards compatibility..
		return uriFactory;
	}
}
