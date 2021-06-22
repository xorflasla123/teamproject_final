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
function alertLogin() {
	alert('로그인 먼저 하세요.')
}
function move(total,goodRate) {
	console.log('move 실행')
    var elem = document.getElementById("myBar");
    var pro = document.getElementById("myProgress");
    var width = 1;
    var id = setInterval(frame, 10);
    pro.style.background = "gray";
	elem.style.background = "gray";
    elem.style.width = 0;
    console.log("frame-total : "+total)
    function frame() {
    	if(total != 0) {
   			pro.style.background = "red";
       		elem.style.background = "green";
       		if(width >= goodRate) {
       			clearInterval(id);
       		}else {
       			width++;
          	        elem.style.width = width + "%";
       		}
    	}
	}
}
function boardCheck() {
	var boardId = $("#boardId").val();
	var userId = $("#userId").val();
	var form = {boardId:boardId, userId:userId}
	$.ajax({
		url : "boardcheck",	// url 주소
		type : "post",			// 보내는 방식
		data : JSON.stringify(form),	// 보낼 데이터(form을 json타입으로 변경) 자바스크립트 객체 타입을 json으로 변경
		contentType : "application/json; charset=utf-8",	// 보낼 데이터 타입 지정
		dataType : "json",	// 리턴 type
		success : function(result) {
			if(result.like != 0) {
				$("#likeBtn").val("좋아요 취소")
			}else {
				$("#likeBtn").val("좋아요")
			}
			var total = result.total;
			console.log("토탈 : "+total);
			if(total != 0) {
				var good = result.good;
				var bad = total - good;
				var goodRate = (good/total)*100;
				var badRate = 100 - goodRate;
				$("#good").text(goodRate + "%")
				$("#bad").text(badRate + "%")
			}else {
				var goodRate = 0;
				$("#good").text(0 + "%")
				$("#bad").text(0 + "%")
			}
			move(total,goodRate);
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
function good() {
	var boardId = $("#boardId").val();
	var userId = $("#userId").val();
	var form = {boardId:boardId, userId:userId}
	$.ajax({
		url : "good",	// url 주소
		type : "post",			// 보내는 방식
		data : JSON.stringify(form),	// 보낼 데이터(form을 json타입으로 변경) 자바스크립트 객체 타입을 json으로 변경
		contentType : "application/json; charset=utf-8",	// 보낼 데이터 타입 지정
		dataType : "json",	// 리턴 type
		success : function(result) {
			console.log('good성공')
			var total = result.total;
			if(total != 0) {
				var good = result.good;
				var bad = total - good;
				var goodRate = (good/total)*100;
				var badRate = 100 - goodRate;
				$("#good").text(goodRate + "%")
				$("#bad").text(badRate + "%")
			}else {
				var goodRate = 0;
				$("#good").text(0 + "%")
				$("#bad").text(0 + "%")
			}
			move(total,goodRate);
		},
		error : function() {
			alert('문제발생')
		}
	})
}
function bad() {
	var boardId = $("#boardId").val();
	var userId = $("#userId").val();
	var form = {boardId:boardId, userId:userId}
	$.ajax({
		url : "bad",	// url 주소
		type : "post",			// 보내는 방식
		data : JSON.stringify(form),	// 보낼 데이터(form을 json타입으로 변경) 자바스크립트 객체 타입을 json으로 변경
		contentType : "application/json; charset=utf-8",	// 보낼 데이터 타입 지정
		dataType : "json",	// 리턴 type
		success : function(result) {
			console.log('bad성공')
			var total = result.total;
			if(total != 0) {
				var bad = result.bad;
				var good = total - bad;
				var badRate = (bad/total)*100;
				var goodRate = 100 - badRate;
				$("#good").text(goodRate + "%")
				$("#bad").text(badRate + "%")
			}else {
				var goodRate = 0;
				$("#good").text(0 + "%")
				$("#bad").text(0 + "%")
			}
			move(total,goodRate);
		},
		error : function() {
			alert('문제발생')
		}
	})
}
</script>
<style type="text/css">
	.reco { display: flex; }
	#myProgress {
	  width: 300px;
	  background-color: grey;
	}
	
	#myBar {
	  width: 0%;
	  height: 30px;
	  background-color: green;
	}
</style>
</head>
<body onload="boardCheck()">
	<div>
		<input type="hidden" id="boardId" value="${ contentData.boardId }">
		<input type="hidden" id="userId" value="${ loginUser }">
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
			<c:if test="${ loginUser == contentData.userId }">
				<tr>
					<td colspan="4">
						<input type="button" onclick="location.href='${ contextPath }/board/modifyform?boardId=${ contentData.boardId }'" value="수정하기">
						<input type="button" onclick="location.href='${ contextPath }/board/delete?boardId=${ contentData.boardId }&pictureName=${ contentData.picture }'" value="삭제하기">
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="4" style="align: right;">
					<c:if test="${ loginUser != null }">
						<input type="button" onclick="" value="댓글달기">
						<input type="button" onclick="like()" id="likeBtn" value="좋아요">
					</c:if>
					<input type="button" onclick="location.href='${ contextPath }/board/main'" value="목록으로 이동">
				</td>
			</tr>
		</table>
		<div class="reco">
		<c:choose>
			<c:when test="${ loginUser != null }">
				<input type="button" onclick="good()" value="추천">
			</c:when>
			<c:otherwise>
				<input type="button" onclick="alertLogin()" value="추천">
			</c:otherwise>
		</c:choose>
		<label id="good">0</label>&nbsp;
		<div id="myProgress">
 			<div id="myBar"></div>
		</div>
		&nbsp;<label id="bad">0</label>
		<c:choose>
			<c:when test="${ loginUser != null }">
				<input type="button" onclick="bad()" value="비추천">
			</c:when>
			<c:otherwise>
				<input type="button" onclick="alertLogin()" value="비추천">
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</body>
</html>