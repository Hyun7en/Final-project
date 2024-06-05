package com.psvm.seller.vo;

import java.util.List;

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
public class ProductCategory {

	private int caNo;
	private String pdCategory;
	private int sellerPageNo;
	
	private List<ProductCategory> addedCategories;
    private List<ProductCategory> deletedCategories;
    
}
