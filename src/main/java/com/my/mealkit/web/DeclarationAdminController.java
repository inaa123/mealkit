package com.my.mealkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.DeclarationDto;
import com.my.mealkit.service.DeclarationService;

@RestController
@RequestMapping("admin/declaration")
public class DeclarationAdminController {
	@Autowired private DeclarationService declarationService;
	
	@GetMapping("listDeclaration")
	public ModelAndView listDeclaration(ModelAndView mv) {		
		return mv;
	}
	
	@GetMapping("getDeclarations")
	public List<DeclarationDto> getDeclarations() {
		return declarationService.getDeclarations();
	}

	@GetMapping("searchDeclarations")
	public List<DeclarationDto> searchDeclarations(@RequestParam String keyword, @RequestParam String category) {		
		List<DeclarationDto> declarationList = declarationService.getSearchDeclarations(keyword, category);
		return declarationList;
	}
	
	@GetMapping("/detailDeclaration")
	public ModelAndView detailDeclaration(@RequestParam("declarationNum") int declarationNum, HttpSession session, ModelAndView mv) {		
		DeclarationDto declaration = declarationService.getDeclaration(declarationNum);
		mv.addObject("declaration", declaration);
		mv.setViewName("admin/declaration/detailDeclaration");
		return mv;
	}
	
	@PutMapping("fixDeclaration")
	public void fixDeclaration(@RequestBody DeclarationDto declaration) {		
		declarationService.fixDeclaration(declaration.getDeclarationNum(), declaration.getDeclarationStatusCode());
	}
}
