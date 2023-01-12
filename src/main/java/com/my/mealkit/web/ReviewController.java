package com.my.mealkit.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.Review;
import com.my.mealkit.service.ReviewService;

@RestController 
@RequestMapping("review")
public class ReviewController {
   @Autowired private ReviewService reviewService;
   
   @Value("${attachPath}") private String attachPath;
   
   @GetMapping("listReview")
   public ModelAndView list(ModelAndView mv) {
      mv.setViewName("review/listReview");
      return mv;
   }
   
   @PostMapping("getReview")
   public List<Review> getReviews(){
      return reviewService.getReviews();
   }
   
   @GetMapping("selectMealkits/{orderNum}")
	public List<Review> getMealkits(@PathVariable int orderNum) {
		List<Review> mealkitList = reviewService.getMealkits(orderNum);
		return mealkitList;
   }
   
   @GetMapping("addReview")
   public ModelAndView addReview(ModelAndView mv, @RequestParam("orderNum") int orderNum) {	   
	   Order order = new Order();
	   order.setOrderNum(orderNum);
	   List<Review> mealkitList = reviewService.getMealkits(order.getOrderNum());
	   mv.addObject("order", order);
	   mv.addObject("mealkitList", mealkitList);
	   mv.setViewName("review/addReview");
      return mv;
   }
   
   @PostMapping("addReview")
   public ModelAndView addReview(Review review, ModelAndView mv) throws IOException {
      try {
	    	 UUID uuid = UUID.randomUUID();
	         String reviewFileName = "REVIEW_" + uuid.toString() + review.getReviewImgfile().getOriginalFilename();
	         saveReviewFile(attachPath + "/" + reviewFileName, review.getReviewImgfile());
	         review.setReviewImgfileName(reviewFileName);
	         reviewService.addReview(review);
      } catch(NullPointerException e) {}
      
      mv.setViewName("review/listReview");
      return mv;
   }
   
   @GetMapping("fixReview")
   public ModelAndView fixReview(ModelAndView mv, Model model,  @RequestParam("reviewNum") int reviewNum) {
      List<Review> reviewList = reviewService.getdetailReviews(reviewNum);
      model.addAttribute("reviewList", reviewList);
      mv.setViewName("review/fixReview");
      return mv;
   }
   
   @PostMapping("fixReview")
   public ModelAndView fixReview(Review review, ModelAndView mv) throws IOException {
	   try {
		   	 UUID uuid = UUID.randomUUID();
	         String reviewFileName = "REVIEW_" + uuid.toString() + review.getReviewImgfile().getOriginalFilename();
	         saveReviewFile(attachPath + "/" + reviewFileName, review.getReviewImgfile());
	         review.setReviewImgfileName(reviewFileName);
	         reviewService.fixReview(review);
	      } catch(NullPointerException e) {}
	      mv.setViewName("review/listReview");
	      return mv;
   }
   
   private void saveReviewFile(String reviewFileName, MultipartFile reviewFile) {
      try {
         reviewFile.transferTo(new File(reviewFileName));
      } catch(IOException e) {}
   }
   
   @DeleteMapping("del/{reviewNum}")
   public void delReview(@PathVariable int reviewNum) {
      reviewService.delReview(reviewNum);
   }
   
   @GetMapping("detailReview")
      public ModelAndView detailReview(ModelAndView mv, Model model, @RequestParam("reviewNum") int reviewNum) {
         List<Review> reviewList = reviewService.getdetailReviews(reviewNum);
         model.addAttribute("reviewList", reviewList);
         mv.setViewName("review/detailReview");
         return mv;
      }
}