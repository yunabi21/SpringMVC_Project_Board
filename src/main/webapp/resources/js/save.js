// const idCheck = (check) => {
//     const input_id = document.getElementById("input-id").value;
//     const result_id = document.getElementById("id-result");
//     const exp = /^[a-z\d-_]{5,15}$/;
//
//     if (input_id.match(exp)) {
//         result_id.style.display = "none";
//         result_id.setAttribute("aria-hidden", true);
//         check = true;
//     } else {
//         result_id.innerHTML = "5~15자의 영문 소문자, 숫자와 특수기호(_), (-)만 사용 가능합니다.";
//         result_id.style.color = "#aa3636";
//         result_id.style.display = "block";
//         result_id.setAttribute("aria-hidden", false);
//         check = false;
//     }
//     return check;
// }

const pwCheck = (check) => {
    const input_pw = document.getElementById("input-password").value;
    const result_pw = document.getElementById("pw-result");
    const exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;

    if (!input_pw.match(exp)) {
        result_pw.innerHTML = "8~16자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 사용하세요.";
        result_pw.style.color = "#aa3636";
        result_pw.style.display = "block";
        result_pw.setAttribute("aria-hidden", false);
        check = false;
    } else {
        result_pw.style.display = "none";
        result_pw.setAttribute("aria-hidden", true);
        check = true;
    }
    return check;
}

const pwCheckAgain = (check) => {
    const input_pw = document.getElementById("input-password").value;
    const check_pw = document.getElementById("input-password-again").value;
    const result_check_pw = document.getElementById("pw-check-result");

    if (check_pw === input_pw) {
        if (input_pw === '') {
            result_check_pw.innerHTML = "비밀번호를 입력하세요.";
            result_check_pw.style.color = "#aa3636";
            result_check_pw.style.display = "block";
            result_check_pw.setAttribute("aria-hidden", false);
            check = false;
        } else {
            result_check_pw.innerHTML = "비밀번호가 일치합니다.";
            result_check_pw.style.color = "#36aa36";
            check = true;
        }
    } else {
        result_check_pw.innerHTML = "비밀번호가 일치하지 않습니다.";
        result_check_pw.style.color = "#aa3636";
        result_check_pw.style.display = "block";
        result_check_pw.setAttribute("aria-hidden", false);
        check = false;
    }
    return check;
}

const nameCheck = (check) => {
    const input_name = document.getElementById("input-name").value;
    const result_name = document.getElementById("name-result");
    const exp = /^[a-zA-Z가-힣]{2,20}$/;

    if (!input_name.match(exp)) {
        result_name.innerHTML = "한글과 영문 대 소문자를 사용하세요.";
        result_name.style.color = "#aa3636";
        result_name.style.display = "block";
        result_name.setAttribute("aria-hidden", false);
        check = false;
    } else {
        result_name.style.display = "none";
        result_name.setAttribute("aria-hidden", true);
        check = true;
    }
    return check;
}

const emailCheck = (check) => {
    const input_email = document.getElementById("input-email").value;
    const result_email = document.getElementById("email-result");
    const exp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if (input_email.match(exp)) {
        result_email.style.display = "none";
        result_email.setAttribute("aria-hidden", true);
        check = true;
    } else {
        result_email.innerHTML = "이메일 주소를 다시 확인해주세요.";
        result_email.style.color = "#aa3636";
        result_email.style.display = "block";
        result_email.setAttribute("aria-hidden", false);
        check = false;
    }
    return check;
}

const mobileCheck = (check) => {
    const input_mobile = document.getElementById("input-mobile").value;
    const result_mobile = document.getElementById("mobile-result");
    const exp = /^01[0179][0-9]{7,8}$/;

    if (!input_mobile.match(exp)) {
        result_mobile.innerHTML = "휴대전화번호를 다시 확인해주세요.";
        result_mobile.style.color = "#aa3636";
        result_mobile.style.display = "block";
        result_mobile.setAttribute("aria-hidden", false);
        check = false;
    } else {
        result_mobile.style.display = "none";
        result_mobile.setAttribute("aria-hidden", true);
        check = true;
    }
    return check;
}

// const signup = () => {
//     const input_id = document.getElementById("input-id").value;
//     const result_id = document.getElementById("id-result");
//
//     const input_pw = document.getElementById("input-password").value;
//     const result_pw = document.getElementById("pw-result");
//
//     const check_pw = document.getElementById("input-password-again").value;
//     const result_check_pw = document.getElementById("pw-check-result");
//
//     const input_name = document.getElementById("input-name").value;
//     const result_name = document.getElementById("name-result");
//
//     const input_email = document.getElementById("input-email").value;
//     const result_email = document.getElementById("email-result");
//
//     const input_mobile = document.getElementById("input-mobile").value;
//     const result_mobile = document.getElementById("mobile-result");
//
//     const input_mobile_auth = document.getElementById("input-mobile-auth").value;
//     const result_mobile_auth = document.getElementById("mobile-auth-result");
//
//     let check = true;
//
//     check = idCheck(check);
//     check = pwCheck(check);
//     check = pwCheckAgain(check);
//     check = nameCheck(check);
//     check = emailCheck(check);
//     check = mobileCheck(check);
//
//     if (input_id === '') {
//         result_id.innerHTML = "필수 입력 항목입니다.";
//         result_id.style.color = "#aa3636";
//         check = false;
//     }
//     if (input_pw === '') {
//         result_pw.innerHTML = "필수 입력 항목입니다.";
//         result_pw.style.color = "#aa3636";
//         check = false;
//     }
//     if (check_pw === '') {
//         result_check_pw.innerHTML = "필수 입력 항목입니다.";
//         result_check_pw.style.color = "#aa3636";
//         check = false;
//     }
//     if (input_name === '') {
//         result_name.innerHTML = "필수 입력 항목입니다.";
//         result_name.style.color = "#aa3636";
//         check = false;
//     }
//     if (input_email === '') {
//         result_email.innerHTML = "필수 입력 항목입니다.";
//         result_email.style.color = "#aa3636";
//         check = false;
//     }
//     if (input_mobile === '') {
//         result_mobile.innerHTML = "필수 입력 항목입니다.";
//         result_mobile.style.color = "#aa3636";
//         check = false;
//     }
//
//     if (check) {
//         alert("가입완료");
//     } else {
//         alert("입력란을 다시 확인해주세요.");
//     }
// }