package com.psvm.curation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.curation.dao.CurationDao;
import com.psvm.curation.vo.Curation;
import com.psvm.fishInfo.vo.Fish;

@Service
public class CurationServiceImpl implements CurationService{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CurationDao curationDao;

	@Override
	public ArrayList<Curation> getQuestionList() {
		
		return curationDao.getQuestionList(sqlSession);
	}

	@Override
	public Fish resultCuration(List<String> resultCuration) {
		HashMap<String, String> map = new HashMap<>();
		
		//DB에 보낼 값 수정
		if(resultCuration.get(0).equals("바다와 민물 사이에 사는 친구")) {
			map.put("fishType", "기수어");
		} else if(resultCuration.get(0).equals("민물에 사는 친구") ) {
			map.put("fishType", "담수어");
		} else if(resultCuration.get(0).equals("바다에 사는 친구")) {
			map.put("fishType", "해수어");
		} else if (resultCuration.get(0).equals("화려한 열대어")){
			map.put("fishType", "열대어");
		} else {
			map.put("fishType", "잘 모르겠어요");
		}
		
		//DB에 보낼 난이도 값 수정
		if(resultCuration.get(3).equals("최선을 다해요")) {
			map.put("difficulty", "어려움");
		} else if(resultCuration.get(3).equals("오구오구 소중해")) {
			map.put("difficulty", "중간");
		} else {
			map.put("difficulty", "쉬움");
		}
		
		//DB에 보낼 최대 길이 수정
		if(resultCuration.get(1).equals("1~6cm")) {
			map.put("max", "6");
		} else if(resultCuration.get(1).equals("7~11cm")) {
			map.put("max", "11");
		} else if(resultCuration.get(1).equals("12~16cm")) {
			map.put("max", "16");
		} else if(resultCuration.get(1).equals("17~21cm")) {
			map.put("max", "21");
		} else if(resultCuration.get(1).equals("22~26cm")) {
			map.put("max", "26");
		} else if(resultCuration.get(1).equals("27~31cm")) {
			map.put("max", "31");
		} else {
			map.put("max", resultCuration.get(1));
		}
		ArrayList<Fish> fishes = curationDao.resultCuration(sqlSession, map);
		
		int random = (int)(Math.random()*fishes.size());

		return fishes.get(random);
	}
	

}
