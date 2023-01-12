package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.DeclarationDao;
import com.my.mealkit.domain.Declaration;
import com.my.mealkit.domain.DeclarationDto;

@Service
public class DeclarationServiceImpl implements DeclarationService{
	@Autowired private DeclarationDao declarationDao;
	
	@Override
	public List<DeclarationDto> getDeclarations() {
		return declarationDao.selectDeclarations();
	}
	
	@Override
	public List<DeclarationDto> getDeclarations(String userId) {
		return declarationDao.selectDeclarations(userId);
	}
	
	@Override
	public List<DeclarationDto> getSearchDeclarations(String keyword, String category) {
		return declarationDao.selectSearchDeclarations(keyword, category);
	}

	@Override
	public DeclarationDto getDeclaration(int declarationNum) {
		return declarationDao.selectDeclaration(declarationNum);
	}

	@Override
	public void addDeclaration(Declaration declaration) {
		declarationDao.insertDeclaration(declaration);
	}

	@Override
	public void fixDeclaration(int declarationNum, int declarationStatusCode) {
		declarationDao.updateDeclaration(declarationNum, declarationStatusCode);
	}

	@Override
	public void delDeclaration(int declarationNum) {
		declarationDao.deleteDeclaration(declarationNum);
	}
}
