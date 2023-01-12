package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.FaqMap;
import com.my.mealkit.domain.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired private FaqMap faqMap;
	
	@Override
	public Faq selectFaq(int faqNum) {
		return faqMap.selectFaq(faqNum);
	}
	
	@Override
	public List<Faq> selectFaqs() {
		return faqMap.selectFaqs();
	}
	
	@Override
	public Faq selectAdminDetailFaq(int faqNum) {
		return faqMap.selectAdminDetailFaq(faqNum);
	}
	
	@Override
	public void insertAdminFaq(Faq faq) {
		faqMap.insertAdminFaq(faq);
	}
	
	@Override
	public void updateAdminFaq(Faq faq) {
		faqMap.updateAdminFaq(faq);
	}
	
	@Override
	public void deleteAdminFaq(int faqNum) {
		faqMap.deleteAdminFaq(faqNum);
	}
}
