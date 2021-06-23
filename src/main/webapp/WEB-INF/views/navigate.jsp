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

	<form action="${contextPath }/navi" method="get" target="_blank">
		<input type="text" name="dep" placeholder="출발지 입력"><br>
		<input type="text" name="arr" placeholder="도착지 입력"><br>
		<input type="submit" value="검색">
	</form>

</body>
</html>