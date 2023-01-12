package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Question;

public interface QuestionMap {
	List<Question> selectQuestions(@Param("userId") String userId);
	List<Question> selectAdminQuestions();
	List<Question> selectDetailQuestion(@Param("questionNum") int questionNum);
	void insertQuestion(Question question);
	void updateQuestion(Question question);
	void updateAdminQuestion(Question question);
	void deleteQuestion(int questionNum);
}
