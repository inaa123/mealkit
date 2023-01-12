package com.my.mealkit.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Mealkit;
import com.my.mealkit.service.MealkitService;

@RestController
@RequestMapping("latest")
public class LatestController {
	@Autowired private MealkitService mealkitService;
	
	@GetMapping("history")
	 public ModelAndView latest(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[] = request.getCookies();
		List<Mealkit> mealkits = new ArrayList<>();
		for (int i = cookies.length; 0 < i; i--) {
			if(!cookies[i-1].getName().equals("JSESSIONID") && cookies.length-6 < i) {
				mealkits.add(mealkitService.getMealkit(Integer.parseInt(cookies[i-1].getValue())).get(0));
			}
		}
		mv.addObject("mealkits", mealkits);
	      mv.setViewName("latest/history");
	      return mv;
	   }
}