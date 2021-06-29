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
	<h1>아 이 디 찾 기</h1>
	<div>
		<form action="${contextPath }/member/id_check" method="post">
			<input type="text" name="email" placeholder="등록한 이메일 입력"><br>
			<input type="submit" value="확 인">
		
		</form>
	</div>



</body>
</html>