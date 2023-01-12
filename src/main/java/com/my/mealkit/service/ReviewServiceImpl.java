package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.ReviewDao;
import com.my.mealkit.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;
	
	@Override
	public List<Review> getReviews(){
		return reviewDao.selectReviews();
	}
	
	@Override
	public List<Review> getdetailReviews(int reviewNum) {
		return reviewDao.detailReviews(reviewNum);
	}

	@Override
	public List<Review> getSearchReviews(String keyword){
		return reviewDao.searchReviews(keyword);
	}
	
	@Override
	public List<Review> getMealkits(int orderNum) {
		return reviewDao.selectMealkits(orderNum);
	}

	@Override
	public Review getReview(int reviewNum) {
		return reviewDao.selectReview(reviewNum);
	}

	@Override
	public void addReview(Review review) {
		reviewDao.insertReview(review);
	}
	
	@Override
	public void fixReview(Review review) {
		reviewDao.updateReview(review);
	}
	
	@Override
	public void delReview(int reviewNum) {
		reviewDao.deleteReview(reviewNum);
	}
}
