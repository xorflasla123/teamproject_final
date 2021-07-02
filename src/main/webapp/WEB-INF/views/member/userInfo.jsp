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
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<div class="wrap">
		<div style="width: 300px; margin: 0 auto;">
			<h1 style="test-align: center;">회 원 정 보</h1>
			<table border="1" >
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이 름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주 소</th>
				</tr>

				<c:forEach var="dto" items="${memberList }">
					<tr>
						<td><a href="${contextPath }/member/info?id=${loginUser }">${dto.id }</a></td>
						<td>${dto.pwd }</td>
						<td>${dto.name }</td>
						<td>${dto.email }</td>
						<td>${dto.num }</td>
						<td>${dto.addr }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>