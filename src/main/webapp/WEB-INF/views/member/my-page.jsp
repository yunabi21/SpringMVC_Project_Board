<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: PM 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>마이 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/update.css">
  <link rel="stylesheet" href="../../../resources/js/jquery.js">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="signup-container">
  <div class="page-header">
    <div class="title">
      <h2>마이 페이지</h2>
    </div>
  </div>
  <form id="updateForm" name="updateForm" action="${pageContext.request.contextPath}/member/update" method="post" enctype="multipart/form-data">
    <input type="text" name="id" value="${member.id}" hidden>
    <div class="signup-content-wrap">
      <div class="form-floating mb-4">
        <input type="text" name="memberId" id="input-id" class="form-control form-control-sm" value="${member.memberId}" placeholder="아이디" readonly>
        <label for="input-id">아이디</label>
      </div>
      <div class="form-floating mb-4">
        <input type="password" name="memberPassword" id="input-password" class="form-control form-control-sm" placeholder="비밀번호">
        <label for="input-password">비밀번호</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberName" id="input-name" class="form-control form-control-sm" value="${member.memberName}" placeholder="이름" readonly>
        <label for="input-name">이름</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberEmail" id="input-email" class="form-control form-control-sm" value="${member.memberEmail}" placeholder="이메일">
        <label for="input-email">이메일</label>
      </div>
      <div class="form-floating mb-4">
        <input type="text" name="memberMobile" id="input-mobile" class="form-control form-control-sm" value="${member.memberMobile}" placeholder="휴대전화">
        <label for="input-mobile">휴대전화</label>
      </div>
      <div class="form-control mb-4 inputItems">
        <label for="input-profile">프로필 사진 등록</label>
        <input type="file" name="memberProfile" id="input-profile">
        <a target="_blank" href="${pageContext.request.contextPath}/member/img?profileFileName=${member.memberProfileFileName}" class="input-file form-control col-2 form-control-sm">${member.memberProfileFileName}</a>
      </div>
      <div class="enter-wrap">
        <input type="button" id="submit-button" onclick="update()" class="btn btn-dark" value="수정하기">
      </div>
    </div>
  </form>
</div>
</body>
<script>
  const update = () => {
    const password = document.getElementById("input-password").value;
    const passwordDB = '${member.memberPassword}';

    if (password === passwordDB) {
      let updateForm = document.getElementById("updateForm");
      updateForm.submit();
    } else {
      alert('비밀번호가 다릅니다.');
    }
  }
</script>
</html>
