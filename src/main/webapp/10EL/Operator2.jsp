<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//page영역에 속성 저장
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

//empty연산자 사용을 위한 변수. 빈문자열, 요소가 없는 배열 등을 저장
pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 연산자</title></head>
<body>
	<!-- 
	null이거나 빈문자열이거나, 길이가 0인 컬렉션 혹은 배열일때
	empty연산자는 true를 반환한다. 즉 인스턴스가 비었는지 확인한다.
	 -->
    <h3>empty 연산자</h3>   
    empty nullStr : ${ empty nullStr } <br />
    empty emptyStr : ${ empty emptyStr } <br />
    empty lengthZero : ${ empty lengthZero } <br />
    empty sizeZero : ${ empty sizeZero }
    
    <!-- 
    EL내부에 Java와 동일한 형태로 삼항연산자를 기술할 수 있다.
     -->
    <h3>삼항 연산자</h3>
    num1 gt num2 ? "참" : "거짓" => 
    	${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
    
	
	<!-- 
	EL에서는 null을 0으로 판단한다. 따라서 아래의 결과는 10이 나오게 된다.
	단, null과 연산하는 부분을 이클립스는 에러로 표시한다.
	하지만 실행에 있어서는 전혀 문제가 없다.
	 -->
	 
	<!--
	//실행에 있어서는 문제될게 없으니 확인하고싶으면 주석풀어서 확인
    <h3>null 연산</h3>
    null + 10 : ${ null + 10 } <br />
    nullStr + 10 : ${ nullStr + 10 } <br />
    param.noVar > 10 : ${ param.noVar > 10 }
	  -->    
  
</body>
</html>
