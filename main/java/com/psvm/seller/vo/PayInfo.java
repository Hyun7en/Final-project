package com.psvm.seller.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PayInfo {
	private int payNo;
	private int[] pdOptionNo;
	private int userNo;
	private int businessNo;
	private Date payDate;
	private int[] payCount;
	private int payMoney;
	private String deliveryAddress;
	private String deliveryDetailAddress;
	private int deliveryStatus;
	private String deliveryName;
	private String recipient;
	private String recipientPhone;
	
}
