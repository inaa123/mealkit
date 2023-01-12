package com.my.mealkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Notice;
import com.my.mealkit.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired private NoticeService noticeService;

	@GetMapping("listNotice")
	public ModelAndView listNotice(ModelAndView mv) {
		mv.setViewName("notice/listNotice");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("getNotices")
	public List<Notice> getNotices() {
		return noticeService.getNotices();
	}

	@GetMapping("detailNotice")
	public String detailNotice(Notice notice, Model model, @RequestParam("noticeNum") int noticeNum) {
		notice = noticeService.getDetailNotice(noticeNum);
		model.addAttribute("notice", notice);
		return "notice/detailNotice";
	}
	
}