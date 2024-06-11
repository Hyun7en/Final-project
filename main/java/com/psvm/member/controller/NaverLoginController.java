package com.psvm.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;

@Controller
public class NaverLoginController {
	
	@Value("${sns.naver.clientId}")
	private String clientId;
	
	@Value("${sns.naver.clientSecret}")
	private String clientSecret;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("naverLogin.me")
	public String naverLoginCallback(HttpServletRequest request, @RequestParam(name="recentLink", defaultValue="/") String recentLink, HttpSession session, String saveId, HttpServletResponse response) {
		
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		
		try {
			String redirectURI = URLEncoder.encode("http://localhost:8888/psvm/naverLogin.me", "UTF-8");
			String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
			apiURL += "&client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			

			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//HTTP요청에 대한 응답코드 확인
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			//응답데이터를 읽어온다.
			String inputLine;
			StringBuffer res = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			
			if (responseCode == 200) {
				//정상적으로 정보를 받아왔을 때 result에 정보를 저장
				String result = res.toString();

				
				JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
				
				String token = totalObj.get("access_token").getAsString(); //정보접근을 위한 토큰
				String header = "Bearer " + token;
				
				apiURL = "https://openapi.naver.com/v1/nid/me";
				Map<String, String> requestHeaders = new HashMap<String, String>();
				requestHeaders.put("Authorization", header);
				
				String responseBody = get(apiURL, requestHeaders);
				
				JsonObject memberInfo = JsonParser.parseString(responseBody).getAsJsonObject();
				JsonObject resObj = memberInfo.getAsJsonObject("response");
				
				Member naverUser = new Member();
				
				String userId = resObj.get("id").getAsString();
				naverUser.setUserId(userId);
				
				String encPwd = bcryptPasswordEncoder.encode("NaverUser");
				naverUser.setUserPwd(encPwd);
				
				int idCheck = memberService.idCheck(userId);
				
				if (idCheck == 0) { //아이디가 없으므로 회원으로 등록
					
					naverUser.setEmail(resObj.get("email").getAsString());
					naverUser.setUserName(resObj.get("name").getAsString());
					naverUser.setNickname(resObj.get("nickname").getAsString());
					
					String birthday = (resObj.get("birthday").getAsString()).replace("-", "");
					naverUser.setBirthday(resObj.get("birthyear").getAsString() + birthday);
					
					naverUser.setGender(resObj.get("gender").getAsString());
					naverUser.setAddress("정보 미제공");
					naverUser.setPhone((resObj.get("mobile").getAsString()).replace("-", ""));
					
					memberService.signupMember(naverUser);
				}
				
				Member loginUser = memberService.loginMember(naverUser);
				
				Cookie ck = new Cookie("saveId", loginUser.getUserId());
		        if (saveId == null) {
		            ck.setMaxAge(0);
		        }
				response.addCookie(ck);
		        session.setAttribute("successMessage", "로그인에 성공했습니다!");
		        session.setAttribute("loginUser", loginUser);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + recentLink;
		
	}
	
	//API에 GET요청 보내고 응답을 받아오는 메서드
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection conn = connect(apiUrl);
		
		try {
			conn.setRequestMethod("GET");
			
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				conn.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = conn.getResponseCode();
			if(responseCode == 200) {
				return readBody(conn.getInputStream());
			} else {
				return readBody(conn.getErrorStream());
			}
			
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패. : " + apiUrl, e);
		} finally {
			conn.disconnect();
		}
	}
	
	//API에 연결하기위한 HttpURLConnection객체를 생성하고 반환하는 메서드
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("연결이 실패하였습니다. : " + apiUrl, e);
		} 
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader br = new BufferedReader(streamReader)){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패하였습니다.", e);
		}
		
	}
}
