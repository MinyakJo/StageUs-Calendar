<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="dbConnect.jsp"%>
<%
    String nowTime = dateFormat.format(now);

    sql = "SELECT * FROM rankTable";
    query = con.prepareStatement(sql);

    result = query.executeQuery();

    while(result.next()){
        userRankList.add(result.getString("userRank"));
    }

    sql= "SELECT * FROM deptTable";
    query = con.prepareStatement(sql);

    result = query.executeQuery();

    while(result.next()){
        userDeptList.add(result.getString("userDept"));
    }
%>
<%@ include file="dbClose.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../CSS/public.css">
    <link rel="stylesheet" type="text/css" href="../CSS/join.css">
</head>
<body>
    <div id="logoImg">
        <img src="../IMG/logoBlack.png">
    </div>

    <main>
        <form action="joinProcess.jsp" method="post" id="mainBox">
            <div id="main">
                <div class="joinBox">
                    <div class="joinText">아이디</div>
                    <div id="idCheckBox">
                        <input class="joinInput" name="idValue" type="text" placeholder="6 ~ 12자 이내 입력" autocomplete="off" minlength="5" maxlength="11" onkeyup="idCheckEvent(0)">
                        <input id="idCheckButton" type="button"  value="중복체크" onclick="moveWindowEvent()">
                    </div>
                    <div class="secretText">아이디를 입력해주세요.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">비밀번호</div>
                    <input class="joinInput" name="pwValue" type="password" placeholder="6 ~ 16자 이내 입력" minlength="5" maxlength="15" onkeyup="pwCheckEvent(1)">
                    <div class="secretText">비밀번호를 입력해주세요.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">비밀번호 확인</div>
                    <input class="joinInput" name="pwValueCheck" type="password" placeholder="6 ~ 16자 이내 입력" minlength="5" maxlength="15" onkeyup="pwCheckValueEvent(2)">
                    <div class="secretText">비밀번호가 틀립니다.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">이름</div>
                    <input class="joinInput" name="nameValue" type="text" placeholder="2 ~ 8자 이내 입력" autocomplete="off" minlength="1" maxlength="7" onkeyup="nameCheckEvent(3)">
                    <div class="secretText">이름을 입력해주세요.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">이메일</div>
                    <input class="joinInput" name="emailValue" type="text" placeholder="admin@stageus.com" autocomplete="off" onkeyup="emailCheckEvent(4)">
                    <div class="secretText">이메일을 입력해주세요.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">직급</div>
                    <select class="joinInput" name="rankValue" onchange="selectCheckEvent(5, this.value)">
                        <option value="">직급선택</option>
                    </select>
                    <div class="secretText">직급을 선택해주세요.</div>
                </div>

                <div class="joinBox">
                    <div class="joinText">부서</div>
                    <select class="joinInput" name="deptValue" onchange="selectCheckEvent(6, this.value)">
                        <option value="">부서선택</option>
                    </select>
                    <div class="secretText">부서를 선택해주세요.</div>
                </div>
            </div>
            <input id="joinButton" type="submit" value="가입">
        </form>
    </main>

    <script src="../JS/join.js"></script>
    <script>
        window.onload = function(){
            var rankList = changeJspList("<%=userRankList%>", ", ");
            var deptList = changeJspList("<%=userDeptList%>", ", ");

            makeSelectOption("rank", rankList);
            makeSelectOption("dept", deptList);
        }

        function changeJspList(jspList, splitString){
            var list = [];
            jspList = jspList.substr(1, jspList.length - 2);
            list = jspList.split(splitString);

            return list;
        }

        function makeSelectOption(rankOrdept, list){
            if(rankOrdept == "rank"){
                var rankInput = document.getElementsByName("rankValue")[0];

                for(var i = 0; i < list.length; i++){
                    rankInput.appendChild(setSelectOption(list[i]));
                }
            }
            else{
                var deptInput = document.getElementsByName("deptValue")[0];

                for(var i = 0; i < list.length; i++){
                    deptInput.appendChild(setSelectOption(list[i]));
                }
            }
        }

        function setSelectOption(value){
            var newTag = document.createElement("option");

            newTag.setAttribute("value", value);
            newTag.innerHTML = value;

            return newTag;
        }
    </script>
</body>
</html>