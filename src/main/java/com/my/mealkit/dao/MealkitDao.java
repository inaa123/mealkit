package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Mealkit;

public interface MealkitDao {
	List<Mealkit> selectMealkits();
	List<Mealkit> selectMealkit(int mealkitNum);
	List<Mealkit> searchMealkits(String keyword);
	List<Mealkit> searchCategory(int keyword);
	void insertMealkit(Mealkit mealkit);
	void updateMealkit(Mealkit mealkit);
	void deleteMealkit(int mealkitNum);
}
