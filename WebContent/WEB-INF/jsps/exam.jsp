<%@ page language="java" import="com.shzu.m.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试</title>
 <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
</style>

</head><br/>
<body>
<div style="position:absolute;left:50px;top:20px">
<%
  int currentQuestion=((Exam)request.getSession().getAttribute("currentExam")).getCurrentQuestion();
 // System.out.println("Question Number "+currentQuestion+ " retrieved ");
 %>
Current Question ${sessionScope.quest.questionNumber+1} / 10
</div>


 <div style="position:absolute;width:1000px;padding:25px;
  height: 200px;border: 1px solid green ;left:100px;top:60px">
<span>${sessionScope.quest.question}</span><br/><br/>
<form action="exam" method="post" >
 <c:forEach var="choice" items="${sessionScope.quest.questionOptions}" varStatus="counter">
 <input type="radio" name="answer" value="${counter.count}" >${choice}  <br/>
 </c:forEach> <br/> 
 
 <%
   if(currentQuestion > 0)
   {
 %>
 <input type="submit" name="action" value="Previous" />
 <%} %>
 
 <%
   if(currentQuestion < 9)
   {
 %>
 <input type="submit" name="action" value="Next" />
 <%} %>
 <input type="submit" name="action" value="Finish Exam" />

 </form>
</div>


</body>
</html>