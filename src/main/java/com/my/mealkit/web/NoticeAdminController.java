package com.my.mealkit.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Notice;
import com.my.mealkit.service.NoticeService;

@Controller
@RequestMapping("/admin/notice")
public class NoticeAdminController {
	@Autowired private NoticeService noticeService;
	
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("listNotice")
	public String list() {
		return "admin/notice/listNotice";
	}

	@ResponseBody
	@PostMapping("getNotices")
	public List<Notice> getNotices() {
		return noticeService.getNotices();
	}

	@GetMapping("detailNotice")
	public String detailNotice(Notice notice ,Model model, @RequestParam("noticeNum") int noticeNum) {
		notice = noticeService.getDetailNotice(noticeNum);
		model.addAttribute("notice", notice);
		return "admin/notice/detailNotice";
	}
	
	@GetMapping("addNotice")
	public String addNotice() {
		return "admin/notice/addNotice";
	}
	
	@ResponseBody
	@PostMapping("addNotice")
	public ModelAndView addNotice(Notice notice, ModelAndView mv) throws IOException {
		try {
			String noticeFileName = "NOTICE_0000" + notice.getNoticeImgFile().getOriginalFilename();
			saveNoticeFile(attachPath + "/" + noticeFileName, notice.getNoticeImgFile());
			notice.setNoticeImgFileName(noticeFileName);
			noticeService.addAdminNotice(notice);
		} catch(NullPointerException e) {}
		mv.setViewName("admin/notice/listNotice");
		return mv;
	}
	
	private void saveNoticeFile(String noticeFileName, MultipartFile noticeFile) {
		try {
			noticeFile.transferTo(new File(noticeFileName));
		} catch(IOException e) {}
	}

	@GetMapping("fixNotice")
	public String fixNotice(Notice notice, Model model, @RequestParam("noticeNum") int noticeNum) {
		notice = noticeService.getNotice(noticeNum);
		model.addAttribute("notice", notice);
		return "admin/notice/fixNotice";
	}
	
	@ResponseBody
	@PostMapping("fixNotice")
	public ModelAndView fixNotice(Notice notice, ModelAndView mv) throws IOException {		
		try {
			String noticeFileName = "NOTICE_0000" + notice.getNoticeImgFile().getOriginalFilename();
			saveNoticeFile(attachPath + "/" + noticeFileName, notice.getNoticeImgFile());
			notice.setNoticeImgFileName(noticeFileName);	
			noticeService.fixAdminNotice(notice);
		} catch(NullPointerException e) {}
		mv.setViewName("admin/notice/listNotice");
		return mv;
	}
	
	@ResponseBody
	@DeleteMapping("del/{noticeNum}")
	public void delNotice(@PathVariable int noticeNum) {
		noticeService.delAdminNotice(noticeNum);
	}
	
	@ResponseBody
	@GetMapping("searchNotices/{keyword}")
	public List<Notice> searchNotices(@PathVariable String keyword) {		
		List<Notice> noticeList = noticeService.getSearchNotices(keyword);
		return noticeList;
	}

}
