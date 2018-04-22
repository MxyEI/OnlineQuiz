<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}

</style>
<title>导入题库</title>
</head>
<body>
<!-- 导航栏 -->
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>题库</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>登录</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>注册</span></a></li>
   <li><a href='${pageContext.request.contextPath}/insertQuestion'><span>导入题库</span></a></li>
   
</ul>
</div>

<c:if test='${not empty sessionScope.user}'>

<div style="position:absolute;top:70px;left:1100px">
 用户： <a href="#" class="button username">${sessionScope.user}</a>
</div>

<div style="position:absolute;top:70px;left:1300px">
<a href='${pageContext.request.contextPath}/logout'>注销</a>
</div>

</c:if>

<div id="wrapper">

	<form name="login-form" class="login-form" action="checkinsertQuestion" method="post">
	
		<div class="header">
		<h1>导入题库 </h1>
		<span></span>
		</div>
	
		<div class="content">
		题库类型：<input name="quiztype" type="text" class="input quiztype" placeholder="题库类型（暂时手写））" /><br>
		题目：<input name="quizquestion" type="text" class="input quizquestion" placeholder="题目" /><br>
		
		1.<input name="answer1" type="text" class="input answer1" placeholder="回答选项1" /><br>
		2.<input name="answer2" type="text" class="input answer2" placeholder="回答选项2" /><br>
		3.<input name="answer3" type="text" class="input answer3" placeholder="回答选项3" /><br>
		4.<input name="answer4" type="text" class="input answer4" placeholder="回答选项4" /><br>
		正确选项：<input name="correct" type="text" class="input correct" placeholder="正确选项（填数字序号））" /><br>
			
		</div>

		<div >		
		<input type="submit" class="button" name="insertQuestion" value="导入" class="insertQuestion" />
		</div>
	
	</form>

</div>
<div class="gradient"></div>


</body>
</html>