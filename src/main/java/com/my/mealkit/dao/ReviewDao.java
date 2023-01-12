package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Review;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> detailReviews(int reviewNum);
	List<Review> searchReviews(String keyword);
	List<Review> selectMealkits(int orderNum);
	Review selectReview(int reviewNum);
	void insertReview(Review review);
	void updateReview(Review review);
	void deleteReview(int reviewNum);
}
