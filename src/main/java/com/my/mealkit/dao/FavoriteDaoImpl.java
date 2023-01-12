package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.FavoriteMap;
import com.my.mealkit.domain.Favorite;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired private FavoriteMap favoriteMap;
	
	@Override
	public List<Favorite> selectFavorites(String userId) {
		return favoriteMap.selectFavorites(userId);
	}
	
	
	@Override
	public List<Favorite> selectFavorite(String userId, int mealkitNum) {
		return favoriteMap.selectFavorite(userId, mealkitNum);
	}
	
	@Override
	public void insertFavorite(Favorite favorite) {
		favoriteMap.insertFavorite(favorite);
	}
	
	@Override
	public void deleteFavorite(String userId, int mealkitNum) {
		favoriteMap.deleteFavorite(userId, mealkitNum);
	}
	
}