package com.psvm.seller.dto;

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
public class OrderOption {
	 private int optionId;
    private int buyCount;
    private int optionPrice;
    private String optionName;
    private String productName;
    private String productImage;

}
