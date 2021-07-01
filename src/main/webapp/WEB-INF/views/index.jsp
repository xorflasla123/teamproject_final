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
		<img src="${contextPath }/resources/image/main5.jpg" width="100%" height="960px">
		<h1 style="font-size: 72pt; color: white; position: absolute; top: 400px; left: 200px;">Hello World</h1>
		<h1 style="font-size: 14pt; color: white; position: absolute; top: 500px; left: 200px;"><br>쉽고 간편한 여행플래너 Hello World와 함께<br>힘들고 지친 일상을 벗어나 세상에 인사하세요.<br>Say Hellow World!!!<br></h1>
	</div>
	
	<div class="main">
	
		<form action="${contextPath }/map/mapView">
			<input type="text" name="HomeSearch" placeholder="여행지를 직접 검색해 보세요." style="width:20%; height: 50px; font-size: 15pt; border-top: 1px; border-right: 1px; border-left: 1px; text-align: center;">
			<input type="submit" value="검색" style="width:70px; height: 50px; font-size: 15pt;">
		</form>
	</div>
	<br>
	<br>
	<br>
	
	<div align="center">
		<table>
			<tr>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=강릉"><img src="${contextPath }/resources/image/gangneung.jpg" name="강릉"></a><br><b style="font-size: 20pt;">GANGNEUNG</b><br>대한민국 강릉</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=경주"><img src="${contextPath }/resources/image/gyeongju.jpg" name="경주"></a><br><b style="font-size: 20pt;">GYEONGJU</b><br>대한민국 경주</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=목포"><img src="${contextPath }/resources/image/mokpo.jpg" name="목포"></a><br><b style="font-size: 20pt;">MOKPO</b><br>대한민국 목포</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=부산"><img src="${contextPath }/resources/image/busan.jpg" name="부산"></a><br><b style="font-size: 20pt;">BUSAN</b><br>대한민국 부산</td>		
			</tr>
			<tr>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=서울"><img src="${contextPath }/resources/image/seoul.jpg" name="서울" width="383px" height="510px"></a><br><b style="font-size: 20pt;">SEOUL</b><br>대한민국 서울</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=속초"><img src="${contextPath }/resources/image/sokcho.jpg" name="속초" width="383px" height="510px"></a><br><b style="font-size: 20pt;">SOKCHO</b><br>대한민국 속초</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=안동"><img src="${contextPath }/resources/image/andong.jpg" name="안동"></a><br><b style="font-size: 20pt;">ANDONG</b><br>대한민국 안동</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=여수"><img src="${contextPath }/resources/image/yeosu.jpg" name="여수" width="383px" height="510px"></a><br><b style="font-size: 20pt;">YEOSU</b><br>대한민국 여수</td>
			</tr>
			<tr>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=인천"><img src="${contextPath }/resources/image/incheon.jpg" name="인천" width="383px" height="510px"></a><br><b style="font-size: 20pt;">INCHEON</b><br>대한민국 인천</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=전주"><img src="${contextPath }/resources/image/jeonju.jpg" name="전주"></a><br><b style="font-size: 20pt;">JEONJU</b><br>대한민국 전주</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=제주"><img src="${contextPath }/resources/image/jeju.jpg" name="제주"></a><br><b style="font-size: 20pt;">JEJU</b><br>대한민국 제주도</td>
				<td style="width: 400px; height: 600px"><a href="${contextPath }/map/mapView?name=춘천"><img src="${contextPath }/resources/image/chuncheon.jpg" name="춘천" width="383px" height="510px"></a><br><b style="font-size: 20pt;">CHUNCHEON</b><br>대한민국 춘천</td>
			</tr>
		</table>
	</div>
	<hr>
	<c:import url="default/footer.jsp" />
	
<script>
	window.onload = function(){
		$('.bar').css('background-color','rgba(0,0,0,0)') && $('.bar').css('color', 'black') 
		&& $('ul li a b').css('color', 'black');
	}
	
	$(window).scroll(function(){
		if($(this).scrollTop() == 0)
			$('.bar').css('background-color','rgba(0,0,0,0)') && $('.bar').css('color', 'black') 
			&& $('ul li a b').css('color', 'black');
		else
			$('.bar').css('background-color','rgba(0,0,0,.6)') && $('.bar').css('color', 'white') 
			&& $('ul li a b').css('color', 'white');
	})
</script>
</body>
</html>