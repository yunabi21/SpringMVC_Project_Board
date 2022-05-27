<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <c:choose>
      <c:when test="${sessionScope.loginMemberId eq 'admin'}">
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${pageContext.request.contextPath}/" class="nav-link px-2 link-secondary">메인 화면</a></li>
          <li><a href="/member/save" class="nav-link px-2 link-dark">회원가입</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list" class="nav-link px-2 link-dark">글 목록</a></li>
          <li><a href="${pageContext.request.contextPath}/admin" class="nav-link px-2 link-dark">회원목록</a></li>
        </ul>
      </c:when>
      <c:otherwise>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${pageContext.request.contextPath}/" class="nav-link px-2 link-secondary">메인 화면</a></li>
          <li><a href="/member/save" class="nav-link px-2 link-dark">회원가입</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list" class="nav-link px-2 link-dark">글 목록</a></li>
        </ul>
      </c:otherwise>
    </c:choose>

    <c:choose>
      <c:when test="${sessionScope.loginId eq null}">
        <div class="col-md-3 text-end">
          <button type="button" onclick="loginForm()" class="btn btn-outline-dark me-2">로그인</button>
          <button type="button" onclick="saveForm()" class="btn btn-dark">회원가입</button>
        </div>
      </c:when>
      <c:otherwise>
        <div class="col-md-3 text-end">
          <button type="button" onclick="logout()" class="btn btn-outline-dark me-2">로그아웃</button>
          <button type="button" onclick="myPage()" class="btn btn-dark me-2">마이페이지</button>
        </div>
      </c:otherwise>
    </c:choose>

  </header>
</div>
</body>
<script>
  const loginForm = () => {
    location.href = '/member/login';
  }
  
  const saveForm = () => {
    location.href = '/member/save';
  }

  const logout = () => {
    location.href = '/member/logout';
  }

  const myPage = () => {
    location.href = '/member/my-page?id=${sessionScope.loginId}';
  }
</script>
</html>
