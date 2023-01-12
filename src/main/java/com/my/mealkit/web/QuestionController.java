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
@RequestMapping("question")
public class QuestionController {
	@Autowired private QuestionService questionService;
	
	@GetMapping("listQuestion")
	public String listQuestion() {
		return "question/listQuestion";
	}
	
	@ResponseBody
	@PostMapping("getQuestions")
	public List<Question> getQuestions(Question question, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
        question.setUserId(userId);
		return questionService.getQuestions((String)session.getAttribute("userId"));
	}
	
	@GetMapping("addQuestion")
	public String addQuestion() {
		return "question/addQuestion";
	}
	
	@PostMapping("addQuestion")
	public ModelAndView addQuestion(Question question, ModelAndView mv, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
        question.setUserId(userId);
		questionService.addQuestion(question);
		
		mv.setViewName("question/listQuestion");
		return mv;
	}
	
	@GetMapping("detailQuestion")
	public String detailQuestion(Model model, @RequestParam("questionNum") int questionNum) {
		List<Question> questionList = questionService.getDetailQuestion(questionNum);
		model.addAttribute("questionList", questionList);
		return "question/detailQuestion";
	}
	
	 @GetMapping("fixQuestion")
	   public String fixQuestion(Model model, @RequestParam("questionNum") int questionNum) {
	      List<Question> questionList = questionService.getDetailQuestion(questionNum);
	      model.addAttribute("questionList", questionList);
	      return "question/fixQuestion";
	 }
	 
	 @PostMapping("fixQuestion")
	 public ModelAndView fixQuestion(Question question, ModelAndView mv, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
        question.setUserId(userId);
		questionService.fixQuestion(question);
		mv.setViewName("question/listQuestion");
		return mv;
	}
	
	@DeleteMapping("del/{questionNum}")
	public void delQuestion(@PathVariable int questionNum) {
		questionService.delQuestion(questionNum);
	}
}
