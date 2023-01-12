package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Favorite;

public interface FavoriteDao {
	List<Favorite> selectFavorites(String userId);
	List<Favorite> selectFavorite(String userId, int mealkitNum);
	void insertFavorite(Favorite favorite);
	void deleteFavorite(String userId, int mealkitNum);
}
