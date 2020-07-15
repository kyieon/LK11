package com.lk11.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;

import com.lk11.common.auth.RestAuthenticationProvider;
import com.lk11.service.AuthService;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthService authService;

	@Bean
    public RestAuthenticationProvider authenticationProvider() {
		RestAuthenticationProvider authenticationProvider = new RestAuthenticationProvider();
        authenticationProvider.setUserAuthService(authService);
        return authenticationProvider;
    }

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		  auth.authenticationProvider(authenticationProvider());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
		.authorizeRequests()
		.antMatchers("/", "/login", "/api/**/*").permitAll()
		.anyRequest().authenticated()
		.and()
		.formLogin().loginPage("/login")
		.defaultSuccessUrl("/home")
		.and()
		.logout()
		.deleteCookies("SESSION_ID")
		.logoutSuccessUrl("/login")
		.and()
		.exceptionHandling().authenticationEntryPoint(new Http403ForbiddenEntryPoint())
		;
	}
}
