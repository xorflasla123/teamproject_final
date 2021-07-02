<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script><title>게시판</title>
<title>게시판</title>
<style type="text/css">
	.page { display: flex; padding-top: 80px; }
	.board { padding-left: 430px; padding-top: 50px; padding-bottom: 80px; height: 700px; }
	.boardtitle { font-size: 50px; }
	.attribute {
		font-size: 25px;
		height: 50px;
		color: #4b4d4d;
		border-bottom: 3px solid #ccc;
	}
	.boardTable { width: 1000px; }
	.boardTable th { text-align: center; }
	.boardTable td { height: 40px; font-size: 18px; }
	.footerdiv { padding-top: 132px; }
	.footerhr { margin-top:0px; margin-bottom:0px; border:0; border-top: 1px solid black; }
	.noboard:hover { background-color: #f8fdf1; }
</style>
</head>
<body style="background-color: #fff7e6;">
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	<div class="page main">
		<div class="board">
			<h1 class="boardtitle">저장된 게시글</h1><br><br>
			<table class="boardTable table-hover" style="background-color: #f8fdf1;" border="1">
				<thead>
				<tr class="attribute">
					<th style="width: 100px;">번호</th><th style="width: 400px;">제목</th>
					<th style="width: 150px;">작성자</th><th style="width: 200px;">작성일</th>
					<th style="width: 150px;">조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${ boardLikeList.size() == 0 }">
						<tr>
							<th class="noboard" colspan="5" style="height: 40px; font-size: 18px;">저장된 글이 없습니다.</th>
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
				</tbody>
				<tfoot>
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
				</tfoot>
			</table>
		</div>
	</div>
	<div class="footerdiv">
	<hr class="footerhr">
	<c:import url="../default/footer.jsp" />
	</div>
</body>
</html>