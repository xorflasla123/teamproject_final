<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0;}

.head { width: 100%; height: 100%; margin: auto;}

.bar { position:fixed; list-style: none; display: flex; justify-content: flex-end; 
	width: 100%; height:25px; padding: 10px; margin: auto; }


header a { color: black; text-decoration: none; padding: 15px; font-size: 13pt;}

.main { text-align: center; margin: auto; padding-top: 80px; }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
	<header>
		
		<div>
			<ul class="bar">
				<b style="padding-right: 1200px; font-size: 22pt; color: black;" >Hello World</b>
				
				<li><a href="${contextPath }/index">HOME</a></li>
				
				<li><a href="${contextPath }/board/main">게시판</a></li>
				
				<li>
					<c:choose>
						<c:when test="${loginUser == null }">
							<a href="${contextPath }/member/login">로그인</a>
						</c:when>
						
						<c:otherwise>
							<a href="${contextPath }/member/logout">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</li>
				
				<li>
					<c:choose>
						<c:when test="${loginUser != null }">
							<a href="${contextPath }/member/userInfo">마이페이지</a>
						</c:when>
					</c:choose>
				</li>
				
				<li><a href="${contextPath }/board/#">이용방법</a></li>
				
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
		

	</header>

</body>
</html>