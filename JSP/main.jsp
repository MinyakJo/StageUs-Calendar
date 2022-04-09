<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>
<%@ include file="dbConnect.jsp"%>
<%
    String sessionId = (String)session.getAttribute("id");
    String sessionName = (String)session.getAttribute("name");
    String sessionRank = (String)session.getAttribute("rank");
    
    String nowTime = dateFormat.format(now);

    sql = "SELECT * FROM calendar WHERE userId=? ORDER BY calendarDate DESC";
    query = con.prepareStatement(sql);
    query.setString(1, sessionId);
    result = query.executeQuery();

    while(result.next()){
        calendarDateList.add(result.getString("calendarDate"));
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
            <a href="main.jsp"><img src="../IMG/logoWhite.png"></a>
        </div>
        <div id="buttonBox">
            <a id="memberCalendarLink" href="admin.jsp">팀원들 일정보기</a>
            <a id="addCalendarButton" href="addCalendar.jsp">일정 추가</a>
        </div>
    </nav>

    <main id="calendarBox">
        <div id="calendarTitle">
            <h1 id="calendarTitleText">일정</h1>
        </div>
        <div id="calendarHeadBox">
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(0, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">01월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(0, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(1, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">02월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(1, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(2, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">03월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(2, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(3, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">04월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(3, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(4, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">05월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(4, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(5, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">06월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(5, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(6, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">07월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(6, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(7, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">08월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(7, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(8, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">09월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(8, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(9, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">10월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(9, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(10, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">11월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(10, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
            <div class="calendarHead">
                <button id="backButton" class="headButton" onclick="buttonEvent(11, 'back')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/backWhite.png">
                </button>
                <h2 class="calendarMonth">12월</h2>
                <button id="forwardButton" class="headButton" onclick="buttonEvent(11, 'forward')">
                    <!--Back icons created by Roundicons - Flaticon</a>-->
                    <img src="../IMG/forwardWhite.png">
                </button>
            </div>
        </div>

        <div id="calendarBodyBox">
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
            <div class="calendarBody"></div>
        </div>


    </main>
    <script>
        window.onload = function(){
            var userName = document.getElementById("userName");

            var userRank = "<%=sessionRank%>";
            var nowTime = "<%=nowTime%>";

            var monthNow = getMonthOrDay(nowTime, "month");

            if(userRank == "관리자"){
                document.getElementById("memberCalendarLink").style.display = "inline-block";
            }

            userName.innerHTML = "<%=sessionName%> 님";

            viewMonth(monthNow);
            newCalendarBox();
        }

        function changeJspList(jspList, splitString){
            var list = [];
            jspList = jspList.substr(1, jspList.length - 2);
            list = jspList.split(splitString);

            return list;
        }

        function getMonthOrDay(dateList, monthOrDay){
            var date;

            if(typeof(dateList) == typeof([])){
                for(var i = 0; i < dateList.length; i++){
                    date = dateList[i].split("-");
                }
            }
            else{
                date = dateList.split("-");
            }
            if(monthOrDay == "month"){
                return date[1];
            }
            else{
                return date[2].substr(0,2);
            }
        }

        function viewMonth(monthNow){
            var calendarHead = document.getElementsByClassName("calendarHead");
            var calendarMonth = document.getElementsByClassName("calendarMonth");
            var calendarBody = document.getElementsByClassName("calendarBody");

            for(var i = 0; i < calendarMonth.length; i++){
                if(monthNow == calendarMonth[i].innerHTML.substr(0, 2)){
                    calendarHead[i].style.visibility = "visible";
                    calendarHead[i].style.opacity = "1";
                    calendarBody[i].style.visibility = "visible";
                    calendarBody[i].style.opacity = "1";
                }
            }
        }

        function newCalendarBox(){
            var calendarMonth = document.getElementsByClassName("calendarMonth");

            var content = "<%=calendarContentList%>";
            var date = "<%=calendarDateList%>";

            var contentList = changeJspList(content, ", ");
            var dateList = changeJspList(date, ", ");

            for(var i = 0; i < 12; i++){
                var viewContentList = [];
                var viewDateList = [];

                for(var j = 0; j < dateList.length; j++){
                    var monthNow = getMonthOrDay(dateList[j], "month");

                    if(calendarMonth[i].innerHTML.substr(0, 2) == monthNow){
                        viewContentList.push(contentList[j]);
                        viewDateList.push(dateList[j]);
                    }
                }
                newContent(viewContentList, viewDateList, i);
            }
            setTagEvent(dateList);
        }

        function newContent(contentList, dateList, index){
            var calendarBody = document.getElementsByClassName("calendarBody")[index];

            for(var i = 0; i < contentList.length; i++){
                var newCalendar = setDivTag("calendar");
                var newDetailDiv = setFormTag("calendarDetail", "editProcess.jsp");
                var newDateDiv = setDivTag("calendarDate");
                var newContentDiv = setDivTag("calendarContent");
                var newButtonBoxDiv = setDivTag("calendarButtonBox");
                var newModifyButon = setInputTag("bodyButton", "button", "수정");
                var newDeleteButton = setInputTag("bodyButton", "button", "삭제");

                calendarBody.appendChild(newCalendar);

                newCalendar.appendChild(newDetailDiv);
                newCalendar.style.height = "var(--calendar-height)";

                newDetailDiv.appendChild(newDateDiv);
                newDetailDiv.appendChild(newContentDiv);
                newDetailDiv.appendChild(newButtonBoxDiv);

                newDateDiv.innerHTML = dateList[i];
                
                newContentDiv.innerHTML = contentList[i];
                newContentDiv.style.whiteSpace = "nowrap";
                newContentDiv.style.paddingTop = "15px";
                newContentDiv.style.paddingBottom = "15px";

                newButtonBoxDiv.appendChild(newModifyButon);
                newButtonBoxDiv.appendChild(newDeleteButton);
            }
        }

        function setFormTag(className, action){
            var newTag = document.createElement("form");

            newTag.setAttribute("class", className);
            newTag.setAttribute("action", action);
            newTag.setAttribute("method", "post");

            return newTag;
        }

        function setDivTag(className){
            var newTag = document.createElement("div");

            newTag.setAttribute("class", className);

            return newTag;
        }

        function setInputTag(className, type, value){
            var newTag = document.createElement("input");

            newTag.setAttribute("class", className);
            newTag.setAttribute("type", type);
            newTag.setAttribute("value", value);

            return newTag;
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

        function viewMore(index){
            calendar = document.getElementsByClassName("calendar")[index];
            calendarContent = document.getElementsByClassName("calendarContent")[index];

            if(calendar.style.height != "var(--calendar-grown-height)"){
                calendar.style.height = "var(--calendar-grown-height)";
                calendarContent.style.whiteSpace = "pre-line";
                calendarContent.style.paddingTop = "25px";
                calendarContent.style.paddingBottom = "25px";
            }
            else{
                calendar.style.height = "var(--calendar-height)";
                calendarContent.style.whiteSpace = "nowrap";
                calendarContent.style.paddingTop = "15px";
                calendarContent.style.paddingBottom = "15px";
            }
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
            calendarBody[index].style.visibility = "visible";
            calendarBody[index].style.opacity = "1";
        }

        function modifyEvent(index){
            var calendarDate = document.getElementsByClassName("calendarDate");
            var calendarContent = document.getElementsByClassName("calendarContent");
            
            var contentIndex = index / 2;
            var content = calendarContent[contentIndex];
            var date = calendarDate[contentIndex];
            var contentValue = content.innerHTML;

            if(contentValue.substr(1,5) == "input"){
                var modifyText = document.getElementsByClassName("modifyText")[0].value;
                
                content.removeChild(content.firstChild);
                content.innerHTML = modifyText;
                viewMore(contentIndex);

                var dateInput = changeDivToInput(date, "date");
                var contentInput = changeDivToInput(content, "content");

                content.appendChild(contentInput);
                date.appendChild(dateInput);
                
                document.getElementsByClassName("calendarDetail")[contentIndex].submit();
            }
            else{
                content.innerHTML = "";
                var newText = setInputTag("modifyText", "text", contentValue);

                content.appendChild(newText);
            }
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

        function deleteEvent(index){
            var calendarDate = document.getElementsByClassName("calendarDate");
            var calendarContent = document.getElementsByClassName("calendarContent");

            var contentIndex = Math.floor(index / 2);
            var content = calendarContent[contentIndex];
            var date = calendarDate[contentIndex];

            var detail = document.getElementsByClassName("calendarDetail")[contentIndex];

            var dateInput = changeDivToInput(date, "date");
            var contentInput = changeDivToInput(content, "content");

            content.appendChild(contentInput);
            date.appendChild(dateInput);

            detail.action = "deleteProcess.jsp";
            detail.submit();
        }
    </script>
</body>
</html>