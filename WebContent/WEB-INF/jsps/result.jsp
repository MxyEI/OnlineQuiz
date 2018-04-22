<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}

</style>
<title>结果</title>
</head>
<body>

<div style="position:absolute;left:500px;top:70px">
<h3 align="center">考试结果</h3>
<table border=1>
        <tr>
            <td class="head">
                考试类型 :
            </td>
            <td>
                <span id="lblSubject">${sessionScope.exam}</span></td>
        </tr>
        <tr>
            <td class="head">
                开始时间 :
            </td>
            <td >
                <span id="lblStime">${sessionScope.started}</span></td>
        </tr>
        
              
                <tr>
            <td class="head">
               题目总数量 :
            </td>
            <td>
                <span id="lblNquestions">${sessionScope.totalNumberOfQuizQuestions}</span></td>
        </tr>
        
                <tr>
            <td class="head">
                正确答案数 :
            </td>
            <td>
                <span id="lblNcans">${requestScope.result}</span></td>
        </tr>
        
    </table>

<c:if test="${requestScope.result >= 5}">
   <h3 align="center">合格</h3>
</c:if>
<c:if test="${requestScope.result < 5}">
   <h3 align="center">不合格</h3>
</c:if>
<h3 align="center"><a href='${pageContext.request.contextPath}/exam/review'>查看答案</a></h3><br>
<h3 align="center"><a href='${pageContext.request.contextPath}'>开始另一门考试</a></h3><br>
<h3 align="center"><a href='${pageContext.request.contextPath}'>回到主页</a></h3>
</div>

</body>
</html>