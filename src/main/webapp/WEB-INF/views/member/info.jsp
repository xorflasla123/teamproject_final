<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
		<div style="width: 300px; margin: 0 auto;">
			<table style="width: 300px; height: 500px;">
				<tr>
					<th>아이디</th>
					<td>${info.id }</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>${info.pwd }</td>
				</tr>
				
				<tr>
					<th>이 름</th>
					<td>${info.name }</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>${info.email }</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>${info.num }</td>
				</tr>
				
				<tr>
					<th>주 소</th>
					<td>${info.addr }</td>
				</tr>
				
				<c:if test="${loginUser == info.id }">
					<tr>
						<td colspan="2">

							<button id="delete"   onclick="location.href='delete?id=${info.id}'">삭제</button>
							<button id="infomodify"  onclick="location.href='modify_form?id=${info.id}'">수정</button>
							<button id="info"  onclick="location.href='/root/index'">돌아가기</button>

						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

</body>
</html>