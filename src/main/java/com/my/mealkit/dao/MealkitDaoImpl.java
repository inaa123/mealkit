package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.MealkitMap;
import com.my.mealkit.domain.Mealkit;

@Repository
public class MealkitDaoImpl implements MealkitDao {
	@Autowired private MealkitMap mealkitMap;
	
	@Override
	public List<Mealkit> selectMealkits() {
		return mealkitMap.selectMealkits();
	}
	
	@Override
	public List<Mealkit> selectMealkit(int mealkitNum) {
		return mealkitMap.selectMealkit(mealkitNum);
	}

	@Override
	public List<Mealkit> searchMealkits(String keyword) {
		return mealkitMap.searchMealkits(keyword);
	}
	
	@Override
	public List<Mealkit> searchCategory(int keyword) {
		return mealkitMap.searchCategory(keyword);
	}

	@Override
	public void insertMealkit(Mealkit mealkit) {
		mealkitMap.insertMealkit(mealkit);
	}

	@Override
	public void updateMealkit(Mealkit mealkit) {
		mealkitMap.updateMealkit(mealkit);
	}

	@Override
	public void deleteMealkit(int mealkitNum) {
		mealkitMap.deleteMealkit(mealkitNum);
	}
}
