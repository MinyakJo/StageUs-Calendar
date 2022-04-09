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
        deptList.add(result.getString("userDept"));
    }

    sql = "SELECT * FROM user";
    query = con.prepareStatement(sql);
    result = query.executeQuery();

    while(result.next()){
        userIdList.add(result.getString("userId"));
        userNameList.add(result.getString("userName"));
        userDeptList.add(result.getString("userDept"));
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
            <h1 id="calendarTitleText">부서</h1>
        </div>
        <div id=calendarHeadBox></div>
        <div id="calendarBodyBox"></div>
    </main>
        
    <script>
        window.onload = function(){
            var userName = document.getElementById("userName");

            var userRank = "<%=sessionRank%>";

            var deptList = changeJspList("<%=deptList%>");
            var userIdList = changeJspList("<%=userIdList%>");
            var userNameList = changeJspList("<%=userNameList%>");
            var userDeptList = changeJspList("<%=userDeptList%>");
            var userRankList = changeJspList("<%=userRankList%>");

            if(userRank == "관리자"){
                document.getElementById("memberCalendarLink").style.display = "inline-block";
            }

            userName.innerHTML = "<%=sessionName%> 님";

            newCalendarHead(deptList);
            newCalendarBody(deptList, userIdList, userNameList, userDeptList, userRankList);
            viewDept(deptList);
        }

        function changeJspList(jspList){
            var list = [];
            jspList = jspList.substr(1, jspList.length - 2);
            list = jspList.split(", ");

            return list;
        }

        function viewDept(){
            var calendarHead = document.getElementsByClassName("calendarHead");
            var calendarBody = document.getElementsByClassName("calendarBody");

            calendarHead[0].style.visibility = "visible";
            calendarHead[0].style.opacity = "1";
            calendarBody[0].style.visibility = "visible";
            calendarBody[0].style.opacity = "1";
        }

        function newCalendarHead(deptList){
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

        function setFormTag(className, action, index){
            var newTag = document.createElement("form");

            newTag.setAttribute("class", className);
            newTag.setAttribute("action", action);
            newTag.setAttribute("method", "post");

            return newTag;
        }

        function setInputTag(className, type, value){
            var newTag = document.createElement("input");

            newTag.setAttribute("class", className);
            newTag.setAttribute("type", type);
            newTag.setAttribute("value", value);

            return newTag;
        }

        function buttonEvent(index, direction){
            var calendarHead = document.getElementsByClassName("calendarHead");
            var calendarBody = document.getElementsByClassName("calendarBody");
            
            calendarHead[index].style.visibility = "hidden";
            calendarHead[index].style.opacity = "0";
            calendarBody[index].style.visibility = "hidden";
            calendarBody[index].style.opacity = "0";

            if(direction == "back"){
                if(index == 0){
                    index = calendarHead.length - 1;
                }
                else{
                    index--;
                }
            }
            else{
                if(index == calendarHead.length - 1){
                    index = 0;
                }
                else{
                    index++;
                }
            }
            calendarHead[index].style.visibility = "visible";
            calendarHead[index].style.opacity = "1";
            calendarBody[index].style.visibility = "visible";
            calendarBody[index].style.opacity = "1";
        }

        function newCalendarBody(deptList, userIdList, userNameList, userDeptList, userRankList){
            for(var i = 0; i < deptList.length; i++){
                var viewUserIdList = [];
                var viewUserNameList = [];
                var viewUserRankList = [];

                for(var j = 0; j < userDeptList.length; j++){
                    if(userDeptList[j] == deptList[i]){
                        viewUserIdList.push(userIdList[j]);
                        viewUserNameList.push(userNameList[j]);
                        viewUserRankList.push(userRankList[j]);
                    }
                }
                newContent(viewUserIdList, viewUserNameList, viewUserRankList, deptList[i], i);
            }
            setTagEvent(userIdList);
        }

        function newContent(userIdList, userNameList, userRankList, dept, index){
            var calendarBodyBox = document.getElementById("calendarBodyBox");

            var newCalendarBody = setDivTag("calendarBody");
            calendarBodyBox.appendChild(newCalendarBody);

            for(var i = 0; i < userIdList.length; i++){
                var newCalendar = setDivTag("calendar");
                var newDetailDiv = setFormTag("calendarDetail", "teamMembers.jsp");
                var newRankDeptBoxDiv = setDivTag("calendarRankDeptBox");
                var newRank = setDivTag("calendarRank");
                var newDept = setDivTag("calendarDept");
                var newContentDiv = setDivTag("calendarContent");

                newCalendarBody.appendChild(newCalendar);

                newCalendar.appendChild(newDetailDiv);

                newDetailDiv.appendChild(newRankDeptBoxDiv);
                newRankDeptBoxDiv.appendChild(newRank);
                newRankDeptBoxDiv.appendChild(newDept);
                newRank.innerHTML = userRankList[i];
                newDept.innerHTML = dept;

                newDetailDiv.appendChild(newContentDiv);
                newContentDiv.innerHTML = userNameList[i];
            }
        }

        function setTagEvent(list){
            var calendarDetail = document.getElementsByClassName("calendarDetail");

            for(var i = 0; i < list.length; i++){
                calendarDetail[i].setAttribute("onclick", "viewMore(" + i.toString() + ")");
            }
        }

        function viewMore(index){
            calendarContent = document.getElementsByClassName("calendarContent")[index];
            calendarRank = document.getElementsByClassName("calendarRank")[index];
            calendarDept = document.getElementsByClassName("calendarDept")[index];

            var contentInput = changeDivToInput(calendarContent, "content");
            var rankInput = changeDivToInput(calendarRank, "rank");
            var deptInput = changeDivToInput(calendarDept, "dept");

            calendarContent.appendChild(contentInput);
            calendarRank.appendChild(rankInput);
            calendarDept.appendChild(deptInput);
            
            document.getElementsByClassName("calendarDetail")[index].submit();
        }

        function changeDivToInput(divTag, name){
            var newInput = setInputTag(name, "text", divTag);
            var obj = {};

            newInput.setAttribute("name", name + "Value");

            if(typeof(divTag) == typeof(obj)){
                divTag = divTag.innerHTML;
            }
            newInput.setAttribute("value", divTag);
            newInput.style.display = "none";

            return newInput;
        }

    </script>
</body>
</html>