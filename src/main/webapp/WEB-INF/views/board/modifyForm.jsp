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
	<div>
		<form action="${ contextPath }/board/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="boardId" value="${ contentData.boardId }">
			<input type="hidden" name="originPictureName" value="${ contentData.picture }">
			<b>제목</b>
			<input type="text" name="title" value="${ contentData.title }"><br>
			<b>내용</b>
			<textarea rows="20" cols="50" name="content">${ contentData.content }</textarea><br>
			<input type="file" name="pictureName" onchange="readURL(this)"/><br>
			<c:choose>
				<c:when test="${ contentData.picture != 'nan' }">
					<img width="100" height="100" id="preview" src="${ contextPath }/board/download?pictureName=${ contentData.picture }"/><br>
				</c:when>
				<c:otherwise>
					<img id="preview" alt="선택된 이미지가 없습니다." src="#" width="100" height="100"/><br>
				</c:otherwise>
			</c:choose>
			<input type="submit" value="수정">
			<input type="button" value="돌아가기" onclick="history.back()">
		</form>
	</div>
</body>
</html>