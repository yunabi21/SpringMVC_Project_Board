<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: AM 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>img</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/upload/board/${boardFileName}"
     alt="사진이 안나와요" width="400" height="400">
</body>
</html>
