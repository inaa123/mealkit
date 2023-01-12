package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.FaqDao;
import com.my.mealkit.domain.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired private FaqDao faqDao;
	
	@Override
	public Faq getFaq(int faqNum) {
		return faqDao.selectFaq(faqNum);
	}
	
	@Override
	public List<Faq> getFaqs() {
		return faqDao.selectFaqs();
	}
	
	@Override
	public Faq getAdminDetailFaq(int faqNum) {
		return faqDao.selectAdminDetailFaq(faqNum);
	}
	
	@Override
	public void addAdminFaq(Faq faq) {
		faqDao.insertAdminFaq(faq);
	}
	
	@Override
	public void fixAdminFaq(Faq faq) {
		faqDao.updateAdminFaq(faq);
	}
	
	@Override
	public void delAdminFaq(int faqNum) {
		faqDao.deleteAdminFaq(faqNum);
	}
}
