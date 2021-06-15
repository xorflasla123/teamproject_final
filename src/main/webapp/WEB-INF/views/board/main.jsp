<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	.page { display: flex; padding-top: 80px; }
	.board { padding-left: 100px; }
	li a { text-decoration: none; }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" /><hr>
	<div class="page main">
		<div>
			<ul type="circle">
			<li><a href="">서울</a></li>
			<li><a href="">경기/인천</a></li>
			<li><a href="">강원</a></li>
			<li><a href="">충청</a></li>
			<li><a href="">경상/부산</a></li>
			<li><a href="">전라</a></li>
			<li><a href="">제주</a></li>
			</ul>
		</div>
		<div class="board">
			<h1>게시판</h1>
			<input type="text" placeholder="검색어를 입력하세요."><button onclick="">검색</button>
			<table border="1">
				<tr>
					<th></th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>좋아요</th>
				</tr>
				<c:choose>
					<c:when test="">
						<tr>
							<th colspan="6">등록된 글이 없습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td></td><td></td><td></td><td></td><td></td><td></td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="6">
						<button onclick="location.href='${contextPath}/board/write'">글쓰기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>