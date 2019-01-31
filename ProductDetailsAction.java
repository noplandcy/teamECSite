package com.internousdev.anemone.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.anemone.dao.ProductInfoDAO;
import com.internousdev.anemone.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductDetailsAction extends ActionSupport implements SessionAware{
	private int productId;
	private Map<String, Object> session;
	public String execute() {
		String result = ERROR;


//		sessionのタイムアウト時の処理
		if(!session.containsKey("mCategoryList")) {
			return "sessionError";
		}


//		必要な情報をproductInfoからもらう
		ProductInfoDAO productInfoDAO = new ProductInfoDAO();
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		productInfoDTO = productInfoDAO.getProductInfo(productId);
		session.put("productId", productInfoDTO.getProductIdNumber());						//商品ID
		session.put("productName", productInfoDTO.getProductName());						//商品名
		session.put("productNameKana", productInfoDTO.getProductNameKana());				//商品名かな
		session.put("productImageFilePath", productInfoDTO.getProductImageFilePath());		//商品画像パス
		session.put("productImageFileName", productInfoDTO.getProductImageFileName());		//商品画像ファイル名
		session.put("productPrice", productInfoDTO.getProductPrice());						//商品金額

		session.put("productReleaseCompany", productInfoDTO.getProductReleaseCompany());	//発売した会社
		session.put("productReleaseDate", productInfoDTO.getProductReleaseDate());			//発売した日
		session.put("productDescription", productInfoDTO.getProductDescription());			//商品の詳細情報

//	購入個数最低 1-5までセレクト・オプション負担を減らすためのメソッド
		List<Integer> productCountList = new ArrayList<Integer>(Arrays.asList(1,2,3,4,5));
		session.put("productCountList", productCountList);

//	関連商品情報一覧
		List<ProductInfoDTO> productInfoDtoList = new ArrayList<ProductInfoDTO>();
		productInfoDtoList = productInfoDAO.getRecomendItems(productInfoDTO.getProductCategoryId(), productId);
		if(productInfoDtoList.size() > 0) {
			result = SUCCESS;
		}
		session.put("productInfoDtoList", productInfoDtoList);

		return result;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}