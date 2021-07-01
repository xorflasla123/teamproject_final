<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<c:import url="../default/header.jsp" />
	<br>
	<br>
	<div class="wrap">
		<h1 style="text-align: center;">게시판</h1>
		<table class="table" border="1">
			<tr>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:if test="${memoList.size() == 0 }">
				<tr>
					<th colspan="2">저장 데이터 없음</th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${memoList }">
				<tr>
					<td>
						<a href="${contextPath }/map/mapView?memo_id=${dto.memo_id}">${dto.title }</a>
					</td>
					<td>${dto.saveDate }</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4">
					<c:forEach var="num" begin="1" end="${repeat }">
							<a href="${contextPath }/map/memolist?num=${num}">${num } &nbsp;</a>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>