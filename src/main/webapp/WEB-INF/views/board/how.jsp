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
		<b style="color: red;">*이미지 클릭시 원본이미지로 볼 수 있습니다.</b><hr>
		여행지의 사진을 클릭하시면 해당 지역의 지도가 열립니다.<br>
		<img src="${contextPath }/resources/image/how1.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how1-1.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br><br>
		여행지를 직접 검색하실수도 있습니다.<br>
		<img src="${contextPath }/resources/image/how2.png" width="200px" height="150px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how2-2.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br>
		<hr><br>
		지도에서 키워드 검색이 가능합니다.<br>
		<img src="${contextPath }/resources/image/how3-1.png" width="400px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br><br>
		카테고리를 클릭하면 지도상에 표시됩니다.<br>
		<img src="${contextPath }/resources/image/how3-2.png" width="400px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br><br>
		지도 하단에 출발지, 도착지를 입력하여 검색하면 길찾기가 가능합니다.<br>
		<img src="${contextPath }/resources/image/how3-3.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how3-4.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><hr><br>
		지도 하단 메모버튼을 클릭하면 메모장이 열립니다.<br>
		<img src="${contextPath }/resources/image/how4-1.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how4-2.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br><br>
		지도에 표시된 마커를 클릭하고 메모추가를 누르면 해당 주소가 메모장에 추가됩니다.<br>
		<img src="${contextPath }/resources/image/how4-3.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how4-4.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br><br>
		여러개의 메모를 저장할 수 있고, 수정, 삭제 할 수 있습니다.<br>
		<img src="${contextPath }/resources/image/how4-5.PNG" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer">
		<img src="${contextPath }/resources/image/how4-6.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><br>
		<img src="${contextPath }/resources/image/how4-7.png" width="200px" height="200px" onclick="window.open(this.src, 'new', 'width=800, height=600, left=0, top=100');" style="cursor:pointer"><hr>
	</h3>
</div>

</body>

</html>