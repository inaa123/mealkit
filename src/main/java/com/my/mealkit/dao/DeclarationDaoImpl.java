package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.DeclarationMap;
import com.my.mealkit.domain.Declaration;
import com.my.mealkit.domain.DeclarationDto;

@Repository
public class DeclarationDaoImpl implements DeclarationDao{
	@Autowired private DeclarationMap declarationMap;
	
	public List<DeclarationDto> selectDeclarations() {
		return declarationMap.selectDeclarations();
	}
	
	public List<DeclarationDto> selectDeclarations(String userId) {
		return declarationMap.selectUserDeclarations(userId);
	}
	
	@Override
	public List<DeclarationDto> selectSearchDeclarations(String keyword, String category) {
		return declarationMap.selectSearchDeclarations(keyword, category);
	}

	@Override
	public DeclarationDto selectDeclaration(int declarationNum) {
		return declarationMap.selectDeclaration(declarationNum);
	}
	
	@Override
	public void insertDeclaration(Declaration declaration) {
		declarationMap.insertDeclaration(declaration);
	}

	@Override
	public void updateDeclaration(int declarationNum, int declarationStatusCode) {
		declarationMap.updateDeclaration(declarationNum, declarationStatusCode);
	}

	@Override
	public void deleteDeclaration(int declarationNum) {
		declarationMap.deleteDeclaration(declarationNum);
	}
}
