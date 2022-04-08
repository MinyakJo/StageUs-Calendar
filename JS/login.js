function loginEvent(){
    var id = document.getElementsByClassName("loginInput")[0];
    var pw = document.getElementsByClassName("loginInput")[1];
    var secretText = document.getElementsByClassName("secretText");

    secretText[0].style.visibility = "hidden";
    secretText[1].style.visibility = "hidden";

    if(id.value == ""){
        secretText[0].style.visibility = "visible";
    }
    if(pw.value ==""){
        secretText[1].style.visibility = "visible";
    }
    if(id.value != "" && pw.value != ""){
        document.getElementById("mainBox").submit();
    }
}