<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import "deco.css";
hr{border:2px dashed olive;}
#info{text-align:left; font-size:20px;}
input{background-color:lightsalmon; color:ivory; border-style:none; font-size:30px; border-radius:10px;}
img{width:300px;height:300px;}
label{display:inline-block; border:1px dotted olive; margin:80px; font-size:20px; font-weight:bold; padding:15px 15px 0px 0px;}
footer{margin:50px;}
#go{background-color:lightsalmon; color:ivory; border-style:none; font-size:30px; border-radius:10px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>감자가 감자감자 쇼핑몰</title>
<%
	String username = request.getParameter("username");
	if(username != null && username.equals("admin")){
		session.setAttribute("username",username);
	}

%>
</head>
<body>
<header id=banner>농산물 시장</header>
		<nav id=bar>
			<ul>
				<li><a href="selProduct.jsp">상품 목록</a></li>
				<li><a href="checkOut.jsp">장바구니</a></li>
			</ul>
		</nav>
<div id="info"><%=session.getAttribute("username") %>님 어서오세요!&nbsp;
<a href="logout.jsp"> (로그아웃)</a></div>
<hr />

<div>
<form name="selProductForm" method="POST" action="add.jsp">
	<label><input type="radio" name="product" value="옥수수" checked><img src="img/corn.png"><br>옥수수</label>
	<label><input type="radio" name="product" value="감자"><img src="img/potato.png"><br>감자</label>
	<label><input type="radio" name="product" value="고구마"><img src="img/sweetpotato.png"><br>고구마</label>
	<label><input type="radio" name="product" value="당근"><img src="img/carrot.png"><br>당근</label>
	<label><input type="radio" name="product" value="양배추"><img src="img/cabbage.png"><br>양배추</label>
	<label><input type="radio" name="product" value="토마토"><img src="img/tomato.png"><br>토마토</label><br />
	<input type="submit" value="장바구니에 추가">&nbsp;<span id="go"><a href="checkOut.jsp">장바구니 보기</a></span><br />
</form>
</div>
<footer></footer>
</body>
</html>