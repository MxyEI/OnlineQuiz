<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
</style>
<title>查看考试</title>
</head>

<body>
<h1 align="center">查看答案</h1><br>

<c:forEach var="q" items="${requestScope.reviewQuestions}" varStatus="counter">
<br>
${counter.count}. ${q.question}<br/><br/>

<c:forEach var="option" items="${q.questionOptions}" varStatus="counter">
${counter.count}.   ${option}<br/><br/>
</c:forEach>

<font color="green">正确答案是 : ${q.correctOptionIndex+1}</font><br/>
<br>

<c:if test='${q.userSelected == -1}'>
<font color="#1334F1">你没有回答</font><br/>
</c:if>
<c:if test='${q.userSelected != -1}'>
<font color="#1334F1">你的选择是 : ${q.userSelected}</font><br/>
</c:if>
<br/>
<c:if test='${q.userSelected == q.correctOptionIndex+1}'>
<img height="30" width="30" src="${pageContext.request.contextPath}/images/correct.png"/>
</c:if>

<c:if test='${q.userSelected != q.correctOptionIndex+1}'>
<img height="30" width="30" src="${pageContext.request.contextPath}/images/redcross.png"/>
</c:if>
<br/>
<br/>
_____________________________________________________________________________________________________________________________________________________________________<br>
</c:forEach><br/><br/>


<div align="center">
  <a href="${pageContext.request.contextPath}"><img  height="50" width="50" src="${pageContext.request.contextPath}/images/home.jpg"></img></a>
  </div>
</body>
</html>