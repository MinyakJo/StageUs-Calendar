<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/public.css">
    <link rel="stylesheet" type="text/css" href="../CSS/addCalendar.css">
    <title>일정 추가</title>
</head>
<body>
    <main id="title">
        <h1 id="titleText">일정 작성</h1>
    </main>
    <form id="box" action="addCalendarProcess.jsp" method="post">
        <div class="boxes">
            <input id="date" type="date" name="dateValue">
        </div>
        <div class="boxes">
            <input id="time" type="time" name="timeValue">
        </div>
        <div class="boxes">
            <p id="textTite">내용</p>
            <p id="textCount">0</p>
            <p>/100</p>
            <textarea id="text" name="textValue" maxlength="100" onkeyup="inputMax()"></textarea>
        </div>
        <div class="boxes">
            <input id="submit" type="submit" value="작성">
        </div>
    </form>

    <script>
        function inputMax(){
            text = document.getElementById("text");
            textCount = document.getElementById("textCount");

            if(text.length != 0){
                textCount.innerHTML = "";
                textCount.innerHTML = text.value.length;
            }
        }
    </script>
</body>
</html>