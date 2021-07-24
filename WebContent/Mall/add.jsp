<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>감자</title>
 
</head>
<body>
<%
	//로그인 여부 확인
	boolean isMember = false;
	String username = (String)session.getAttribute("username");
	if(username != null){
		isMember = true;
	}
	if(!isMember)
		response.sendRedirect("login.html");
%>

<%
	request.setCharacterEncoding("UTF-8");
	String productName = request.getParameter("product");
//상품개수를 담는 ArrayList 생성
	ArrayList<Integer> clist = (ArrayList<Integer>) session.getAttribute("countList");
	if(clist==null){
		clist = new ArrayList<Integer>();
		for(int i=0;i<=5;i++)
			clist.add(i,0);
		session.setAttribute("countList",clist);
	}
//상품이름이 담긴 ArrayList 생성
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("productList");
	if(list==null){ // 아직 productList가 없을 때는
		list=new ArrayList<String>(); // 새로운 ArrayList 객체 선언
		session.setAttribute("productList",list); //만든 ArrayList를 productList란 이름으로 세션에 저장함.
	}
	if(!list.contains(productName)){//가지고 있지 않으면
		list.add(productName); //list에 상품을 추가 = 장바구니에 상품 추가
	}
	
//[옥수수=0,감자=1,고구마=2,당근=3,양배추=4,토마토=5]라고 가정 하에 clist의 해당 위치에 개수 저장
	int num = 0;
	switch(productName){
	case "옥수수":
		num = clist.get(0);
		clist.set(0,num+1);
		break;
	case "감자":
		num = clist.get(1);
		clist.set(1,num+1);
		break;
	case "고구마":
		num = clist.get(2);
		clist.set(2,num+1);
		break;
	case "당근":
		num = clist.get(3);
		clist.set(3,num+1);
		break;
	case "양배추":
		num = clist.get(4);
		clist.set(4,num+1);
		break;
	case "토마토":
		num = clist.get(5);
		clist.set(5,num+1);
		break;
	}

%>
<script>
	alert("<%=productName%>이(가) 장바구니에 추가 되었습니다.");
	history.go(-1);
</script>
</body>
</html>