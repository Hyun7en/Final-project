package com.psvm.seller.vo;

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
public class ProductOption {
	private int pdCount;
	private String pdStatus;
	private int pdNo;
	private int pno;
	private String optionName;
	private int pdOptionNo;
	private String optionStatus;
	
}
