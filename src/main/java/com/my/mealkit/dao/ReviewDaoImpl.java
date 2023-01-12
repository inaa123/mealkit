package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.ReviewMap;
import com.my.mealkit.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<Review> selectReviews() {
		return reviewMap.selectReviews();
	}
	
	@Override
	public List<Review> detailReviews(int reviewNum) {
		return reviewMap.detailReviews(reviewNum);
	}

	@Override
	public List<Review> searchReviews(String keyword){
		return reviewMap.searchReviews(keyword);
	}
	
	@Override
	public List<Review> selectMealkits(int orderNum) {
		return reviewMap.selectMealkits(orderNum);
	}

	@Override
	public Review selectReview(int reviewNum) {
		return reviewMap.selectReview(reviewNum);
	}

	@Override
	public void insertReview(Review review) {
		reviewMap.insertReview(review);
	}
	
	@Override
	public void updateReview(Review review) {
		reviewMap.updateReview(review);
	}
	
	@Override
	public void deleteReview(int reviewNum) {
		reviewMap.deleteReview(reviewNum);
	}
}
