package com.internousdev.anemone.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.anemone.dao.ProductInfoDAO;
import com.internousdev.anemone.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductListAction extends ActionSupport implements SessionAware{
	private Map<String, Object> session;
	public String execute() {
		
//		sessionのタイムアウト時の処理
		if(!session.containsKey("mCategoryList")){
			return "sessionError";
		}
//		allSearchの中身を空としておき、全検索の引数に渡す
		String[] allSearch = new String[0];

//		商品一覧画面を表示する
		List<ProductInfoDTO> productInfoDtoList = new ArrayList<ProductInfoDTO>();
		ProductInfoDAO productInfoDao = new ProductInfoDAO();
		productInfoDtoList = productInfoDao.getProductInfoList(allSearch, 0);
		session.put("productInfoDtoList", productInfoDtoList);

		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}