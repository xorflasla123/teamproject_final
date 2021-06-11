<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	<div class="wrap" align="center" style="width: 100%; height: 969px; background-image: url('${contextPath }/resources/image/mainN.jpg');">
	
		<form action="${contextPath }/member/user_check" method="post">
			<table>
				<tr>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="autoLogin">로그인유지</td>
				</tr>
				<tr>
					<td><a href="">아이디 / 비밀번호 찾기</a></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인">&nbsp;</td>
				</tr>
				<tr>
					<td><input type="button"
						onclick="location.href='${contextPath }/member/register_form'">회원가입</td>
				</tr>

			</table>
		</form>
	</div>

</body>
</html>