<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my-orders-list</title>
<style>
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
*/
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orders span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
</head>
<body>
	<c:if test="${ordersList ne null}">
		<table id="table" border="1">
		
			<tr>
				<td>ORDERS_ID</td>
				<td>USER_ID</td>
				<td>PRODUCT_ID</td>
				<td>PAYMENT_ID</td>
				<td>COUNT</td>
				<td>ORDERSDATE</td>
				<td>PRICE</td>
				<td>TOTAL_PRICE</td>
				<td>STATUS</td>
			</tr>
			<c:forEach var="orders" items="${ordersList}">
			<tr>
				<td>${orders.ORDERS_ID}</td>
				<td>${orders.USER_ID}</td>
				<td>${orders.PRODUCT_ID}</td>
				<td>${orders.PAYMENT_ID}</td>
				<td>${orders.COUNT}</td>
				<td><fmt:formatDate value="${orders.ORDERSDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${orders.PRICE}</td>
				<td>${orders.TOTAL_PRICE}</td>
				<td>${orders.STATUS}</td>
			</tr>
			</c:forEach>
			
		</table>
	</c:if>
</body>