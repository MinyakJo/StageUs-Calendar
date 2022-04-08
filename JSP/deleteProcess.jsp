<%@ include file="isLogin.jsp"%>
<%@ include file="dbConnect.jsp"%>
<%
    String sessionId = (String)session.getAttribute("id");
    String dateValue = request.getParameter("dateValue");
    String contentValue = request.getParameter("contentValue");
    
    sql = "DELETE FROM calendar WHERE calendarContent=? and userId=? and calendarDate=?";
    query = con.prepareStatement(sql);
    query.setString(1, contentValue);
    query.setString(2, sessionId);
    query.setString(3, dateValue);

    query.executeUpdate();
%>
<%@ include file="dbClose.jsp"%>
<%
    response.sendRedirect("main.jsp");
%>