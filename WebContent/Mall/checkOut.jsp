<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>감자 장바구니</title>
<style>
@import "deco.css";
#list li{list-style-type:none; padding:10px; text-align:justify;}
#list {display:inline-block; background-color:lightyellow; padding:50px 50px;}
h2{text-align:left;}

input{background-color:lightsalmon; color:ivory; border-style:none; font-size:17px; border-radius:10px;}
button{background-color:salmon;color:ivory; border-style:none; font-size:20px; border-radius:10px;}
</style>
</head>
<body>
<header id=banner>농산물 시장</header>
		<nav id=bar>
			<ul>
				<li><a href="selProduct.jsp">상품 목록</a></li>
				<li><a href="checkOut.jsp">장바구니</a></li>
			</ul>
		</nav>
<h2>장바구니</h2>
<hr />
	<%=session.getAttribute("username") %>님의 장바구니 목록<br />
<hr />
<form method="GET">
<ul id=list>
<%
	//로그인 여부 확인
	boolean isMember = false;
	String username = (String)session.getAttribute("username");
	if(username != null){
		isMember = true;
	}
	if(!isMember)
		response.sendRedirect("login.html");
	
	
	ArrayList<Integer> clist = (ArrayList<Integer>) session.getAttribute("countList");
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
	if(list==null){
		out.println("선택한 상품이 없습니다.");
	}
	else{
		for(String item : list){
			//[옥수수=0,감자=1,고구마=2,당근=3,양배추=4,토마토=5]라고 가정 하에 clist의 해당 위치의 개수 얻어옴
			int num = 0;
			switch(item){
			case "옥수수":
				num = clist.get(0);
				break;
			case "감자":
				num = clist.get(1);
				break;
			case "고구마":
				num = clist.get(2);
				break;
			case "당근":
				num = clist.get(3);
				break;
			case "양배추":
				num = clist.get(4);
				break;
			case "토마토":
				num = clist.get(5);
				break;
			}
		
%>
<li><input type="checkbox" name="selitem" value="<%=item%>"><%=item%> <%=num %>개
<input type="button" name="action" value="up" onclick="javascript:location.href='qty.jsp?sel=<%=item %>&action=up'" />
<input type="button" name="action" value="down" onclick="javascript:location.href='qty.jsp?sel=<%=item %>&action=down'" />
</li>
<% 		
		}
	}
%>
</ul>
<br>
<button type="submit" formaction="del.jsp" >삭제</button>
</form>
<a href="selProduct.jsp">상품 목록으로 돌아가기</a>
</body>
</html>