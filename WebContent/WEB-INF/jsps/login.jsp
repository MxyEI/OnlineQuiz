<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
    <title>
        登录
    </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
.user-icon {
	top:130px; /* Positioning fix for slide-in, got lazy to think up of simpler method. */
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/user-icon.png') no-repeat center;	
}

.pass-icon {
	top:180px;
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/pass-icon.png') no-repeat center;
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

<div style="position:absolute;left:500px;top:75px">
如果你没有账户，请点击这里 <a href='${pageContext.request.contextPath}/register'>注册</a>
<br/>
<h3 align="center">${errorMessage}</h3>
</div>
<div id="wrapper">

	<form name="login-form" class="login-form" action="checkLogin" method="post">
	
		<div class="header">
		<h1>登录 </h1>
		<span></span>
		</div>
	
		<div class="content">
		<input name="username" type="text" class="input username" placeholder="用户名" />
		<div class="user-icon"></div>
		<input name="password" type="password" class="input password" placeholder="密码" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		<input type="submit" name="submit" value="登录" class="button" />
		
		</div>
	
	</form>

</div>
<div class="gradient"></div>


</body>
</html>
