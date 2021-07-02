<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Hello World 이용방법</title>
</head>
<body style="background-color: rgba(204, 255, 255, .6);">
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<div style="width: 450px;">
	<h1>Hello World 이용방법</h1><hr>
	<br>
	<h3>
		여행지의 사진을 클릭하시면 해당 지역의 지도가 열립니다.<br>
		<img src="${contextPath }/resources/image/how1.png" width="200px" height="200px"><img src="${contextPath }/resources/image/how1-1.PNG" width="200px" height="200px"><br><br>
		여행지를 직접 검색하실수도 있습니다.<br>
		<img src="${contextPath }/resources/image/how2.png" width="200px" height="150px"><img src="${contextPath }/resources/image/how2-2.PNG" width="200px" height="200px"><br>
		<img alt="" src=""><hr><br>
		지도에서 키워드 검색이 가능합니다.<br>
		<img alt="" src=""><br>
		카테고리를 클릭하면 지도상에 표시됩니다.<br>
		<img alt="" src=""><br>
		지도 하단에 출발지, 도착지를 입력하여 검색하면 길찾기가 가능합니다.<br>
		<img alt="" src=""><hr><br>
		지도 하단 메모버튼을 클릭하면 메모장이 열립니다.<br>
		<img alt="" src=""><br>
		지도에 표시된 마커를 클릭하고 메모추가를 누르면 해당 주소가 메모장에 추가됩니다.<br>
		<img alt="" src=""><br>
		여러개의 메모를 저장할 수 있고, 수정, 삭제 할 수 있습니다.<br>
		<img alt="" src=""><hr>
	</h3>
	
	
	
</div>

</body>
</html>