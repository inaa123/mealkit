package com.my.mealkit.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor 
@Data
public class Review {
	private int reviewNum;
	private String reviewTitle;
	private String reviewContent;
	private int rate;
	private String reviewImgfileName;
	private MultipartFile reviewImgfile;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate reviewRegDate;
	private String orderMealkitNum;
	private String userId;
	private String mealkitName;
	private int mealkitNum;
	private String star;
}
