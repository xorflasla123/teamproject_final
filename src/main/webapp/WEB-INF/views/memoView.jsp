<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function slideClick() {
		console.log('실행11')
		$("#first").slideDown("slow");
		$("#modal_wrap").show();
	}

	function slide_hide() {
		$("#first").slideUp("fast");
		$("#modal_wrap").hide();
	}

	function rep() {
		let form = {};
		let arr = $("#frm").serializeArray();
		for (i = 0; i < arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url : "addMemo",
			type : "POST",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(result) {
				alert("성공적으로 저장되었습니다");
				slide_hide();

			},
			error : function() {
				alert("문제 발생 !!!");
			}
		})
	}
</script>

<style type="text/css">
#first {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 30px;
	left: 0;
	right: 0;
	height: 450px;
	width: 350px;
	background-color: rgba(212, 244, 250);
}

#content {
	resize: none;
}
</style>
<body>
	<div class="wrap">
		<c:if test="${loginUser != null}">
			<input type="button" onclick="slideClick()" value="메모">
		</c:if>
		<input type="button" onclick="location.href='${contextPath }/board/boardAllList'" value="리스트로 돌아가기">
	</div>

	<div id="first">
		<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
			<form id="frm">
				<b>메모 페이지</b>
				<hr>

				<b>작성자 :<input type="text" id="id" name="user_id" value="${loginUser} " readonly></b>
				<hr>
				
				<b>제목</b><br>
				<input type="text" id="title" size="30" name="title">
				<hr>
				
				<b>내용</b><br>
				<textarea rows="5" cols="30" id="content" name="content"></textarea>
				<hr>
				
				<button type="button" onclick="rep()">저장</button>
				<button type="button" onclick="slide_hide()">취소</button>
			</form>
		</div>
	</div>
	<c:import url="default/footer.jsp" />
</body>
</html>