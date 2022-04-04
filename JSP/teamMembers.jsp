<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>

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
            <h1 id="userName">조민혁 님</h1>
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
            <h2 id="calendarTitleText">조민혁 팀장의 일정</h2>
        </div>
        <div id="calendarHead">
            <button id="backButton" class="headButton" onclick="backButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/backWhite.png">
            </button>
            <h2 id="month">4월</h2>
            <button id="forwardButton" class="headButton" onclick="forwardButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/forwardWhite.png">
            </button>
        </div>
        <div id="calendarBody">
            <div class="calendarDetail">
                <div class="calendarDateTimeBox">
                    <div class="calendarDate">2022.04.01</div>
                    <div class="calendarTime"> / 15:57</div>
                </div>
                <div class="calendarContent">안녕하세요</div>
                <div class="calendarButtonBox">
                </div>
            </div>
        </div>
    </main>
</body>
</html>