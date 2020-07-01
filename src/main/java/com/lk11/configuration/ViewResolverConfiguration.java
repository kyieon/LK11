package com.lk11.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@Configuration
public class ViewResolverConfiguration {

	@Bean
	public UrlBasedViewResolver getUrlBasedViewResolver() {
		UrlBasedViewResolver basedViewResolver = new UrlBasedViewResolver();
		basedViewResolver.setViewClass(JstlView.class);
		basedViewResolver.setPrefix("/WEB-INF/");
		basedViewResolver.setSuffix(".jsp");
		return basedViewResolver;
	}
}
