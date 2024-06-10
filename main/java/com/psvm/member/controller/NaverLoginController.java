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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class NaverLoginController {
	
	@RequestMapping("naverLogin.me")
	public String naverLoginCallback(HttpServletRequest request) {
		
		String clientId = "USGHlbNkhJtAYXzsBoJd";
		String clientSecret = "WhPtghFgR9";
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
				System.out.println(totalObj.get("access_token"));
				
				String token = totalObj.get("access_token").getAsString(); //정보접근을 위한 토큰
				String header = "Bearer " + token;
				
				apiURL = "https://openapi.naver.com/v1/nid/me";
				Map<String, String> requestHeaders = new HashMap<String, String>();
				requestHeaders.put("Authorization", header);
				
				String responseBody = get(apiURL, requestHeaders);
				
				JsonObject memberInfo = JsonParser.parseString(responseBody).getAsJsonObject();
				JsonObject resObj = memberInfo.getAsJsonObject("response");
				
				System.out.println(resObj);
				//받아온 email과 데이터베이스의 email을 비교하여 가입유무 확인 후
				//가입되어있다면 로그인, 아니라면 회원가입창으로 정보를 가지고 이동
				//resObj.get().getAs();
				//get()의 괄호 안에 "키" 입력
				//id, nickname, profile_image, gender, email, mobile, mobile_e164, name, birthday, birthyear를 가져옴.
				//이 중 nickname, mobile, birthday, birthyear은 양식에 맞게 재설정.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:login.me";
		
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
