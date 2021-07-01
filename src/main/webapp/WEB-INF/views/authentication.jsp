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

	<c:if test="${userid != null }">
		<h3>${userid }님이메일 인증 되었습니다</h3>
		<h2>회원님의 인증번호는 ${userkey } 입니다</h2>
	</c:if>

	<c:if test="${userid == null }">
		<a href="${contextPath }/auth?email=${email}">이메일 인증하기</a>
	</c:if>
</body>
</html>