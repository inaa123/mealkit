package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Review;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getdetailReviews(int reviewNum);
	List<Review> getSearchReviews(String keyword);
	List<Review> getMealkits(int orderNum);
	Review getReview(int reviewNum);
	void addReview(Review review);
	void fixReview(Review review);
	void delReview(int reviewNum);
}
