package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Mealkit;

public interface MealkitService {
	List<Mealkit> getMealkits();
	List<Mealkit> getMealkit(int mealkitNum);
	List<Mealkit> getSearchMealkits(String keyword);
	List<Mealkit> getSearchCategory(int keyword);
	void addMealkit(Mealkit mealkit);
	void fixMealkit(Mealkit mealkit);
	void delMealkit(int mealkitNum);
}
