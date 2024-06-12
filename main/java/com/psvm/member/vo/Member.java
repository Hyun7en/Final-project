package com.psvm.member.vo;

import java.sql.Date;

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
public class Member {
	private int userNo; //회원번호
	private String userId; //아이디
	private String userPwd; //비밀번호
	private String email; //이메일
	private String userName; //이름
	private String nickname; //닉네임
	private String birthday; //생년월일
	private String gender; //성별
	private String address; //주소지
	private String phone; //전화 번호
	private String likeFish; // 좋아하는 물고기
	private String tailFish; // 키우는 물고기
	private int authority; //권한
	private String activated; //탈퇴여부
	private int userLv; //레벨
	private Date joinDate; //가입일자
	private int	memberFileNo; // 썸네일
	private String userIntro; //한줄소개
	private String changeName; // 썸네일 파일명
}
