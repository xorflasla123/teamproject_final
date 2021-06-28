<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="default/header.jsp" /><hr>
	
	<div>
		<img src="${contextPath }/resources/image/mainN.jpg" width="100%" height="960px">
		<h1 style="font-size: 60pt; color: white; position: absolute; top: 400px; left: 200px;">Hello World</h1>
		<h1 style="font-size: 14pt; color: white; position: absolute; top: 500px; left: 200px;">우하하하하하하하하하하하하<br>우하하하하하하하하하하하하<br>우하하하하하하하하하하하하<br></h1>
	</div>
	
	<div class="main">
	
		<form action="${contextPath }/map/mapView">
			<input type="search" name="HomeSearch" placeholder="검색어 입력"> <input type="submit" value="검색">
		</form>
	</div>
	<br>
	<br>
	<br>
	
	<div align="center">
		<table>
			<tr>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=안동"><img src="${contextPath }/resources/image/andong.jpg" name="안동"></a><br><b style="font-size: 20pt;">ANDONG</b><br>대한민국 안동</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=부산"><img src="${contextPath }/resources/image/busan.jpg" name="부산"></a><br><b style="font-size: 20pt;">BUSAN</b><br>대한민국 부산</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=강릉"><img src="${contextPath }/resources/image/gangneung.jpg" name="강릉"></a><br><b style="font-size: 20pt;">GANGNEUNG</b><br>대한민국 강릉</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=경주"><img src="${contextPath }/resources/image/gyeongju.jpg" name="경주"></a><br><b style="font-size: 20pt;">GYEONGJU</b><br>대한민국 경주</td>
			</tr>
			
			<tr>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=제주"><img src="${contextPath }/resources/image/jeju.jpg" name="제주"></a><br><b style="font-size: 20pt;">JEJU</b><br>대한민국 제주도</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=전주"><img src="${contextPath }/resources/image/jeonju.jpg" name="전주"></a><br><b style="font-size: 20pt;">JEONJU</b><br>대한민국 전주</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=목포"><img src="${contextPath }/resources/image/mokpo.jpg" name="목포"></a><br><b style="font-size: 20pt;">MOKPO</b><br>대한민국 목포</td>
				<td style="width: 400px; height: 600px">선 없앰</td>
			</tr>
			
			<tr>
				<td style="width: 400px; height: 600px">지 역</td>
				<td style="width: 400px; height: 600px">사 진</td>
				<td style="width: 400px; height: 600px">들어감</td>
				<td style="width: 400px; height: 600px">선 없앰</td>
			</tr>
			
		</table>
		
	</div>
	<hr>
	<c:import url="default/footer.jsp" />
	
	

</body>
</html>