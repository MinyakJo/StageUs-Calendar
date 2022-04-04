<%
    if(result != null){
        result.close();
    }
    if(query != null){
        query.close();
    }
    if(con != null){
        con.close();
    }
%>