package com.my.mealkit.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LogoDto {
	private MultipartFile logo;
}
