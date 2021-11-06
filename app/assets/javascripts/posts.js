const check_input = () => {
    let title = $("#title").val();
    let content = $("#content").val();
    if (title || content) {
      document.getElementById("error_title").innerHTML =
        "タイトル　ちゃんと入力しろよ！";
    }
    if (title && content) {
      document.getElementById("btn").disabled = false;
    } else {
      document.getElementById("btn").disabled = true;
    }
  };
