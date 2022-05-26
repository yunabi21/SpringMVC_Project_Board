<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>index.jsp</title>
  <link href="../../resources/css/bootstrap.min.css">
</head>
<body>
  <button class="btn btn-primary" onclick="saveForm()">회원가입</button>
  <button class="btn btn-primary" onclick="loginForm()">로그인</button>
  <button class="btn btn-secondary" onclick="boardList()">글 목록</button>
</body>
<script>
  const saveForm = () => {
    location.href = '/member/save';
  }

  const loginForm = () => {
    location.href = '/member/login';
  }

  const boardList = () => {
    location.href = '/board/findAll';
  }
</script>
</html>
