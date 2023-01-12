package com.my.mealkit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class OrderMealkitDto {
	private String orderMealkitNum;
	private int orderMealkitCount;
	private int orderNum;
	private int mealkitNum;
}
