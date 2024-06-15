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
public class Alarm {
	int alarmNo;
	int userNo;
	int sellerPageNo;
	String alarmContents;
	Date alarmDate;
	boolean alarmCheck;
	String storeName;
}
