package com.my.mealkit;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@ComponentScan("com/my/mealkit")
public class AppConfig implements WebMvcConfigurer {
	@Value("${attachPath}")
	private String attachPath;
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/admin").setViewName("admin/main");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(new AdminChecker())
            .order(1)
            .addPathPatterns("/admin/**");
	    
	    registry.addInterceptor(new UserChecker())
	        .order(1)
	        .addPathPatterns("/**")
	        .excludePathPatterns("/", "/res/**", "/attach/**", "/notice/**", "/faq/**", "/admin/**", "/user/login", 
	        		"/user/completeFindId", "/user/completeResetPassword", "/user/completeWithdrawal", "/user/findId", 
	        		"/user/findPassword", "/user/jusoPopup/**", "/user/resetPassword", "/user/signUp", "/user/welcome", 
	        		"/user/emailCheck/**", "/user/emailCheck?email/**", "/user/idDoubleCheck/**", "/user/emailDoubleCheck/**");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	   registry.addResourceHandler("res/**").addResourceLocations("WEB-INF/res/");
	   registry.addResourceHandler("attach/**").addResourceLocations("file:///" + attachPath + "/");
	}
}