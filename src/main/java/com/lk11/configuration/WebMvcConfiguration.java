package com.lk11.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@EnableWebMvc
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
			.addResourceLocations("classpath:/static/");
	}

	@Bean
	public UrlBasedViewResolver getUrlBasedViewResolver() {
		UrlBasedViewResolver basedViewResolver = new UrlBasedViewResolver();
		basedViewResolver.setViewClass(JstlView.class);
		basedViewResolver.setPrefix("/WEB-INF/");
		basedViewResolver.setSuffix(".jsp");
		return basedViewResolver;
	}
}
