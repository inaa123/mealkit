package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Question;

public interface QuestionDao {
	List<Question> selectQuestions(String userId);
	List<Question> selectAdminQuestions();
	List<Question> selectDetailQuestion(int questionNum);
	void insertQuestion(Question question);
	void updateQuestion(Question question);
	void updateAdminQuestion(Question question);
	void deleteQuestion(int questionNum);
}
