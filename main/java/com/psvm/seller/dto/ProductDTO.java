package com.psvm.seller.dto;

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
public class ProductDTO {
	//회원
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
	
	//사업자
	private int businessNo;
	private String businessName;
	private String subBusinessName;
	private Date openBusinessDate;
	private String storeName;
	private int crn;
	private String mainBusinessName;
	private String mainItemName;
	private String businessAddress;
	private String businessAccount;
	private String status;
	
	//판매자 홈페이지
	private int sellerPageNo;
	private String sellerExplain;
	private Date spEnrollDate;
	private String spOriginName;
	private String spChangeName;
	
	//카테고리
	private int caNo;
	private String Category;
	
	//상품
	private int pdNo;
	private String pdCategory;
	private String pdTitle;
	private int pdPrice;
	private String pdContent;
	private Date pdEnrollDate;
	private int pdStar;
	private String pdOriginName;
	private String pdChangeName;
	private String pdStatus;
	
	//옵션
	private int pdCount;
	private String poStatus;
	private String optionName;
	private int pdOptionNo;
	
	//리뷰
	private int replyNo;
	private Date reviewDate;
	private int reviewDibs;
	private String reviewContents;
	private int averReviewDibs;
	private int reviewCount;
}
