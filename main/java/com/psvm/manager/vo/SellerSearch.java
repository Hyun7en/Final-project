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
public class SellerSearch {
	private String condition;
	private String searchKeyword;
	private String startDate;
	private String endDate;
	private int currentPage;
}
