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

import com.my.mealkit.domain.Mealkit;
import com.my.mealkit.service.MealkitService;

@Controller
@RequestMapping("/admin/mealkit")
public class MealkitAdminController {
	@Autowired private MealkitService mealkitService;
	
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("/listMealkit")
	public String listMealkit() {
		return "admin/mealkit/listMealkit";
	}
	
	@GetMapping("/addMealkit")
	public String addMealkit() {
		return "admin/mealkit/addMealkit";
	}
	
	@GetMapping("/fixMealkit")
	public String fixMealkit(Model model, @RequestParam("mealkitNum") int mealkitNum) {
		List<Mealkit> mealkitList = mealkitService.getMealkit(mealkitNum);
		model.addAttribute("mealkitList", mealkitList);
		return "admin/mealkit/fixMealkit";
	}
	
	@ResponseBody
	@PostMapping("/listMealkits")
	public List<Mealkit> getMealkits() {
		return mealkitService.getMealkits();
	}
	
	@GetMapping("/searchMealkit")
	public String searchMealkit(Model model, @RequestParam("search") String search) {		
		List<Mealkit> mealkitList = mealkitService.getSearchMealkits(search);
		model.addAttribute("mealkitList", mealkitList);
		return "admin/mealkit/searchMealkit";
	}
	
	@GetMapping("/searchCategory")
	public String searchMealkit(Model model, @RequestParam("searchCategory") int searchCategory) {		
		List<Mealkit> mealkitList = mealkitService.getSearchCategory(searchCategory);
		model.addAttribute("mealkitList", mealkitList);
		return "admin/mealkit/searchMealkit";
	}
	
	@ResponseBody
	@PostMapping("/listMealkit/{mealkitNum}")
	public List<Mealkit> getMealkit(@PathVariable int mealkitNum) {
		return mealkitService.getMealkit(mealkitNum);
	}
	
	@ResponseBody
	@PostMapping("/addMealkit")
	public ModelAndView addMealkit(Mealkit mealkit, ModelAndView mv) throws IOException {
		try {
			String mealkitFileName = mealkit.getMealkitImgfile().getOriginalFilename();
			
			saveMealkitFile(attachPath + "/" + mealkitFileName, mealkit.getMealkitImgfile());
			mealkit.setMealkitImgfileName(mealkitFileName);
			mealkitService.addMealkit(mealkit);
		} catch(NullPointerException e) {}
		
		mv.setViewName("admin/mealkit/listMealkit");
		return mv;
	}
	
	private void saveMealkitFile(String mealkitFileName, MultipartFile mealkitFile) {
		try {
			mealkitFile.transferTo(new File(mealkitFileName));
		} catch(IOException e) {}
	}
	
	@ResponseBody
	@PostMapping("/fixMealkit")
	public ModelAndView fixMealkit(Mealkit mealkit, ModelAndView mv) throws IOException {
		mealkitService.fixMealkit(mealkit);	
		mv.setViewName("admin/mealkit/listMealkit");
		return mv;
	}
	
	@ResponseBody
	@DeleteMapping("del/{mealkitNum}")
	public void delMealkit(@PathVariable int mealkitNum) {
		mealkitService.delMealkit(mealkitNum);
	}
}
