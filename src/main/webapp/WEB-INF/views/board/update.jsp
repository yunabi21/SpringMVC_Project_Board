<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: PM 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>글 수정 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/save-board.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="signup-container">
  <div class="page-header">
    <div class="title">
      <h2>글 작성 페이지</h2>
    </div>
  </div>

  <div class="signup-content-wrap">
    <form action="/board/update" method="post" enctype="multipart/form-data">
      <input type="text" name="id" value="${board.id}" hidden>
      <div class="form-control mb-4 inputItems">
        <label for="input-memberId">작성자</label>
        <input type="text" name="boardWriter" class="input-memberId form-control col-2 form-control-sm" id="input-memberId" value="${board.boardWriter}" readonly>
      </div>

      <div class="form-control mb-4 inputItems">
        <label for="input-title">제목</label>
        <input type="text" name="boardTitle" value="${board.boardTitle}" class="input-title form-control col-4 form-control-sm" id="input-title">
      </div>

      <div class="form-control mb-4 inputItems">
        <label for="input-contents">내용</label>
        <textarea name="boardContents" class="input-contents form-control col-4 form-control-sm" id="input-contents">${board.boardContents}</textarea>
      </div>

      <div class="form-control mb-4 inputItems">
        <label for="input-file">파일 첨부</label>
        <input type="file" name="boardFile" class="input-file form-control col-2 form-control-sm" id="input-file">
        <a target="_blank" href="${pageContext.request.contextPath}/board/img?boardFileName=${board.boardFileName}" class="input-file form-control col-2 form-control-sm">${board.boardFileName}</a>
      </div>

      <div class="enter-wrap">
        <button type="submit" id="submit-button" class="btn btn-dark">수정하기</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
