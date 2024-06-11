package com.psvm.curation.service;

import java.util.ArrayList;
import java.util.List;

import com.psvm.curation.vo.Curation;
import com.psvm.fishInfo.vo.Fish;

public interface CurationService {
	public ArrayList<Curation> getQuestionList();
	
	public Fish resultCuration(List<String> clickedTextList);
}
