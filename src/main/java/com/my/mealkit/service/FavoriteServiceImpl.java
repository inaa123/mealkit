package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.FavoriteDao;
import com.my.mealkit.domain.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired private FavoriteDao favoriteDao;
	
	@Override
	public List<Favorite> getFavorites(String userId) {
		return favoriteDao.selectFavorites(userId);
	}
	
	@Override
	public List<Favorite> getFavorite(String userId, int mealkitNum) {
		return favoriteDao.selectFavorite(userId, mealkitNum);
	}
	
	@Override
	public void addFavorite(Favorite favorite) {
		favoriteDao.insertFavorite(favorite);
	}
	
	@Override
	public void delFavorite(String userId, int mealkitNum) {
		favoriteDao.deleteFavorite(userId, mealkitNum);
	}
}
