package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Declaration;
import com.my.mealkit.domain.DeclarationDto;

public interface DeclarationMap {
	List<DeclarationDto> selectDeclarations();
	List<DeclarationDto> selectUserDeclarations(@Param("userId") String userId);
	List<DeclarationDto> selectSearchDeclarations(@Param("keyword") String keyword, @Param("category") String category);
	DeclarationDto selectDeclaration(@Param("declarationNum") int declarationNum);
	void insertDeclaration(Declaration declaration);
	void updateDeclaration(@Param("declarationNum") int declarationNum, @Param("declarationStatusCode") int declarationStatusCode);
	void deleteDeclaration(@Param("declarationNum") int declarationNum);
}