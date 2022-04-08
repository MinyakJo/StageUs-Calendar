<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="logout.jsp"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/public.css">
    <link rel="stylesheet" type="text/css" href="../CSS/login.css">
    <title>로그인</title>
</head>
<body>
    <main>
        <form id="mainBox" action="loginProcess.jsp" method="post">
            <div id="logoImg">
                <img src="../IMG/logoBlack.png">
            </div>
            <div id="login">
                <div class="loginBox">
                    <div class="loginText">아이디</div>
                    <input class="loginInput" name="idValue" type="text" placeholder="아이디" autocomplete="off" minlength="5" maxlength="11">
                    <div class="secretText">아이디를 입력해주세요.</div>
                </div>

                <div class="loginBox">
                    <div class="loginText">비밀번호</div>
                    <input class="loginInput" name="pwValue" type="password" placeholder="패스워드" autocomplete="off" minlength="5" maxlength="15">
                    <div class="secretText">비밀번호를 입력해주세요.</div>
                </div>

                <input id="loginButton" type="button" value="로그인" onclick="loginEvent()">
            </div>
            <a id="joinLink" href="join.jsp">회원가입</a>
        </form>
    </main>

    <script src="../JS/login.js"></script>
</body>
</html>