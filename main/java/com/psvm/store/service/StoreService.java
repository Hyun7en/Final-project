package com.psvm.store.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.psvm.commons.vo.PageInfo;
import com.psvm.store.vo.StoreInfo;

public interface StoreService {
	StoreInfo selectSellersStore(int sellerPageNo);
	
	ArrayList<StoreInfo> getCategory(int sellerPageNo);
	
	int selectProductCount(HashMap<String, String> map);
	
	ArrayList<StoreInfo> selectProductList(PageInfo pi, HashMap<String, String> map);
	
	int selectCategoryCount(HashMap<String, String> map);
	
	ArrayList<StoreInfo> selectProductCategory(PageInfo pi, HashMap<String, String> map);
	
	int ajaxAlarmCheck(StoreInfo checker);
	
	int ajaxAlarmOn(StoreInfo checker);
	
	int ajaxAlarmOff(StoreInfo checker);
	
	int ajaxLoveitCheck(StoreInfo checker);
	
	int ajaxLoveitOn(StoreInfo checker);
	
	int ajaxLoveitOff(StoreInfo checker);
}
