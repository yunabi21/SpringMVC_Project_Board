<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: AM 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>글 상세조회 페이지</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/detail.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<div class="signup-container">
  <div class="page-header">
    <div class="title">
      <h2>글 상세조회 페이지</h2>
    </div>
  </div>
  <div class="signup-content-wrap">

    <div class="form-control mb-4 inputItems">
      <label for="input-memberId">작성자</label>
      <input type="text" class="input-memberId form-control col-2 form-control-sm" id="input-memberId" value="${boardWriter.memberId}">
      <div class="date-hits">
        <div class="board-hits-wrap">
          <span class="boardHits">조회수 : </span>
          <li name="boardHits" class="board-hits">${board.boardHits}</li>
        </div>
        <div class="created-date-wrap">
          <span class="boardCreatedDate">작성일자 : </span>
          <li name="boardCreatedDate" class="board-created-date">
            <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}" /></li>
        </div>
      </div>
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
      <a href="#" class="input-file form-control col-2 form-control-sm" id="input-file">${board.boardFileName}</a>
    </div>

  </div>
  <c:choose>
    <c:when test="${sessionScope.loginMemberId eq boardWriter.memberId}">
      <div class="edit-delete-wrap">
        <input type="button" class="btn btn-dark" onclick="listBack()" value="목록">
        <input type="button" class="btn btn-dark" onclick="updateBTN()" value="수정">
        <input type="button" class="btn btn-dark" onclick="deleteBTN()" value="삭제">
      </div>
    </c:when>
    <c:otherwise>
      <div class="edit-delete-wrap">
        <input type="button" class="btn btn-dark" onclick="listBack()" value="목록">
      </div>
    </c:otherwise>
  </c:choose>

  <form action="/comment/save" method="post">
    <div class="comment-input-wrap">
      <input type="text" name="commentContents" class="form-control col-5 form-control-sm" placeholder="댓글 작성">
      <input type="button" class="btn btn-dark comment-btn" onclick="commentSaveBTN()" value="작성">
    </div>
  </form>
  <div class="comment-wrap">
    <div class="form-control mb-4 comment-wrap">
      <table class="table">
        <tr>
          <td name="comment-writer" class="comment-writer">댓글 작성자1</td>
          <td name="comment-contents" class="comment-contents">댓글 내용1</td>
          <td name="commentCreatedDate" class="comment-created-date">2022-04-05 23:34:56</td>
        </tr>
        <tr>
          <td name="comment-writer" class="comment-writer">댓글 작성자2</td>
          <td name="comment-contents" class="comment-contents">댓글 내용2</td>
          <td name="commentCreatedDate" class="comment-created-date">2022-04-05 23:34:56</td>
      </table>
    </div>
  </div>
</div>
</body>
<script>
  const listBack = () => {
    location.href = '/board/list?page=${page}';
  }

  const updateBTN = () => {

  }

  const deleteBTN = () => {

  }

  const commentSaveBTN = () => {

  }
</script>
</html>
