<%
    String sessionRank = (String)session.getAttribute("rank");

    if(!sessionRank.equals("관리자")){
        response.sendRedirect("main.jsp");
    }
%>