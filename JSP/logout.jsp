<%
    if(session != null){
        session.invalidate();
    }

    String cook = request.getHeader("Cookie");

    if(cook != null){
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals("id")){
                Cookie delCookie = new Cookie("id", "");
                delCookie.setMaxAge(0);
                response.addCookie(delCookie);
            }
        }
    }
%>