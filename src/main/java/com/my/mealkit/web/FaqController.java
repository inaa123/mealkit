package com.my.mealkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Faq;
import com.my.mealkit.service.FaqService;

@Controller
@RequestMapping("faq")
public class FaqController {
	@Autowired private FaqService faqService;
	
	@GetMapping("listFaq")
	public ModelAndView listFaq(ModelAndView mv) {
		mv.setViewName("faq/listFaq");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("getFaqs")
	public List<Faq> getFaqs() {
		return faqService.getFaqs();
	}
}
