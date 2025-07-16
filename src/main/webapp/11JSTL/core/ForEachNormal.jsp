<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>
<!-- 
<forEach> 태그의 일반 for문 형태
속성]
	begin : 반복문의 시작값
	end : 종료값
	step : 증가치(생략할 경우 1로 고정)
	var : 반복에 사용할 변수
 -->
	<h4>일반 for문 형태의 forEach 태그</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${ i }입니다</p>
	</c:forEach>
	
	<!-- 
	일반 for문에서의 varStatus 속성 : 반복과 관련된 정보를 추상화한
		클래스를 통해 정보를 반환
		count : 실제 반복 홧수를 반환. 1부터 시작
		index : 변수 i의 변화하는 값을 반환
		first : 루프의 처음에 true
		 last : 루프의 마지막에 true
		current : 현재 루프의 변수값을 반환. var속성에 지정된 변수.
	※즉 일반for문에서는 index와 current는 동일한 값이 출력된다.
	 -->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td>
			<td>index : ${ loop.index }</td>
			<td>current : ${ loop.current }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<!-- 변수 j가 1~100까지 1씩 증가 -->
	<c:forEach begin="1" end="100" var="j">
		<!-- if(j%2 !=0)와 동일한 조건식 -->
		<c:if test="${ j mod 2 ne 0 }">
			<!-- sum에 증가하는 j를 누적해서 더해준다. -->
			<c:set var="sum" value="${ sum + j }" />
		</c:if>
	</c:forEach>
	1~100 사이의 정수 중 홀수의 합은? ${ sum }
	
	 <h4>퀴즈01</h4>
	<!-- 
	퀴즈] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${ i eq j }" var="result">
				1&nbsp;			
			</c:if>
			<c:if test="${ not result }">
				0&nbsp;			
			</c:if>
		</c:forEach>
		<br />
	</c:forEach>
</body>
</html>