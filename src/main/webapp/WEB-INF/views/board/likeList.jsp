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
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" /><hr>
	<div class="page main">
		<div class="board">
			<h1>저장된 게시글</h1>
			<table border="1">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<c:choose>
					<c:when test="${ boardLikeList.size() == 0 }">
						<tr>
							<th colspan="5">저장된 글이 없습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${ boardLikeList }">
							<tr>
								<td>${ dto.boardId }</td><td><a href="${ contextPath }/board/contentview?boardId=${ dto.boardId }">${ dto.title }</a></td>
								<td>${ dto.userId }</td><td>${ dto.day }</td>
								<td>${ dto.hit }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="4">
						<c:forEach var="num" begin="1" end="${ repeat }">
							<a href="${ contextPath }/board/likelist?userId=${ loginUser }&num=${num}">${ num }</a>&nbsp;
						</c:forEach>
					</td>
					<td>
						<button onclick="location.href='${ contextPath }/board/main'">목록으로</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>