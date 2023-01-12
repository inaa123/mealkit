package com.my.mealkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.mealkit.domain.Review;
import com.my.mealkit.service.ReviewService;

@Controller
@RequestMapping("admin/review")
public class ReviewAdminController {
	@Autowired
	private ReviewService reviewService;

	@GetMapping("listReview")
	public String list() {
		return "admin/review/listReview";
	}

	@ResponseBody
	@PostMapping("getReview")
	public List<Review> getReviews() {
		return reviewService.getReviews();
	}

	@ResponseBody
	@DeleteMapping("del/{reviewNum}")
	public void delReview(@PathVariable int reviewNum) {
		reviewService.delReview(reviewNum);
	}

	@ResponseBody
	@GetMapping("searchReviews/{keyword}")
	public List<Review> searchReviews(@PathVariable String keyword) {
		List<Review> reviewList = reviewService.getSearchReviews(keyword);
		return reviewList;
	}
}
