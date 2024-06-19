package com.psvm.seller.dto;

import java.util.List;

import com.psvm.seller.vo.Buy;

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
public class CartDTO {
	 private List<Buy> options;
	 private String pno;
}
