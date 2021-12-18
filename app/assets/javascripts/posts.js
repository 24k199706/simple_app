function jscheack(){
    const titletext=document.getElementById("text").value;
    const titletext2=document.getElementById("text1").value;
    if (titletext==""){
        alert("タイトルを入力してください");
        return false;
    }else if(titletext2==""){
        alert("投稿内容を入力してください");
    }else{
        return true;
    }
    }