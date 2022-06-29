<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${payment ne null}">
		<table id="table" border="1">
			<tr>
				<td>CID</td>
				<td>TID</td>
				<td>AID</td>
				<td>상태</td>
				<td>주문 ID</td>
				<td>주문자</td>
				<td>상품명</td>
				<td>수량</td>
				<td>총액</td>
				<td>비과세</td>
				<td>과세</td>
				<td>결제 방법</td>
				<td>결제 준비 시각</td>
				<td>결제 완료 시각</td>
				<td>취소 금액</td>
			</tr>
			<c:forEach var="payment" items="${payment}">
				<tr>
					<td>${payment.CID}</td>
					<td>${payment.TID}</td>
					<td>${payment.AID}</td>
					<td>${payment.STATUS}</td>
					<td>${payment.PARTNER_ORDER_ID}</td>
					<td>${payment.PARTNER_USER_ID}</td>
					<td>${payment.ITEM_NAME}</td>
					<td>${payment.QUANTITY}</td>
					<td>${payment.TOTAL_AMOUNT}</td>
					<td>${payment.TAX_FREE_AMOUNT}</td>
					<td>${payment.VAT_AMOUNT}</td>
					<td>${payment.PAYMENT_METHOD_TYPE}</td>
					<td><fmt:formatDate value="${payment.CREATED_AT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${payment.APPROVED_AT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${payment.CANCEL_AMOUNT}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>