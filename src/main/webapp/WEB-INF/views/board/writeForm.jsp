<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]
		console.log(file)
		if(file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file);		// 읽고
			reader.onload = function (e) {	// 로드한 값을 표현한다.
				$('#preview').attr('src', e.target.result);
			}
		}
	}
</script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" /><hr>
	<div class="main">
	<form action="${contextPath}/board/writesave" enctype="multipart/form-data" method="post">
		<b>작성자</b>
		<input type="text" name="user_id" placeholder="작성자"><br>
		<b>제목</b>
		<input type="text" name="title" placeholder="제목"><br>
		<b>내용</b>
		<textarea rows="20" cols="50" name="content"></textarea><br>
		<b>이미지 첨부</b>
		<input type="file" name="board_picture" onchange="readURL(this)"/><br>
		<img id="preview" alt="선택된 이미지가 없습니다." src="#" width="100" height="100"/><br>
		<input type="submit" value="글쓰기">
		<input type="button" value="목록" onclick="location.href='${contextPath}/board/main'">
	</form>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>