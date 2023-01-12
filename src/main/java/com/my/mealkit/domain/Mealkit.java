package com.my.mealkit.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Mealkit {
	private int mealkitNum;
	private String mealkitName;
	private int price;
	private String description;
	private String ingredient;
	private LocalDate mealkitRegDate;
	private String mealkitImgfileName;
	private MultipartFile mealkitImgfile;
	private int foodTypeCode;
	private String foodTypeName;
}
