<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>

<%
request.setCharacterEncoding("utf-8");
    String sessionId = (String)session.getAttribute("id");
    String dateValue = request.getParameter("dateValue");
    String contentValue = request.getParameter("contentValue");
    String originContentValue = request.getParameter("originContentValue");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <%=dateValue%>
    </div>
    <div>
        <%=contentValue%>
    </div>
    <div>
        <%=sessionId%>
    </div>
    <div>
        <%=originContentValue%>
    </div>
</body>
</html>