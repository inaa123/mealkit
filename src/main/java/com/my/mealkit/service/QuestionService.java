package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Question;

public interface QuestionService {
	List<Question> getQuestions(String userId);
	List<Question> getAdminQuestions();
	List<Question> getDetailQuestion(int questionNum);
	void addQuestion(Question question);
	void fixQuestion(Question question);
	void fixAdminQuestion(Question question);
	void delQuestion(int questionNum);
}
