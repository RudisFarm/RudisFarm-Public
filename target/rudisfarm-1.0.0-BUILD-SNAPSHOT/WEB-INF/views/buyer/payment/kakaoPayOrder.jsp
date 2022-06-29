<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주문 내역입니다.</h2>

<table border="1">
	<tr>
	 <th>주문</th>
		<td>결제일시</td>
		<td>주문번호</td>
		<td>상품명</td>
		<td>상품수량</td>
		<td>결제금액</td>
		<td>결제방법</td>
		<td>결제상태</td>
	</tr>
	<tr>
	<th>주문 정보</th>
		<td>${info.approved_at}</td>
		<td>${info.partner_order_id}</td>
		<td>${info.item_name}</td>
		<td>${info.quantity}</td>
		<td>${info.amount.total}</td>
		<td>${info.payment_method_type}</td>
		<td>${info.status}</td>
	</tr>
</table>

<h2>[[->${info}]]</h2>
	
	<form action="kakaopaycancel/아싸" method="post">
		<input type="hidden" name="tid" value="${info.tid}">
		<button type="submit">결제 취소하기</button>
	</form>
	
</body>
</html>