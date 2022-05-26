const signin = () => {
    const input_id = document.getElementById("floatingInput").value;
    const input_pw = document.getElementById("floatingPassword").value;
    const error_msg = document.getElementById("error-msg");

    if (input_id === '') {
        error_msg.innerHTML = "아이디를 입력해주세요.";
        error_msg.style.display = "block";
        error_msg.style.color = "#aa3636";
        error_msg.setAttribute("aria-hidden", false);
        return false;
    } else {
        error_msg.style.display = "none";
        error_msg.setAttribute("aria-hidden", true);
    }

    if (input_pw === '') {
        error_msg.innerHTML = "비밀번호를 입력해주세요.";
        error_msg.style.display = "block";
        error_msg.style.color = "#aa3636";
        error_msg.setAttribute("aria-hidden", false);
    } else {
        error_msg.style.display = "none";
        error_msg.setAttribute("aria-hidden", true);
    }
}