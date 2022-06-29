<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my-orders-detail</title>
</head>
<body>
	<c:if test="${orders ne null}">
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
		</table>
	</c:if>
</body>