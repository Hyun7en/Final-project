package com.psvm.myPage.vo;

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
public class OrderHistory {
	private int pdNo;
	private int poNo;
	private String buyDate;
	private String pdChangeName;
	private String pdTitle;
	private String pdOptionName;
	private int buyCount;
	private int pdPrice;
	private String storeName;
}
