<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

	<%="Hello JSP Expression" %>	
	<br>
	
	<!-- c:out JSP Expression gibi calisir, value degerini browserda gosterir. -->	
	<c:out value="Hello JSTL !" />		
	<br>
	
	<%
		request.setAttribute("name","hasan");
	%>
	
	<%= request.getAttribute("name") %>
	<br>
	
	<!-- value attribute alaninda expression language kullanabiliriz ! -->
	<c:out value="${name}"/>
	<c:out value="DENEME"/>
	
	<br>
	
	<!-- default attribute'u eger value null'sa yani ilgili attribute bean vs bulunamadiysa calisir. -->
	<c:out value="${thisIsNone}" default="i am default" />
	<br>
	
	<!-- default attribute alanini kullanmak yerine body alaninda da yazabiliriz. -->
	<c:out value="${thisIsNone}" >i am default</c:out>	
	<br>
	
	 	 
	<%="<b> Bold </b> is bold tag" %> 	
	<br> 
	
	<c:out value="<b>Bold </b> is bold tag"/>	
	<br>
	
	<!--  escapeXml varsayilan olarak true dur. -->
	<c:out value="<b> Bold</b> is bold tag" escapeXml="false"/>
	
	
	<c:set var="myattribute" scope="request" value="request scope attribute"></c:set><!-- cset var: ile yeni bir attr ekleriz -->
	<c:set var="myattribute" scope="page" value="page scope attribute"></c:set>
	<c:set var="myattribute" scope="session" value="session scope attribute"></c:set>
	<c:set var="myattribute" scope="application" value="application scope attribute"></c:set>

	<c:out value="${myattribute}"></c:out>
	<br>
	<c:out value="${pageScope.myattribute}"></c:out>
	<br>
	<c:out value="${requestScope.myattribute}"></c:out>
	<br>
	<c:out value="${sessionScope.myattribute}"></c:out>
	<br>
	<c:out value="${applicationScope.myattribute}"></c:out>

	
	<!-- scope belirtilmediginde tum scope alanlarindan ilgili attribute'leri siler. -->
	<c:remove var="myattribute"/>
	
	<p>myattribute is removed</p>
	
	<c:out value="${myattribute}"></c:out>
	<br>
	<c:out value="${pageScope.myattribute}"></c:out>
	<br>
	<c:out value="${requestScope.myattribute}"></c:out>
	<br>
	<c:out value="${sessionScope.myattribute}"></c:out>
	<br>
	<c:out value="${applicationScope.myattribute}"></c:out>
	
	<%
		Map<String,String> myMap = new HashMap<String,String>();
		request.setAttribute("myMapAttribute", myMap);
		request.setAttribute("deneme","DENEME");
	%>

	<c:set var="deneme" scope="request" value="DENEME YENİ"/>	
	<c:out value="${deneme}"></c:out>
	
	<c:set target="${myMapAttribute}" property="key1" value="value1" /><!-- cset target ile var olan attr'a deger atarız -->
	<c:set target="${myMapAttribute}" property="key2">value2</c:set>
	<c:out value="${myMapAttribute['key2']} "/>

	
	<c:set var="result" scope="request" value="70"/>
	<c:if test="${result > 50}">
   		<p>You pass exam ! : <c:out value="${result}"/><p>
	</c:if>
</body>
</html>