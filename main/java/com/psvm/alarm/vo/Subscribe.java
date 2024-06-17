package com.psvm.alarm.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Subscribe {
	int userNo;
	int sellerPageNo;
	int alarm;
	Date subDate;
	String nickName;
}
