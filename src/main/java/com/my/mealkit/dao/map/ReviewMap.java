package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Review;

public interface ReviewMap {
	List<Review> selectReviews();
	List<Review> detailReviews(@Param("reviewNum") int reviewNum);
	List<Review> searchReviews(@Param("keyword") String keyword);
	List<Review> selectMealkits(@Param("orderNum") int orderNum);
	Review selectReview(@Param("reviewNum") int reviewNum);
	void insertReview(Review review);
	void updateReview(Review review);
	void deleteReview(int reviewNum);
}
