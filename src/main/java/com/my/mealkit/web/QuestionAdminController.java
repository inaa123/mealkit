package com.my.mealkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Question;
import com.my.mealkit.service.QuestionService;

@Controller
@RequestMapping("admin/question")
public class QuestionAdminController {
	@Autowired QuestionService questionService;
	
	@GetMapping("listQuestion")
	public String listQuestion() {
		return "admin/question/listQuestion";
	}
	
	@ResponseBody
	@PostMapping("getAdminQuestions")
	public List<Question> getAdminQuestions() {
		return questionService.getAdminQuestions();
	}
	
	@GetMapping("detailQuestion")
	public String detailQuestion(Model model, @RequestParam("questionNum") int questionNum) {
		List<Question> questionList = questionService.getDetailQuestion(questionNum);
		model.addAttribute("questionList", questionList);
		return "admin/question/detailQuestion";
	}
	
	@GetMapping("addQuestion")
	public String addQuestion(Model model, @RequestParam("questionNum") int questionNum) {
		List<Question> questionList = questionService.getDetailQuestion(questionNum);
		model.addAttribute("questionList", questionList);
		return "admin/question/addQuestion";
	}
	
	@ResponseBody
	@PostMapping("addAdminQuestion")
	public ModelAndView addAdminQuestion(Question question, ModelAndView mv, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
		question.setUserId(userId);
		questionService.fixAdminQuestion(question);
		mv.setViewName("admin/question/listQuestion");
		return mv;
	}
	
	@GetMapping("fixQuestion")
	   public String fixQuestion(Model model, @RequestParam("questionNum") int questionNum) {
	      List<Question> questionList = questionService.getDetailQuestion(questionNum);
	      model.addAttribute("questionList", questionList);
	      return "admin/question/fixQuestion";
	 }
	 
	@ResponseBody
	@PostMapping("fixQuestion")
	public ModelAndView fixQuestion(Question question, ModelAndView mv) {
		questionService.fixAdminQuestion(question);
		mv.setViewName("admin/question/listQuestion");
		return mv;
	}
	
	@ResponseBody
	@DeleteMapping("del/{questionNum}")
	public void delQuestion(@PathVariable int questionNum) {
		questionService.delQuestion(questionNum);
	}
}
