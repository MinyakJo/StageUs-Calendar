
/*
    [0] : id
    [1] : pw
    [2] : pwCheck
    [3] : name
    [4] : email
    [5] : rank
    [6] : dept
*/    
var secretText = document.getElementsByClassName("secretText");

var idCheck = false;
var pwCheck = false;
var nameCheck = false;
var emaileCheck = false;
var rankCheck = false;
var deptCheck = false;


function easyInnerHTML(index = 0, innerHTML = "", color = "", visibility = ""){
    secretText[index].innerHTML = "";
    secretText[index].innerHTML = innerHTML;
    secretText[index].style.color = color;
    secretText[index].style.visibility = visibility;
}

function idCheckEvent(index){
    var idValue = document.getElementsByName("idValue")[0];
    
   if(idValue.value.length < 6){
    easyInnerHTML(index, "아이디를 6자 이상 입력해 주세요.", "red","visible");
   }
   else{
    easyInnerHTML(index, "아이디 중복 체크를 해주세요.", "red","visible");
    idCheck = false;
   }
}

function idDuplicateCheckEvent(index){
    var inputId = document.getElementsByName("idValue")[0];
    var idList = [];
    idList = "<%=userIdList%>";

    for(var id of idList){
        if(id == inputId.value){
            easyInnerHTML(index, "아이디가 중복입니다.", "red", "visible");
            return;
        }
    }

    easyInnerHTML(index, "사용 가능한 아이디입니다.", "green", "visible");
    idCheck = true;
}

function pwCheckEvent(index){
    var pwValue = document.getElementsByName("pwValue")[0];
    
   if(pwValue.value.length < 6){
    easyInnerHTML(index, "비밀번호를 6자 이상 입력해 주세요.", "red","visible");
   }
   else{
    easyInnerHTML(index, "비밀번호를 입력 했습니다.", "green","visible");
   }
}

function pwCheckValueEvent(index){
    var pwValue = document.getElementsByName("pwValue")[0];
    var pwValueCheck = document.getElementsByName("pwValueCheck")[0];

    secretText[index].style.visibility = "visible";

    if(pwValue.value == pwValueCheck.value){
        easyInnerHTML(index, "비밀번호가 동일합니다.", "green", "visible");
        pwCheck = true;
    }
    else{
        easyInnerHTML(index, "비밀번호가 틀립니다.", "red", "visible");
    }
}

function nameCheckEvent(index){
    var nameValue = document.getElementsByName("nameValue")[0];
    var pattern = /^[가-힣]+$/;

    if(!pattern.test(nameValue.value)){
        easyInnerHTML(index, "한글을 입력해 주세요.", "red", "visible");
        nameValue.value = "";
    }
    else{
        easyInnerHTML(index, "이름을 입력 했습니다.", "green","visible");
        nameCheck = true;
    }
}

function emailCheckEvent(index){
    var emailValue = document.getElementsByName("emailValue")[0];
    var pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    if(!pattern.test(emailValue.value)){
        easyInnerHTML(index, "이메일을 제대로 입력해 주세요.", "red", "visible");
    }
    else{
        easyInnerHTML(index, "이메일을 입력 했습니다.", "green", "visible");
        emaileCheck = true;
    }
}

function selectCheckEvent(index, value){
    var select = "";

    if(index == 5){
        select = "직급을"
    }
    else {
        select = "부서를"
    }

    if(value == ""){
        easyInnerHTML(index, select + " 선택해 주세요.", "red", "visible");
    }
    else{
        easyInnerHTML(index, select + "선택 했습니다.", "green", "visible");
    }

}