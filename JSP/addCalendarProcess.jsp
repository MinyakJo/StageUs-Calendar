<%@ include file="isLogin.jsp"%>
<%@ include file="dbConnect.jsp"%>
<%
    String sessionId = (String)session.getAttribute("id");
    String dateValue = request.getParameter("dateValue");
    String timeValue = request.getParameter("timeValue");
    String textValue = request.getParameter("textValue");

    dateValue = dateValue + " " + timeValue + ":00";

    sql = "INSERT INTO calendar (userId, calendarDate, calendarContent) VALUES(?, ?, ?)";
    query = con.prepareStatement(sql);
    query.setString(1, sessionId);
    query.setString(2, dateValue);
    query.setString(3, textValue);

    query.executeUpdate();
    
%>
<%@ include file="dbClose.jsp"%>
<%
    response.sendRedirect("main.jsp");
%>