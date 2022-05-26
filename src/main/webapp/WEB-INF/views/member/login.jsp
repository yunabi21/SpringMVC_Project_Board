<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>로그인 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/login.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false" />
<div class="signin-container">
  <div class="page-header">
    <div class="title">
      <h2>로그인</h2>
    </div>
  </div>
  <form action="/member/login" method="post">
    <div class="signup-input-wrap">
      <div class="form-floating mb-1">
        <input type="text" class="form-control" id="inputId" name="memberId" placeholder="아이디">
        <label for="inputId">아이디</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="inputPw" name="memberPassword" placeholder="비밀번호">
        <label for="inputPw">비밀번호</label>
      </div>
    </div>
    <div class="find-wrap">
      <li><a href="#" class="find-wrap-a">아이디 찾기</a></li>
      <li class="find-wrap-symbol">|</li>
      <li><a href="#" class="find-wrap-a">비밀번호 찾기</a></li>
      <li class="find-wrap-symbol">|</li>
      <li><a href="/member/save" class="find-wrap-a">회원가입</a></li>
    </div>
    <div class="enter-wrap">
      <input type="submit" id="submitButton" class="btn btn-dark submit-btn" value="로그인">
    </div>
  </form>
  <div class="error-msg-wrap">
    <p id="error-msg"></p>
  </div>
</div>
</body>
</html>
