<%@ include file="dbConnect.jsp"%>
<%
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    String nameValue = request.getParameter("nameValue");
    String emailValue = request.getParameter("emailValue");
    String rankValue = request.getParameter("rankValue");
    String deptValue = request.getParameter("deptValue");

    sql = "INSERT INTO user (userId, userPw, userName, userEmail, userRank, userDept) VALUES(?, ?, ?, ?, ?, ?)";
    query = con.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.setString(3, nameValue);
    query.setString(4, emailValue);
    query.setString(5, rankValue);
    query.setString(6, deptValue);

    query.executeUpdate();
    
%>
<%@ include file="dbClose.jsp"%>
<%
    response.sendRedirect("login.jsp");
%>