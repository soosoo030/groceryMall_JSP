<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증감</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<Integer> clist = (ArrayList<Integer>) session.getAttribute("countList");
	String action = request.getParameter("action");
	String sel = request.getParameter("sel");
	int i=0, n=0;
	//selitem에 해당하는 인덱스 값 찾고, 개수 값 가져오기
	//[옥수수=0,감자=1,고구마=2,당근=3,양배추=4,토마토=5]라고 가정 하에 clist의 해당 위치에 개수 저장
	switch(sel){
	case "옥수수":
		i = 0;
		n = clist.get(0);
		break;
	case "감자":
		i = 1;
		n = clist.get(1);
		break;
	case "고구마":
		i = 2;
		n = clist.get(2);
		break;
	case "당근":
		i = 3;
		n = clist.get(3);
		break;
	case "양배추":
		i = 4;
		n = clist.get(4);
		break;
	case "토마토":
		i = 5;
		n = clist.get(5);
		break;
	}
	if(action.equals("up")){//증가하는 경우
		clist.set(i, n+1);
	}
	if(action.equals("down")){//감소하는 경우
		if(n>1)
			clist.set(i,n-1);
		else{
%>
<script>
alert("더이상 감소할 수 없습니다.");
</script>
<% 
		}
	}
	response.sendRedirect("checkOut.jsp");
%>
</body>
</html>