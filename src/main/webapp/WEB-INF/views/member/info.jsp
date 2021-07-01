<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap { width:1300px; margin: auto;
	margin-top:110px; 

}
#btns {
 width:90px;
    height:50px;
}
#btns button{
align:right;
font-size:18px;
    margin-left:16px;
    padding:12px;
    border-radius:2px;
     width:95px;
    height:45px;
}
td {
font-size:25px;
  width:220px;
    height:45px;
}
th{
width:90px;font-size:20px;
}

</style>
</head>

<body style="background-color: #fff7e6;">

	<div class="wrap">
		<div style="width: 300px; margin: 0 auto;">
		<h1 style="text-align: center;">  개인정보</h1>
			<table style="width: 370px; height: 500px; table-layout: fixed;" border="1">
				<tr>
					<th>아이디</th>
					<td style="text-align: center; " >${info.id } </td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td style="text-align: center;">${info.pwd }</td>
				</tr>
				
				<tr>
					<th>이 름</th>
					<td style="text-align: center;">${info.name }</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td style="text-align: center;">${info.email }</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td style="text-align: center;">${info.num }</td>
				</tr>
				
				<tr>
					<th>주 소</th>
					<td style="text-align: center;">${info.addr }</td>
				</tr>
				
				<c:if test="${loginUser == info.id }">
					<tr>
						<td colspan="2" id="btns">

							<button id="delete"   onclick="location.href='delete?id=${info.id}'">삭제</button>
							<button id="infomodify"  onclick="location.href='modify_form?id=${info.id}'">수정</button>
							<button id="info"  onclick="location.href='/root/index'">돌아가기</button>

						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

</body>
</html>