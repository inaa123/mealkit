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
public class Notice {
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate noticeRegdate;
	private String noticeImgFileName;
	private MultipartFile noticeImgFile;
	private String keyword;
	private Object noticeMaxNum;
}
