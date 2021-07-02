<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function showPopup() {
	window.open("/root/board/how", "", "width=500, height=600, top=60");
}
</script>

<style type="text/css">
* { margin: 0;}
.wrap { width:2000px; margin: auto;}
.head { width: 100%; height: 100%; margin: auto;}
.bar { position:fixed; list-style: none; display: flex; justify-content: flex-end;  width: 2000px; height:45px; z-index: 9998; background-color: rgba(0,0,0,.6); color: white; transition: all 0.5s;}
.bar li {padding-right: 20px; position: relative; right: 150px; font-size: 20pt;}

a b:hover{  padding-bottom: 3px; border-bottom: 1px solid orange; transition: all 0.5s; }
ul li a b { color: white;}
header a { text-decoration: none; padding: 15px; font-size: 13pt;}

.bar a { color: black; text-decoration: none; padding: 15px; font-size: 13pt;}
.main { text-align: center; margin: auto; padding-top: 80px; }
footer { font-size: 20pt; color: pink; text-align: center; font-family: monospace; font-style: italic; }
</style>

</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<header>
		<div class="wrap">
			<ul class="bar">
				<li style="font-size: 22pt; position: absolute; right: 1800px"><b>Hello World</b></li>
				<li><a href="${contextPath }/index"><b>HOME</b></a></li>
				<li><a href="${contextPath }/board/main"><b>게시판</b></a></li>
				<li>
					<c:choose>
						<c:when test="${loginUser == null }">
							<a href="${contextPath }/member/login"><b>로그인</b></a>
						</c:when>
						<c:otherwise>
							<a href="${contextPath }/member/logout"><b>로그아웃</b></a>
							<li><a href="${contextPath }/member/info?id=${loginUser }"><b>마이페이지</b></a></li>
						</c:otherwise>
					</c:choose>
				</li>
				<li onclick="showPopup()"><a href=""><b>이용방법</b></a></li>
			</ul>
		</div>
	</header>
</body>
</html>