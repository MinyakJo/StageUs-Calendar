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
    <link rel="stylesheet" type="text/css" href="../CSS/admin.css">
    <title>일정 관리(관리자)</title>
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
            <h2 id="calendarTitleText">부서</h2>
        </div>
        <div id="calendarHead">
            <button id="backButton" class="headButton" onclick="backButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/backWhite.png">
            </button>
            <h2 id="month"></h2>
            <button id="forwardButton" class="headButton" onclick="forwardButtonEvent()">
                <!--Back icons created by Roundicons - Flaticon</a>-->
                <img src="../IMG/forwardWhite.png">
            </button>
        </div>
        <div id="calendarBody" onclick="calendarBodyEvent()">
            <div class="calendarDetail">
                <div class="calendarRankDeptBox">
                    <div class="calendarRank"></div>
                    <div class="calendarDept"></div>
                </div>
                <div class="calendarContent"></div>
            </div>
        </div>
    </main>
</body>
</html>