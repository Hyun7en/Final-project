package com.psvm.commons.vo;

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
public class PageInfo {
	private int listCount;  //총게시글 수
	private int currentPage;//현재페이지
	private int pageLimit;  //페이지하단에 보여질 페이징바의 최대갯수
	private int boardLimit; //한페이지에 보여줄 게시글 수
	
	private int maxPage;// 가장 마지막 페이지수(총 페이지 수)
	private int startPage;//페이징바의 시작수
	private int endPage;//페이징바의 끝수
}
