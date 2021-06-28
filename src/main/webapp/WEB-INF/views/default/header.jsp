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

.wrap { width:1900px; margin: auto;}

.head { width: 100%; height: 100%; margin: auto;}

.bar { position:fixed; list-style: none; display: flex; justify-content: flex-end; 
	width: 2000px; height:25px;}

li {padding-right: 30px;}

header a { color: black; text-decoration: none; padding: 15px; font-size: 13pt;}

.main { text-align: center; margin: auto; padding-top: 80px; }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
	<header>
		
		<div class="wrap">
			<ul class="bar">
		
				<li><a style="padding-right: 850px; font-size: 22pt; color: black;"><b>Hello World</b></a></li>
				
				<li><a href="${contextPath }/index">HOME</a></li>
				
				<li><a href="${contextPath }/board/main">게시판</a></li>
				
				<li>
					<c:choose>
						<c:when test="${loginUser == null }">
							<a href="${contextPath }/member/login">로그인</a>
						</c:when>
						
						<c:otherwise>
							<a href="${contextPath }/member/logout">로그아웃</a>
							<li><a href="${contextPath }/member/info?id=${loginUser }">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
				</li>
				
				
				
				<li><a href="${contextPath }/map/navigate">길찾기</a></li>

				<li><a href="${contextPath }/board/#">이용방법</a></li>
				
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
		

	</header>

</body>
</html>