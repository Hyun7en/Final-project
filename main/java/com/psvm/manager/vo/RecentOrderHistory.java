package com.psvm.manager.vo;

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
public class RecentOrderHistory {
	private int payNo;
	private String userName;
	private String phone;
	private int payMoney;
	private String payDate;
}
