<%
    String cook = request.getHeader("Cookie");
    int count = 0;

    if(cook != null){
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals("id")){
                count++;
            }
        }
        if(count == 0){
            response.sendRedirect("login.jsp");
        }
    }
    else{
        response.sendRedirect("login.jsp");
    }
%>