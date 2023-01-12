package com.my.mealkit.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {
	private int orderNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate orderDate;
	private String request;
	private String userId;
	private int paymentCode;
	private int orderStatusCode;
	private String paymentName;
	private String orderStatusName;
	private int price;
	private int mealkitNum;
	private String mealkitName;
	private int orderMealkitNum;
	private int orderMealkitCount;
}