<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>감자 삭제</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//장바구니에서 삭제할 상품들
	String[] delitem = request.getParameterValues("selitem");
	//장바구니
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
	ArrayList<Integer> clist = (ArrayList<Integer>) session.getAttribute("countList");
	//장바구니에서 삭제할 상품들 조회후 삭제
	if(delitem != null){
		for(String item : delitem){
			//clist에서 갖고 있는 개수 0으로 초기화해주기
			//[옥수수=0,감자=1,고구마=2,당근=3,양배추=4,토마토=5]라고 가정 하에 clist의 해당 위치의 개수 0으로 초기화해주기
			switch(item){
			case "옥수수":
				clist.set(0,0);
				break;
			case "감자":
				clist.set(1,0);
				break;
			case "고구마":
				clist.set(2,0);
				break;
			case "당근":
				clist.set(3,0);
				break;
			case "양배추":
				clist.set(4,0);
				break;
			case "토마토":
				clist.set(5,0);
				break;
			}
			list.remove(item);	//list에서 데이터 삭제
		}
	}
	
	response.sendRedirect("checkOut.jsp");
%>


</body>
</html>