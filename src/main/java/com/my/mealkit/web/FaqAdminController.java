package com.my.mealkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Faq;
import com.my.mealkit.service.FaqService;

@Controller
@RequestMapping("/admin/faq")
public class FaqAdminController {
	@Autowired private FaqService faqService;
	
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("listFaq")
	public String listFaq() {
		return "admin/faq/listFaq";
	}
	
	@ResponseBody
	@PostMapping("getFaqs")
	public List<Faq> getFaqs() {
		return faqService.getFaqs();
	}
	
	@GetMapping("detailFaq")
	public String detailFaq(Model model, @RequestParam("faqNum") int faqNum) {
		Faq faq = faqService.getAdminDetailFaq(faqNum);
		model.addAttribute("faq", faq);
		return "admin/faq/detailFaq";
	}
	
	@GetMapping("addFaq")
	public String addNotice() {
		return "admin/faq/addFaq";
	}
	
	@ResponseBody
	@PostMapping("addFaq")
	public ModelAndView addFaq(Faq faq, ModelAndView mv) {
		faqService.addAdminFaq(faq);
		mv.setViewName("admin/faq/listFaq");
		return mv;
	}
	
	@GetMapping("fixFaq")
	public String fixFaq(Faq faq, Model model, @RequestParam("faqNum") int faqNum) {
		faq = faqService.getFaq(faqNum);
		model.addAttribute("faq", faq);
		return "admin/faq/fixFaq";
	}
	
	@PutMapping("fixFaq")
	public ModelAndView fixFaq(@RequestBody Faq faq, ModelAndView mv) {
		faqService.fixAdminFaq(faq);
		mv.setViewName("admin/faq/listFaq");
		return mv;
	}
	
	
	@ResponseBody
	@DeleteMapping("del/{faqNum}")
	public void delFaq(@PathVariable int faqNum) {
		faqService.delAdminFaq(faqNum);
	}
}
