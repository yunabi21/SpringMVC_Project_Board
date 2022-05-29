<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: PM 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>관리자용 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/index.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="container">
  <table class="table table-striped">
    <thead>
    <tr>
      <th>회원 번호</th>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>이메일</th>
      <th>휴대전화</th>
      <th>회원 삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${memberList}">
      <tr>
        <td>${member.id}</td>
        <td>${member.memberId}</td>
        <td>${member.memberPassword}</td>
        <td>${member.memberName}</td>
        <td>${member.memberEmail}</td>
        <td>${member.memberMobile}</td>
        <td><a href="${pageContext.request.contextPath}/member/delete?id=${member.id}">회원삭제</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
