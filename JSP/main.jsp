<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>
<%@ include file="dbConnect.jsp"%>
<%
    String sessionId = (String)session.getAttribute("id");
    String sessionName = (String)session.getAttribute("name");
    String sessionRank = (String)session.getAttribute("rank");

    sql = "SELECT * FROM calendar WHERE userId=?";
    query = con.prepareStatement(sql);
    query.setString(1, sessionId);
    result = query.executeQuery();

    while(result.next()){
        calendarDateList.add(dateFormat.format(result.getTimestamp("calendarDate")));
        calendarContentList.add(result.getString("calendarContent"));
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
    <title>일정 관리</title>
</head>
<body>
    <nav id="topBar">
        <div id="userNameBox">
            <h1 id="userName">이름</h1>
            <a id="logoutButton" href="login.jsp">로그아웃</a>
        </div>
        <div id="logoImg">
            <img src="../IMG/logoWhite.png">
        </div>
        <div id="buttonBox">
            <a id="memberCalendarLink" href="admin.jsp">팀원들 일정보기</a>
            <input id="addCalendarButton" type="button" value="일정추가" onclick="addCalendarEvent()">
        </div>
    </nav>

    <main id="calendarBox">
        <div id="calendarTitle">
            <h2 id="calendarTitleText">일정</h2>
        </div>
        <div id="calendarHead">
            <button id="backButton" class="headButton" onclick="backButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/backWhite.png">
            </button>
            <h2 class="calendarMonth">월</h2>
            <button id="forwardButton" class="headButton" onclick="forwardButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/forwardWhite.png">
            </button>
        </div>
    <!--
        <div id="calendarBody">
                <div class="calendarDetail">
                    <div class="calendarDate"></div>
                    <div class="calendarContent"></div>
                    <div class="calendarButtonBox">
                        <input class="bodyButton" type="button" value="수정" onclick="modifyEvent()">
                        <input class="bodyButton" type="button" value="삭제" onclick="deleteEvent()">
                    </div>
                </div> 
        </div>
    -->
    </main>
    <script>
        window.onload = function(){
            var userName = document.getElementById("userName");
            var calendarMonth = document.getElementsByClassName("calendarMonth");
            var calendarBox = document.getElementById("calendarBox");

            var userRank = "<%=sessionRank%>";
            var date = "<%=calendarDateList%>";
            var content = "<%=calendarContentList%>";

            var monthList = changeJspList(date, ".");
            var dateList = changeJspList(date, ", ");
            var contentList = changeJspList(content, ", ");

            if(userRank == "관리자"){
                document.getElementById("memberCalendarLink").style.display = "block";
            }

            userName.innerHTML = "<%=sessionName%> 님";

            calendarMonth[0].innerHTML = monthList[1] + "월";

            for(var i = 0; i < contentList.length; i++){
                var newBody = setDivTag("calendarBody");
                var newDetailDiv = setDivTag("calendarDetail");
                var newDateDiv = setDivTag("calendarDate");
                var newContentDiv = setDivTag("calendarContent");
                var newButtonBoxDiv = setDivTag("calendarButtonBox");
                var newModifyInput = setInputTag("bodyButton", "button", "수정", "modifyEvent("+i.toString()+")");
                var newDeleteInput = setInputTag("bodyButton", "button", "삭제", "deleteEvent("+i.toString()+")");

                calendarBox.appendChild(newBody);

                newBody.appendChild(newDetailDiv);

                newDetailDiv.appendChild(newDateDiv);
                newDetailDiv.appendChild(newContentDiv);
                newDetailDiv.appendChild(newButtonBoxDiv);

                console.log(dateList[i]);
                newDateDiv.innerHTML = dateList[i];
                
                console.log(contentList[i]);
                newContentDiv.innerHTML = contentList[i];

                newButtonBoxDiv.appendChild(newModifyInput);
                newButtonBoxDiv.appendChild(newDeleteInput);
            }
        }

        function changeJspList(jspList, splitString){
            var list = [];
            jspList = jspList.substr(1, jspList.length - 2);
            list = jspList.split(splitString);

            return list;
        }

        function setDivTag(className){
            var newTag = document.createElement("div");

            newTag.setAttribute("class", className);

            return newTag;
        }

        function setInputTag(className, type, value, onclick){
            var newTag = document.createElement("div");

            newTag.setAttribute("class", className);
            newTag.setAttribute("type", type);
            newTag.setAttribute("value", value);
            newTag.setAttribute("onclick", onclick);

            return newTag;
        }
    </script>
</body>
</html>