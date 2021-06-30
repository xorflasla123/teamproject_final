<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style>

 #login_box * {
	margin: 0;
	padding: 0;
}

ul {
	list-style-type: none;
}

body {
	font-family: "맑은고딕", "돋움";
	font-size: 12px;
	color: 444444;
}

#login_box {

position:absolute; 
top:10%; left:30%;
margin-top:-80px; margin-left:-80px;
 text-align: center; margin:auto; padding-top: 100px;
    width:420px;
    height:450px;
    margin:80px;
    padding:80px;
}

h1 {
font-family:"Arial";
   font-size:35px;
    margin-bottom:10px;

}

#login_box input {
    width:370px;
    height:45px;
    font-size:17px;

}

#id_pass {
	display: inline-block;
	vertical-align: top;
	
}

#id_pass span {
	display: inline-block;
	width: 50px;
}

#pass {
	margin-top: 3px;
}

#login_btn button {

font-size:20px;
    margin-left:5px;
    padding:12px;
    border-radius:5px;
     width:340px;
    height:45px;

}

#btns {

    margin:50px 35px 0 0;
    text-decoration:underline;   

}

#btns li {
	margin-left: 40px;
	display: inline;
	 font-size:17px;
}

#chk_login {

 display: inline-block; 
 margin: 20px 0px 0px;
 margin-bottom: 10px;
  font-size:18px;
text-align: left;

}
#chk_loin {
 font-size:16px;
text-align: center;
padding-top: 20px;
 padding-bottom: 20px;
}

 #login_box li {
	padding-top: 20px;
}


</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />

	<div class="wrap" align="center" style="width: 100%; height: 969px; background-image: url('${contextPath }/resources/image/mainN.jpg');">


<header>
<form action="${contextPath }/member/user_check" method="post">
  <div id="login_box">
    <h1>Hello World</h1><br>
    <ul id="input_button">
      
      <li id="id_pass">
        <ul><li>
            <input type="text" name="id" placeholder=" 아이디를 입력하세요">
          </li> <!-- id -->
          <li id="pass">        
            <input type="password" name="pwd" placeholder=" 비밀번호를 입력하세요">         
          </li> <!-- pass -->
        </ul>
      </li>
    
          <li id=chk_login>   
        <input type="checkbox" style="width:18px; height:18px;"  name="autoLogin" >
         로그인 상태 유지</li> 
    
      <li id="login_btn">
        <input type="submit" value="로그인">
      </li>
    </ul>
 
    <ul id="btns">

      <li><a href="register_form">회원 가입 </a></li>
      <li><a href="${contextPath }/member/forgotId">아이디 찾기 </a></li>
       <li><a href="${contextPath }/member/forgotPwd">비밀번호 찾기 </a></li>

    </ul>
   
  </div> <!-- login_box -->
</form></header>
</div> 

	<!-- 
		<form action="${contextPath }/member/user_check" method="post">
			<table style="font-size: 20pt; color: white; position: absolute; top: 400px; left: 200px;">
				<tr>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="autoLogin">로그인유지</td>
				</tr>
				<tr>
					<td><a href="${contextPath }/member/forgotId">아이디 / 비밀번호 찾기</a></td>
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
	</div>-->

	



</body>
</html>