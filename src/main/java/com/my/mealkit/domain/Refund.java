package com.my.mealkit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Refund {
	private int refundNum;
	private String refundContent;
	private int orderNum;
	private int refundReasonCode;
	private String refundReasonName;
	private int refundStatusCode;
	private String refundStatusName;
	private String userId;
	private String mealkitName;
}
