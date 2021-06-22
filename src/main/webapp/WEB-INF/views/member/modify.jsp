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

	<div class="wrap">
		<div style="width: 300px; margin: 0 auto;">
		<form id="modi" action="modify" method="post">
			<table style="width: 300px; height: 500px;">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${info.id}" readonly> </td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pwd" value="${info.pwd}" > </td>
				</tr>
				
				<tr>
					<th>이 름</th>
					<td><input type="text" name="name" value="${info.name}" readonly > </td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${info.email }" ></td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="num" value="${info.num }" ></td>
				</tr>
				
				<tr>
					<th>주 소</th>
					<td><input type="text" name="addr" value="${info.addr }" ></td>
				</tr>
				
				
					<tr>
						<td >
						 <button type="submit">저장</button>
						
							
							
						</td>
					</tr>
				
			</table>
			</form>
		</div>
	</div>

</body>
</html>