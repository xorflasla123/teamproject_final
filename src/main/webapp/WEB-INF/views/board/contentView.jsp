<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function checkLike() {
	var boardId = $("#boardId").val();
	var userId = $("#userId").val();
	var form = {boardId:boardId, userId:userId}
	$.ajax({
		url : "checklike",	// url 주소
		type : "post",			// 보내는 방식
		data : JSON.stringify(form),	// 보낼 데이터(form을 json타입으로 변경) 자바스크립트 객체 타입을 json으로 변경
		contentType : "application/json; charset=utf-8",	// 보낼 데이터 타입 지정
		dataType : "json",	// 리턴 type
		success : function(result) {
			console.log(result)
			if(result != 0) {
				$("#likeBtn").val("좋아요 취소")
			}else {
				$("#likeBtn").val("좋아요")
			}
		},
		error : function() {
			alert('문제발생')
		}
	})
}
function like() {
	var boardId = $("#boardId").val();
	var userId = $("#userId").val();
	var form = {boardId:boardId, userId:userId}
	$.ajax({
		url : "like",	// url 주소
		type : "post",			// 보내는 방식
		data : JSON.stringify(form),	// 보낼 데이터(form을 json타입으로 변경) 자바스크립트 객체 타입을 json으로 변경
		contentType : "application/json; charset=utf-8",	// 보낼 데이터 타입 지정
		dataType : "json",	// 리턴 type
		success : function(result) {
			$("#like").text(result)
			var valueBtn = $('#likeBtn').val();
			console.log(valueBtn)
			if(valueBtn == '좋아요') {
				$("#likeBtn").val("좋아요 취소")
			}else {
				$("#likeBtn").val("좋아요")
			}
		},
		error : function() {
			alert('문제발생')
		}
	})
}
</script>
</head>
<body onload="checkLike()">
	<div>
		<input type="hidden" id="boardId" value="${ contentData.boardId }">
		<input type="hidden" id="userId" value="${ contentData.userId }">	<!-- 세션 아이디로 바꾸기 -->
		<table border="1">
			<tr>
				<th>글 번호</th><td>${ contentData.boardId }</td>
				<th>작성자</th><td>${ contentData.userId }</td>
			</tr>
			<tr>
				<th>제 목</th><td>${ contentData.title }</td>
				<th>작성일</th><td>${ contentData.day }</td>
			</tr>
			<tr>
				<th>조회수</th><td>${ contentData.hit }</td>
				<th>좋아요</th><td id="like">${ contentLike }</td>
			</tr>
			<tr>
				<th colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4">${ contentData.content }</td>
			</tr>
			<c:if test="${ contentData.picture != 'nan' }">
				<tr>
					<th colspan="4">
						<img width="200px" height="200px" src="${ contextPath }/board/download?pictureName=${ contentData.picture }">
					</th>
				</tr>
			</c:if>
			
				<tr>
					<td colspan="4">
						<!-- if (세션아이디 == contentData.userId) -->
						<input type="button" onclick="location.href='${ contextPath }/board/modifyform?boardId=${ contentData.boardId }'" value="수정하기">
						<input type="button" onclick="location.href='${ contextPath }/board/delete?boardId=${ contentData.boardId }&pictureName=${ contentData.picture }'" value="삭제하기">
						<!--  -->
					</td>
				</tr>
				
			<tr>
				<td colspan="4" style="align: right;">
					<!-- if (세션 아이디가 있을 때) -->
					<input type="button" onclick="" value="댓글달기">
					<input type="button" onclick="like()" id="likeBtn" value="좋아요">
					<!--  -->
					<input type="button" onclick="location.href='${ contextPath }/board/main'" value="목록으로 이동">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>