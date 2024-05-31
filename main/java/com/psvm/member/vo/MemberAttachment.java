package com.psvm.member.vo;

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
public class MemberAttachment {
	private int memberFileNo;
	private int refMno;
	private String uploadDate;
	private int fileLevel;
	private String originName;
	private String changeName;
}
