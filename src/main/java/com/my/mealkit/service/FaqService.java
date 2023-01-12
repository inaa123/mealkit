package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Faq;

public interface FaqService {
	Faq getFaq(int faqNum);
	Faq getAdminDetailFaq(int faqNum);
	List<Faq> getFaqs();
	void addAdminFaq(Faq faq);
	void fixAdminFaq(Faq faq);
	void delAdminFaq(int faqNum);
}
