<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	java.util.Calendar objCal1 = java.util.Calendar.getInstance();
	java.util.Calendar objCal2 = java.util.Calendar.getInstance();
	objCal2.set(1970, 0, 1, 0, 0, 0);
	response.setDateHeader("Last-Modified", objCal1.getTime().getTime());
	response.setDateHeader("Expires", objCal2.getTime().getTime());
	response.setHeader("progma", "no-che");
	response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/productDetails.css">
<title>商品詳細</title>
</head>


<body>
<s:include value="header.jsp" />
<div id="contents">
	<h1>商品詳細画面</h1>

	<s:form action="AddCartAction">
	<div class="product_box">
	<div class="2column-container">
	<div class="left">
		<img src='<s:property value="%{#session.productImageFilePath}"/>/<s:property value="%{#session.productImageFileName}"/>' class="item-image-box-320"/><br>
	</div>
	<div class="right">
	<table class="vertical-list-table">

		<tr>
			<th scope="row"><s:label value="商品名"/></th>
			<td><s:property value="%{#session.productName}"/></td>
		</tr>
		<tr>
			<th scope="row"><s:label value="商品名ふりがな"/></th>
			<td><s:property value="%{#session.productNameKana}"/></td>
		</tr>
		<tr>
			<th scope="row"><s:label value="値段"/></th>
			<td><s:property value="%{#session.productPrice}"/>円</td>
		</tr>
		<tr>
			<th scope="row"><s:label value="購入個数"/></th>
			<td><s:select name="productCount" list="%{#session.productCountList}" class="select_box"/>個</td>
		</tr>
		<tr>
			<th scope="row"><s:label value="発売会社名"/></th>
			<td><s:property value="%{#session.productReleaseCompany}"/></td>
		</tr>
		<tr>
			<th scope="row"><s:label value="発売年月日"/></th>
			<td><s:property value="%{#session.productReleaseDate}"/></td>
		</tr>
		<tr>
			<th scope="row"><s:label value="商品詳細情報"/></th>
			<td><s:property value="%{#session.productDescription}"/></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	<div class="submit_btn_box">
	<s:submit value="カートに追加" class="submit_btn" />
	</div>
	</s:form>

	<div class="product_box">
	<!-- 関連商品情報 -->
<div class="product-details-recomｍend-box">
<s:iterator value="#session.productInfoDtoList">
		<div class="recommend-box imgAnimation">
		<a href='<s:url action="ProductDetailsAction">
		<s:param name="productId" value="%{productIdNumber}"/>
		</s:url>'><img src='<s:property value="productImageFilePath"/>/<s:property value="productImageFileName"/>' class="item-image-box-170"/></a><br>
		<s:property value="productName"/><br>
		</div>
</s:iterator>
</div>
</div>
</div>
<s:include value="footer.jsp"/>
</body>
</html>