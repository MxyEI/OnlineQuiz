<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<title>考试结果</title>
<style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
</style>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>题库</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>登录</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>注册</span></a></li>
   <li><a href='${pageContext.request.contextPath}/insertQuestion'><span>导入题库</span></a></li>
</ul>
</div>
<br><br><br>
<h2 align="center"> ${sessionScope.exam} 考前须知 : </h2>

<div style="position:absolute;left:500px;top:170px">
<ul style="list-style-type:disc">
 <li>测试包含 ${sessionScope.totalNumberOfQuizQuestions} 道选择题</li>
 <li>考试总时长 ${sessionScope.quizDuration} 分钟</li>
 <li>任何时候都能进入考试</li>
 <li>请仔细阅读题目</li>
 <li>交卷前可以改变选项</li>
 <li>祝你好运</li>
</ul>  
<br><br><br>
</div>

<div  style="position:absolute;left:600px;top:350px">
<button onclick="location.href='${pageContext.request.contextPath}/exam'">开始考试！</button>
</div>


</body>
</html>