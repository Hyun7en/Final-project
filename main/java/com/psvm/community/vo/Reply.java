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
public class Reply {
	private int boardReplyNo;
	private int userNo;
	private String nickname;
	private int boardNo;
	private String replyContents;
	private Date replyDate;
	private int replyDibs;
	private String status;
}
