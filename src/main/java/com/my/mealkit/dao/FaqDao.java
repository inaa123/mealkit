package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Faq;

public interface FaqDao {
	Faq selectFaq(int faqNum);
	Faq selectAdminDetailFaq(int faqNum);
	List<Faq> selectFaqs();
	void insertAdminFaq(Faq faq);
	void updateAdminFaq(Faq faq);
	void deleteAdminFaq(int faqNum);
}
