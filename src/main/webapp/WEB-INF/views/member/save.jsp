<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>회원가입 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/save.css">
<%--  <script src="../../../resources/js/save.js"></script>--%>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false" />
<div class="signup-container">
  <div class="page-header">
    <div class="title">
      <h2>회원가입</h2>
    </div>
  </div>
  <form action="/member/save" method="post" enctype="multipart/form-data">
    <div class="signup-content-wrap">
      <div class="form-floating mb-4">
        <input type="text" name="memberId" id="input-id" class="form-control form-control-sm" placeholder="아이디">
        <label for="input-id">아이디</label>
      </div>
      <div class="form-floating mb-4">
        <input type="password" name="memberPassword" id="input-password" class="form-control form-control-sm" placeholder="비밀번호">
        <label for="input-password">비밀번호</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberName" id="input-name" class="form-control form-control-sm" placeholder="이름">
        <label for="input-name">이름</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberEmail" id="input-email" class="form-control form-control-sm" placeholder="이메일">
        <label for="input-email">이메일</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberMobile" id="input-mobile" class="form-control form-control-sm" placeholder="휴대전화">
        <label for="input-mobile">휴대전화</label>
      </div>
      <div class="form-control mb-4">
        <input type="file" name="memberProfile" id="input-profile">
        <label for="input-profile">프로필 사진 등록</label>
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

  }
</script>
</html>
