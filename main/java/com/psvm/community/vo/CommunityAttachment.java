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
public class CommunityAttachment {
	private int fileNo; //파일 번호
	private int refNo; //참조번호
	private Date uploadDate; // 업로드일
	private int fileLevel; // 파일 레벨
	private String filePath; // 파일 경로
	private String originName; // 파일 원본이름
	private String changeName; // 파일 DB이름
}
