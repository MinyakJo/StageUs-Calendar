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

    String userId = "";
    String userName = request.getParameter("contentValue");
    String userRank = request.getParameter("rankValue");
    String userDept = request.getParameter("deptValue");
    
    sql = "SELECT * FROM user WHERE userName=? and userDept=? and userRank=?";
    query = con.prepareStatement(sql);
    query.setString(1, userName);
    query.setString(2, userDept);
    query.setString(3, userRank);

    result = query.executeQuery();

    while(result.next()){
        userId = result.getString("userId");
    }

    String nowTime = dateFormat.format(now);

    sql = "SELECT * FROM calendar WHERE userId=? ORDER BY calendarDate DESC";
    query = con.prepareStatement(sql);
    query.setString(1, userId);

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
    <title></title>
</head>
<body>
    <!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/public.css">
    <link rel="stylesheet" type="text/css" href="../CSS/main.css">
    <title></title>
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
            var calendarTitleText = document.getElementById("calendarTitleText");

            var userRank = "<%=sessionRank%>";
            var nowTime = "<%=nowTime%>";

            var monthNow = getMonthOrDay(nowTime, "month");

            userName.innerHTML = "<%=sessionName%> 님";
            calendarTitleText.innerHTML = "<%=userDept%>  " + "<%=userName%> " + "<%=userRank%>의 일정";

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

                calendarBody.appendChild(newCalendar);

                newCalendar.appendChild(newDetailDiv);
                newCalendar.style.height = "var(--calendar-height)";

                newDetailDiv.appendChild(newDateDiv);
                newDetailDiv.appendChild(newContentDiv);

                newDateDiv.innerHTML = dateList[i];
                
                newContentDiv.innerHTML = contentList[i];
                newContentDiv.style.whiteSpace = "nowrap";
                newContentDiv.style.paddingTop = "15px";
                newContentDiv.style.paddingBottom = "15px";
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