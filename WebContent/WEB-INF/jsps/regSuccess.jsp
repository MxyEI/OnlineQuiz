<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}


</style>
   <script src="script.js"></script>
   <title>注册结果</title>
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

<div style="position:absolute;left:350px;top:200px">
<h3>恭喜 ${requestScope.newUser} 注册成功 , <a href="${pageContext.request.contextPath}/login">登陆 </a>去考试吧</h3>
</div>


</body>
</html>
