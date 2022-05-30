<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>회원가입 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/save.css">
  <script src="../../../resources/js/jquery.js"></script>
<%--  <script src="../../../resources/js/save.js"></script>--%>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="signup-container">
  <div class="page-header">
    <div class="title">
      <h2>회원가입</h2>
    </div>
  </div>
  <form action="/member/save" method="post" enctype="multipart/form-data">
    <div class="signup-content-wrap">
      <div class="form-floating mb-4">
        <input type="text" name="memberId" id="input-id" onblur="duplicateCheck()" class="form-control form-control-sm" placeholder="아이디">
        <label for="input-id">*아이디</label>
        <p id="result-id"></p>
      </div>
      <div class="form-floating mb-4">
        <input type="password" name="memberPassword" id="input-password" onblur="pwCheck()" class="form-control form-control-sm" placeholder="비밀번호">
        <label for="input-password">*비밀번호</label>
        <p id="pw-result"></p>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberName" id="input-name" class="form-control form-control-sm" placeholder="이름">
        <label for="input-name">*이름</label>
        <p id="name-result"></p>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberEmail" id="input-email" onblur="emailCheck()" class="form-control form-control-sm" placeholder="이메일">
        <label for="input-email">*이메일</label>
        <p id="email-result"></p>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberMobile" id="input-mobile" class="form-control form-control-sm" placeholder="휴대전화">
        <label for="input-mobile">*휴대전화</label>
        <p id="mobile-result"></p>
      </div>
      <div class="form-control mb-4">
        <label for="input-profile">프로필 사진 등록</label>
        <input type="file" name="memberProfile" id="input-profile">
      </div>
      <div class="enter-wrap">
        <input type="submit" id="submit-button" class="btn btn-dark" value="가입하기">
      </div>
    </div>
  </form>
</div>
</body>
<script>
  const duplicateCheck = () => {
    const memberId = $("#input-id").val();
    const resultP = document.getElementById("result-id");
    const btn = document.getElementById("submit-button");

    $.ajax({
      url: '/member/duplicate-check',
      type: 'post',
      data: {"memberId" : memberId},
      dataType: 'text',

      success: function (result) {
        console.log(result);

        if (memberId === '') {
          resultP.innerHTML = '아이디를 입력해주세요.';
          resultP.style.color = '#aa3636';
          btn.disabled = 'true';
          return false;
        }

        if (result === 'ok') {
          resultP.innerHTML = '사용 가능한 아이디 입니다.';
          resultP.style.color = '#36aa36';
          btn.removeAttribute('disabled');
        } else {
          resultP.innerHTML = '이미 사용중인 아이디 입니다.';
          resultP.style.color = '#aa3636';
          btn.disabled = 'true';
        }
      },
      err: function () {
        alert("실패");
      }
    });
  }

  const pwCheck = () => {
    const input_pw = document.getElementById("input-password").value;
    const result_pw = document.getElementById("pw-result");
    const btn = document.querySelector("#submit-button");
    const exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;

    if (!input_pw.match(exp)) {
        result_pw.innerHTML = "8~16자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 사용하세요.";
        result_pw.style.color = "#aa3636";
        result_pw.style.display = "block";
        result_pw.setAttribute("aria-hidden", 'false');
        btn.setAttribute('disabled', 'true');
    } else {
        result_pw.style.display = "none";
        result_pw.setAttribute("aria-hidden", 'true');
        btn.removeAttribute('disabled');
    }
  }

  const emailCheck = () => {
      const input_email = document.getElementById("input-email").value;
      const result_email = document.getElementById("email-result");
      const btn = document.getElementById("submit-button");
      const exp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

      if (input_email.match(exp)) {
          result_email.style.display = "none";
          result_email.setAttribute("aria-hidden", 'true');
          btn.removeAttribute('disabled');
      } else {
          result_email.innerHTML = "이메일 주소를 다시 확인해주세요.";
          result_email.style.color = "#aa3636";
          result_email.style.display = "block";
          result_email.setAttribute("aria-hidden", 'false');
          btn.setAttribute('disabled', 'true');
      }
  }
</script>
</html>
