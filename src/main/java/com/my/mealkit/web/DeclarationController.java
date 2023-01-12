package com.my.mealkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Declaration;
import com.my.mealkit.domain.DeclarationDto;
import com.my.mealkit.service.DeclarationService;
import com.my.mealkit.service.ReviewService;

@RestController
@RequestMapping("declaration")
public class DeclarationController {
	@Autowired private DeclarationService declarationService;
	@Autowired private ReviewService reviewService;
	
	@GetMapping("listDeclaration")
	public ModelAndView listDeclaration(HttpSession session, ModelAndView mv) {
		if(session.getAttribute("userId") != null) {
		} else {
		mv.setViewName("redirect:/");
		}		
		return mv;
	}
	
	@GetMapping("getDeclarations")
	public List<DeclarationDto> getDeclarations(HttpSession session) {
		String userId = session.getAttribute("userId").toString();
		return declarationService.getDeclarations(userId);
	}
	
	@GetMapping("declareReview")
	public ModelAndView declareReview(@RequestParam("reviewNum") int reviewNum, HttpSession session, ModelAndView mv) {
		String userId = session.getAttribute("userId").toString();
		String reviewTitle = reviewService.getReview(reviewNum).getReviewTitle();
		Declaration declaration = new Declaration();
		declaration.setUserId(userId);
		declaration.setReviewNum(reviewNum);	
		mv.addObject("reviewTitle", reviewTitle);
		mv.addObject("declaration", declaration);
		mv.setViewName("declaration/declareReview");
		
		return mv;
	}
	
	@GetMapping("detailDeclaration")
	public ModelAndView detailDeclaration(@RequestParam("declarationNum") int declarationNum, HttpSession session, ModelAndView mv) {
		String userId = session.getAttribute("userId").toString();
		DeclarationDto declaration = declarationService.getDeclaration(declarationNum);
		if(declaration.getUserId().equals(userId)) mv.addObject("declaration", declaration);
		mv.setViewName("declaration/detailDeclaration");
		
		return mv;
	}
	
	@PostMapping("addDeclaration")
	public void addDeclaration(@RequestBody Declaration declaration, HttpSession session) {
		declaration.setUserId(session.getAttribute("userId").toString());
		declarationService.addDeclaration(declaration);
	}
	
	@DeleteMapping("delDeclaration/{declarationNum}")
	public void delUser(@PathVariable int declarationNum, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
		if(userId.equals("admin") || userId.equals(declarationService.getDeclaration(declarationNum).getUserId())) 
			declarationService.delDeclaration(declarationNum);
	}
}
