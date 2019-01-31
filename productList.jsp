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
	int i = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/productList.css">

<title>商品一覧</title>
</head>
<body>
	<s:include value="header.jsp" />
	<div id="contents">
		<h1>商品一覧画面</h1>
		<s:if test="!keywordsErrorMessageList.isEmpty()">
			<div class="message message_error">
				<s:iterator value="keywordsErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</s:if>

		<!--  検索結果でヒットしなかった場合	-->
		<s:elseif test="#session.productInfoDtoList==null">
			<div class="message message_nomal">検索結果がありません。</div>
		</s:elseif>

		<!-- 商品情報を昇順でループ処理	-->
		<s:else>
			<div id="product-list">
				<s:iterator value="#session.productInfoDtoList">
				<%if(i == 0) { %>
					<div class="wrap">
				<%
					}
				%>
					<div class="product-list-box">
						<ul>
							<li>
								<a	href='<s:url action="ProductDetailsAction">
									<s:param name="productId" value="%{productIdNumber}"/>
								</s:url>'>
							<img	src='<s:property value="productImageFilePath"/>/<s:property value="productImageFileName"/>'class="item-image-box-250 imgAnimation" /></a>
							<br>
							<br>
							<s:property	value="productName" /><br>
							<s:property	value="productNameKana" /><br>
							<s:property	value="productPrice" />円<br>
							</li>
						</ul>
					</div>
				<%if(i == 2) { %>
					</div>
				<%
					i = -1;
					}
					i++;
				%>
				</s:iterator>
			</div>
		</s:else>
	</div>
	<s:include value="footer.jsp" />
</body>
</html>