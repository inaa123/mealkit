package com.my.mealkit.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.User;
import com.my.mealkit.service.MailSendService;
import com.my.mealkit.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	@Autowired private MailSendService mailSendService;
	
	@GetMapping("jusoPopup")
	public void jusoPopup() {		
	}
	
	@GetMapping("signUp")
	public void signUp() {
	}
	
	@PostMapping("signUp")
	public void signUp(@RequestBody User user) {
		userService.addUser(user);
	}
	
	@ResponseBody
	@GetMapping("idDoubleCheck")
	public boolean idDoubleCheck(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) {
		boolean isGood = userService.idDoubleCheck(userId);
		return isGood;
	}
	
	@ResponseBody
	@GetMapping("emailDoubleCheck")
	public boolean emailDoubleCheck(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) {
		boolean isGood = userService.emailDoubleCheck(email);
		return isGood;
	}
	
	@ResponseBody
	@GetMapping("emailCheck")	
	public String emailCheck(String email) {
		return mailSendService.emailWrite(email);
	}
	
	@GetMapping("welcome")
	public void welcome() {		
	}

	@GetMapping("login")
	public ModelAndView loginIn(HttpSession session, ModelAndView mv) {
		if(session.getAttribute("userId") == null) {
			mv.setViewName("user/login");
		} else {
			mv.setViewName("redirect:/");
		}
		
		session.removeAttribute("errMsg");
		
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(User user, HttpSession session, ModelAndView mv) {
		if(userService.loginVerify(user)) {
			session.setAttribute("userId", user.getUserId());
			if(user.getUserId().equals("admin")) {
				mv.setViewName("redirect:../admin/");
			} else {
				mv.setViewName("redirect:/");
			}
		} else {
			session.setAttribute("errMsg", "올바르지 않은 아이디 또는 패스워드 입니다.");
			mv.setViewName("user/login");
		}
				
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@GetMapping("findId")
	public void findId() {		
	}
	
	@GetMapping("completeFindId")
	public ModelAndView completeFindId(@RequestParam(value="email", required=false) String email, ModelAndView mv) {
		if(email != null) {
			String userId = userService.findUserId(email);				
			mv.addObject("userId", userId);
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@GetMapping("findPassword")
	public void findPassword() {		
	}
	
	@GetMapping("resetPassword")
	public ModelAndView resetPassword(User user, ModelAndView mv) {
		if(user != null) {
			if(user.getUserId().equals(userService.findUserId(user.getEmail()))) {
				mv.addObject(user);
			} else {
				mv.setViewName("redirect:/");
			}
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@GetMapping("completeResetPassword")
	public ModelAndView completeResetPassword(User user, ModelAndView mv) {
		if(user != null) {
			String userId = user.getUserId();
			String email = user.getEmail();
			String password = user.getPassword();
			userService.resetPassword(userId, email, password);
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@GetMapping("fixUser")
	public ModelAndView fixUserIn(HttpSession session, ModelAndView mv) {		
		if(session.getAttribute("userId") != null) {
			String userId = session.getAttribute("userId").toString();
			User user = userService.getUser(userId);
			mv.addObject(user);
		} else {
		mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@PutMapping("fixUser")
	public void fixUser(HttpSession session, @RequestBody User user) {
		String userId = session.getAttribute("userId").toString();
		User userTmp = userService.getUser(userId);
		user.setUserId(userId);
		if(user.getPassword() == "") user.setPassword(userTmp.getPassword());
		userService.fixUser(user);
	}
	
	@PostMapping("completeFixUser")
	public void completeFixUser() {		
	}
	
	@GetMapping("withdrawal")
	public ModelAndView withdrawal(HttpSession session, ModelAndView mv) {
		if(session.getAttribute("userId") != null) {
			String userId = session.getAttribute("userId").toString();
			userService.delUser(userId);
			session.invalidate();
			mv.setViewName("user/completeWithdrawal");
		} else {
		mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@GetMapping("completeWithdrawal")
	public void completeWithdrawal() {
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session, ModelAndView mv) {		
		if(session.getAttribute("userId") != null) {
			String userId = session.getAttribute("userId").toString();
			User user = userService.getUser(userId);
			mv.addObject(user);
		} else {
		mv.setViewName("redirect:/");
		}
		
		return mv;
	}
}
