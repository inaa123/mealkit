package com.my.mealkit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Faq {
	private int faqNum;
	private String faqTitle;
	private String faqContent;
}
