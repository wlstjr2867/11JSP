<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체 매개변수</title>
</head>
<body>
	<%
	// 3가지 인스턴스를 request영역에 저장
	request.setAttribute("personObj", new Person("홍길동", 33));
	request.setAttribute("stringObj", "나는문자열");
	request.setAttribute("integerObj", new Integer(99));
	%>
	<!-- 
	액션태그를 통해 포워드한다. 이때 2개의 정수를 파라미터로 전달한다.
	액션태그는 반드시 시작태그와 종료태그가 있어야한다.
	 -->
	<jsp:forward page="ObjectResult.jsp">
		<jsp:param value="10" name= "firstNum" />
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
	
	<%--
	/*
	위 액션태그를 JSP로 표현하면 다음과 같다. 포워드 하면서 2개의 
	파라미터까지 함께 전달하고 있다.
	*/
	request.getRequestDispatcher("ObjectResult.jsp?firstNum=10&secondNum=20").forward(request, response);
	--%>
</body>
</html>