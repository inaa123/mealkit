package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Faq;

public interface FaqMap {
	Faq selectFaq(@Param("faqNum") int faqNum);
	Faq selectAdminDetailFaq(@Param("faqNum") int faqNum);
	List<Faq> selectFaqs();
	void insertAdminFaq(Faq faq);
	void updateAdminFaq(Faq faq);
	void deleteAdminFaq(@Param("faqNum") int faqNum);
}
