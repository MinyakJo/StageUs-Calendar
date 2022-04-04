<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="dbConnect.jsp"%>
<%
    sql = "SELECT userId FROM user";
    query = con.prepareStatement(sql);
    result = query.executeQuery();

    while(result.next()){
        userIdList.add(result.getString("userId"));
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
    <link rel="stylesheet" type="text/css" href="../CSS/join.css">
    <title>중복 체크</title>
</head>
<body>
    <div id="idCheckBox">
        <input class="joinInput" name="idValue" type="text" placeholder="6 ~ 12자 이내 입력" autocomplete="off" minlength="6" maxlength="12" onkeyup="idCheckEvent(0)">
        <input id="idCheckButton" type="button"  value="중복체크" onclick="idDuplicateCheckEvent(0)" disabled=true>
    </div>
    <div class="secretText">아이디를 입력해주세요.</div>

    <script>
        var secretText = document.getElementsByClassName("secretText");

        function easyInnerHTML(index = 0, innerHTML = "", color = "", visibility = ""){
            secretText[index].innerHTML = "";
            secretText[index].innerHTML = innerHTML;
            secretText[index].style.color = color;
            secretText[index].style.visibility = visibility;
        }
        function idCheckEvent(index){
            var idValue = document.getElementsByName("idValue")[0];
            var checkButton = document.getElementById("idCheckButton");
            
            if(idValue.value.length < 6){
                easyInnerHTML(index, "아이디를 6자 이상 입력해 주세요.", "red","visible");
            }
            else{
                easyInnerHTML(index, "아이디 중복 체크를 해주세요.", "red","visible");
                checkButton.disabled = false;
            }
        }

        function idDuplicateCheckEvent(index){
            var inputId = document.getElementsByName("idValue")[0];
            var parent = window.opener.document.getElementsByName("idValue")[0];
            var id = "<%=userIdList%>";

            id = id.substr(1, id.length - 2);
            var idList = id.split(", ");

            for(var i = 0; i < idList.length; i++){
                if(idList[i] == inputId.value){
                        easyInnerHTML(index, "아이디가 중복입니다.", "red", "visible");
                        return;
                    }
            }

            easyInnerHTML(index, "사용 가능한 아이디입니다.", "green", "visible");
            parent.value = inputId.value;
            parent.readOnly = true;
            window.opener.document.getElementsByClassName("secretText")[0].style.visibility = "hidden";
        }
    </script>
</body>
</html>