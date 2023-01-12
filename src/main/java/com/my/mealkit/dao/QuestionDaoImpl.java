package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.QuestionMap;
import com.my.mealkit.domain.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	@Autowired private QuestionMap questionMap;
	
	@Override
	public List<Question> selectDetailQuestion(int questionNum) {
		return questionMap.selectDetailQuestion(questionNum);
	}
	
	@Override
	public List<Question> selectQuestions(String userId) {
		return questionMap.selectQuestions(userId);
	}
	
	@Override
	public List<Question> selectAdminQuestions() {
		return questionMap.selectAdminQuestions();
	}
	
	@Override
	public void insertQuestion(Question question) {
		questionMap.insertQuestion(question);
	}
	
	@Override
	public void updateQuestion(Question question) {
		questionMap.updateQuestion(question);
	}
	
	@Override
	public void updateAdminQuestion(Question question) {
		questionMap.updateAdminQuestion(question);
	}
	
	@Override
	public void deleteQuestion(int questionNum) {
		questionMap.deleteQuestion(questionNum);
	}
}
