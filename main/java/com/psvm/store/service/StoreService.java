package com.psvm.store.service;

import java.util.ArrayList;

import com.psvm.store.vo.StoreInfo;

public interface StoreService {
	StoreInfo selectSellersStore(int sellerPageNo);
	
	ArrayList<StoreInfo> getCategory(int sellerPageNo);
}
