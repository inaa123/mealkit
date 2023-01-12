package com.my.mealkit.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class Declaration {
	private int declarationNum;
	private String declarationTitle;
	private String declarationContent;
	private LocalDate declarationRegdate;
	private String userId;
	private int reviewNum;
	private int declarationStatusCode;
}