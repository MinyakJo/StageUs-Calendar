<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>
<%@ include file="dbConnect.jsp"%>
<%
    String sessionId = (String)session.getAttribute("id");
    String sessionName = (String)session.getAttribute("name");
    String sessionRank = (String)session.getAttribute("rank");

    if(!sessionRank.equals("관리자")){
        response.sendRedirect("main.jsp");
    }

    sql = "SELECT * FROM deptTable";
    query = con.prepareStatement(sql);
    result = query.executeQuery();

    while(result.next()){
        userDeptList.add(result.getString("userDept"));
    }

    sql = "SELECT * FROM rankTable";
    query = con.prepareStatement(sql);
    result = query.executeQuery();

    while(result.next()){
        userRankList.add(result.getString("userRank"));
    }
%>
<%@ include file="dbClose.jsp"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/public.css">
    <link rel="stylesheet" type="text/css" href="../CSS/main.css">
    <link rel="stylesheet" type="text/css" href="../CSS/admin.css">
    <title>일정 관리(관리자)</title>
</head>
<body>
    <nav id="topBar">
        <div id="userNameBox">
            <h1 id="userName">이름</h1>
            <a id="logoutButton" href="login.jsp">로그아웃</a>
        </div>
        <div id="logoImg">
            <a href="main.jsp"><img src="../IMG/logoWhite.png"></a>
        </div>
        <div id="buttonBox">
            <a id="memberCalendarLink" href="admin.jsp">팀원들 일정보기</a>
        </div>
    </nav>

    <main id="calendarBox">
        <div id="calendarTitle">
            <h1 id="calendarTitleText">일정</h1>
        </div>
        <div id=calendarHeadBox></div>
        <div class="calendarBodyBox"></div>
    </main>
        
    <script>
        window.onload = function(){
            var userName = document.getElementById("userName");

            var userRank = "<%=sessionRank%>";

            var rankList = changeJspList("<%=userRankList%>");
            var deptList = changeJspList("<%=userDeptList%>");

            if(userRank == "관리자"){
                document.getElementById("memberCalendarLink").style.display = "inline-block";
            }

            userName.innerHTML = "<%=sessionName%> 님";

            newCalendarHeadBox(deptList);
            viewDept(deptList);
        }

        function changeJspList(jspList){
            var list = [];
            jspList = jspList.substr(1, jspList.length - 2);
            list = jspList.split(", ");

            return list;
        }

        function viewDept(deptList){
            var calendarHead = document.getElementsByClassName("calendarHead");
            var calendarBodyBox = document.getElementsByClassName("calendarBodyBox");
            var dept = document.getElementsByClassName("department");

            for(var i = 0; i < deptList.length; i++){
                if(dept[i].innerHTML == deptList[i]){
                    calendarHead[i].style.visibility = "visible";
                    calendarHead[i].style.opacity = "1";
                    // calendarBodyBox[i].style.visibility = "visible";
                    // calendarBodyBox[i].style.opacity = "1";
                }
            }
        }

        function newCalendarHeadBox(deptList){
            var calendarHeadBox = document.getElementById("calendarHeadBox");

            for(var i = 0; i < deptList.length; i++){
                var newHead = setDivTag("calendarHead");
                var newBackButton = setButtonTag("back", "headButton", i);
                var newDepartmant = setH2Tag("department");
                var newForwardButton = setButtonTag("forward", "headButton", i);

                calendarHeadBox.appendChild(newHead);
                newHead.appendChild(newBackButton);
                newHead.appendChild(newDepartmant);
                newHead.appendChild(newForwardButton);

                newDepartmant.innerHTML = deptList[i];
            }
        }

        function setDivTag(className){
            var newTag = document.createElement("div");

            newTag.setAttribute("class", className);

            return newTag;
        }

        function setButtonTag(idName, className, index){
            var newTag = document.createElement("button");

            newTag.setAttribute("id", idName + "Button");
            newTag.setAttribute("class", className);
            newTag.setAttribute("onclick", "buttonEvent(" + index + ", '" + idName + "')");
            newTag.appendChild(newImgTag(idName));

            return newTag;
        }

        function newImgTag(idName){
            var newTag = document.createElement("img");

            newTag.setAttribute("src", "../IMG/" + idName + "White.png");

            return newTag
        }

        function setH2Tag(className){
            var newTag = document.createElement("h2");

            newTag.setAttribute("class", className);

            return newTag;
        }

        function buttonEvent(index, direction, length){
            var calendarHead = document.getElementsByClassName("calendarHead");
            var calendarBodyBox = document.getElementsByClassName("calendarBodyBox");
            
            calendarHead[index].style.visibility = "hidden";
            calendarHead[index].style.opacity = "0";
            // calendarBodyBox[index].style.visibility = "hidden";
            // calendarBodyBox[index].style.opacity = "0";

            if(direction == "back"){
                if(index == 0){
                    index = 11;
                }
                else{
                    index--;
                }
            }
            else{
                if(index == 11){
                    index = 0;
                }
                else{
                    index++;
                }
            }
            calendarHead[index].style.visibility = "visible";
            calendarHead[index].style.opacity = "1";
            // calendarBodyBox[index].style.visibility = "visible";
            // calendarBodyBox[index].style.opacity = "1";
        }

        function setTagEvent(list){
            var calendarContent = document.getElementsByClassName("calendarContent");
            var bodyButton = document.getElementsByClassName("bodyButton");

            for(var i = 0; i < list.length; i++){
                calendarContent[i].setAttribute("onclick", "viewMore(" + i.toString() + ")");
            }

            for(var i = 0; i < list.length * 2; i++){
                if(i % 2 == 0){
                    bodyButton[i].setAttribute("onclick", "modifyEvent(" + i.toString() + ")");
                }
                else{
                    bodyButton[i].setAttribute("onclick", "deleteEvent(" + i.toString() + ")");
                }
            }
        }

    </script>
</body>
</html>