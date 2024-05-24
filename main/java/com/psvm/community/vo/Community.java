package com.psvm.community.vo;

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
public class Community {
	private int boardNo; //게시글 번호
	private String nickname; //작성자 이름
	private int userNo; //작성자 번호
	private int boardLevel; //게시판 종류
	private Date writeDate; //작성날짜
	private String boardTitle; //제목
	private String boardContents; //내용
	private int boardCount; //조회수
	private int boardDibs; //추천
	private String status; //활성화 여부(Y=게시판에 표시 N=삭제됨)
}
