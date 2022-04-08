<%@ include file="dbConnect.jsp"%>
<%
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");

    String id = "";
    String pw = "";
    String name="";
    String rank="";

    sql = "SELECT * FROM user WHERE userId=? and userPw=?";
    query = con.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    result = query.executeQuery();
    
    while(result.next()){
        id = result.getString("userId");
        pw = result.getString("userPw");
        name = result.getString("userName");
        rank = result.getString("userRank");
    }

    session.setAttribute("id", id);
    session.setAttribute("name", name);
    session.setAttribute("rank", rank);

    Cookie cookie = new Cookie("id", session.getId());
    response.addCookie(cookie);
%>

<%@ include file="dbClose.jsp"%>

<%
    if(id.equals("")){
        response.sendRedirect("loginError.jsp");
    }else{
        response.sendRedirect("main.jsp");
    }
%>