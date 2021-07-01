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
<script type="text/javascript">
	function searchChk() {
		var searchWord = document.getElementById("searchWord").value;
		if (searchWord != "") {
			fo.submit()
		} else {
			alert('검색어를 입력해주세요.');
		}
	}
</script>
<style type="text/css">
	.page { display: flex; padding-top: 80px; }
	.board { padding-left: 80px; padding-top: 50px; padding-bottom: 80px; height: 700px; }
	.boardtitle { font-size: 50px; }
	.category { width: 200px; height: 500px; padding-top: 230px;}
	.category li a { text-decoration: none; font-size: 20px; }
	.attribute {
		font-size: 25px;
		height: 50px;
		color: #e7708d;
		border-bottom: 3px solid #ccc;
	}
	.boardTable { width: 1000px; }
	.boardTable th { text-align: center; }
	.boardTable td { height: 40px; font-size: 18px; }
	.boardUl li { padding-top: 10px; }
	.footerdiv { padding-top: 132px; }
	.footerhr { margin-top:0px; margin-bottom:0px; border:0; border-top: 1px solid black; }
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	<div class="page main" style="margin: auto; width: 1600px;">
		<div class="category">
			<div style="border: 1px solid gold; height: 310px; margin: 0 auto;">
				<ul class="boardUl">
				<li><a href="${ contextPath }/board/main?boardLocal=전체">전체</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=서울">서울</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=경기/인천">경기/인천</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=강원">강원</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=충청/대전">충청/대전</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=경상/부산">경상/부산</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=전라/광주">전라/광주</a></li>
				<li><a href="${ contextPath }/board/main?boardLocal=제주">제주</a></li>
				</ul>
			</div>
		</div>
		
		<div class="board">
			<h1 class="boardtitle">게시판</h1><br><br>
			<form id="fo" action="${ contextPath }/board/search">
				<select size="1" name="search" style="width: 50px; height: 35px;">
					<option value="board_title" selected>제목</option>
					<option value="user_id">작성자</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요." style="height: 35px; width: 300px;"><button style="height: 35px;" type="button" onclick="searchChk()">검색</button>
				<img src="${contextPath }/resources/image/like.jpg" onclick="location.href='${ contextPath }/board/likelist?userId=${ loginUser }'" style="width: 25px; height: 25px;">
			</form>
			<br>
			<table class="boardTable table-hover" border="1">
				<thead>
				<tr class="attribute">
					<th style="width: 100px;">번호</th><th style="width: 400px;">제목</th><th style="width: 150px;">작성자</th><th style="width: 200px;">작성일</th><th style="width: 150px;">조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${ boardList.size() == 0 }">
						<tr>
							<th colspan="5" style="height: 40px;">등록된 글이 없습니다.</th>
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
	<div class="footerdiv">
	<hr class="footerhr">
	<c:import url="../default/footer.jsp" />
	</div>
</body>
</html>