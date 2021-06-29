<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
	.page { display: flex; padding-top: 80px; }
	.board { padding-left: 100px; }
	li a { text-decoration: none; }
	.attribute {
		padding: 10px;
		vertical-align: top;
		color: #e7708d;
		border-bottom: 3px solid #ccc;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" /><hr>
	<div class="page main" style="margin: auto; width: 1000px;">
		<div>
			<ul type="circle">
			<li><a href="${ contextPath }/board/main?boardLocal=전체">전체</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=서울">서울</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=경기/인천">경기/인천</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=강원">강원</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=충청">충청</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=경상/부산">경상/부산</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=전라">전라</a></li>
			<li><a href="${ contextPath }/board/main?boardLocal=제주">제주</a></li>
			</ul>
		</div>
		<div class="board">
			<h1>게시판</h1>
			<form action="${ contextPath }/board/search">
				<select size="1" name="search">
					<option value="board_title" selected>제목</option>
					<option value="user_id">작성자</option>
				</select>
				<input type="text" name="searchWord" placeholder="검색어를 입력하세요."><button type="submit">검색</button>
				<img src="${contextPath }/resources/image/like.jpg" onclick="location.href='${ contextPath }/board/likelist?userId=${ loginUser }'" style="width: 20px; height: 20px;">
			</form>
			<table class="table table-hover" border="1">
				<thead>
				<tr class="attribute">
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${ boardList.size() == 0 }">
						<tr>
							<th colspan="5">등록된 글이 없습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${ boardList }">
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
							<c:choose>
									<c:when test="${ boardLocal == '전체' }">
										<a href="${ contextPath }/board/main?boardLocal=${ boardLocal }&num=${num}">${ num }</a>&nbsp;
									</c:when>
									<c:otherwise>
										<a href="${ contextPath }/board/main?boardLocal=${ boardLocal }&num=${num}">${ num }</a>&nbsp;
									</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
					<td>
						<c:choose>
							<c:when test="${ boardLocal == '전체' }">
								<button onclick="location.href='${contextPath}/board/write?boardLocal=서울'">글쓰기</button>
							</c:when>
							<c:otherwise>
								<button onclick="location.href='${contextPath}/board/write?boardLocal=${ boardLocal }'">글쓰기</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>