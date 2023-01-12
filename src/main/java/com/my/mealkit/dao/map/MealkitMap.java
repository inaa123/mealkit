package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Mealkit;

public interface MealkitMap {
	List<Mealkit> selectMealkits();
	List<Mealkit> selectMealkit(@Param("mealkitNum") int mealkitNum);
	List<Mealkit> searchMealkits(@Param("keyword") String keyword);
	List<Mealkit> searchCategory(@Param("keyword") int keyword);
	void insertMealkit(Mealkit mealkit);
	void updateMealkit(Mealkit mealkit);
	void deleteMealkit(int mealkitNum);
}
