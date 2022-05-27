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
  <script src="../../../resources/js/jquery.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
      <input type="text" class="input-memberId form-control col-2 form-control-sm" id="input-memberId" value="${boardWriter.memberId}" readonly>
      <div class="date-hits">
        <div class="board-hits-wrap">
          <span class="boardHits">조회수 : </span>
          <li name="boardHits" class="board-hits" readonly="true">${board.boardHits}</li>
        </div>
        <div class="created-date-wrap">
          <span class="boardCreatedDate">작성일자 : </span>
          <li name="boardCreatedDate" class="board-created-date" readonly="true">
            <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}" /></li>
        </div>
      </div>
    </div>

    <div class="form-control mb-4 inputItems">
      <label for="input-title">제목</label>
      <input type="text" name="boardTitle" value="${board.boardTitle}" class="input-title form-control col-4 form-control-sm" id="input-title" readonly>
    </div>

    <div class="form-control mb-4 inputItems">
      <label for="input-contents">내용</label>
      <textarea name="boardContents" class="input-contents form-control col-4 form-control-sm" id="input-contents" readonly>${board.boardContents}</textarea>
    </div>

    <div class="form-control mb-4 inputItems">
      <label for="input-file">파일 첨부</label>
      <a target="_blank" href="${pageContext.request.contextPath}/board/img?boardFileName=${board.boardFileName}" class="input-file form-control col-2 form-control-sm" id="input-file" readonly>${board.boardFileName}</a>
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


    <div class="comment-input-wrap">
      <input type="text" id="commentWriter" name="commentWriter" value="${sessionScope.loginMemberId}" hidden>
      <input type="text" id="commentContents" name="commentContents" class="form-control col-5 form-control-sm" placeholder="댓글 작성">
      <input type="button" class="btn btn-dark comment-btn" onclick="commentSaveBTN()" value="작성">
    </div>

  <div id="comment-list" class="comment-wrap">
    <div class="form-control mb-4 comment-wrap">
      <table class="table">

        <c:forEach var="comment" items="${commentList}">
          <tr>
            <td name="comment-writer" class="comment-writer">${comment.commentWriter}</td>
            <td name="comment-contents" class="comment-contents">${comment.commentContents}</td>
            <td name="comment-created-date" class="comment-created-date">
              <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}" />
            </td>
          </tr>
        </c:forEach>

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
    location.href = '/board/update?id=${board.id}';
  }

  const deleteBTN = () => {
    location.href = '/board/delete?id=${board.id}';
  }

  const commentSaveBTN = () => {
    const commentWriter = document.getElementById("commentWriter").value;
    const commentContents = document.getElementById("commentContents").value;
    const boardId = '${board.id}';

    $.ajax({
      url: '/comment/save',
      type: 'post',
      data: {"commentWriter" : commentWriter,
              "commentContents" : commentContents,
              "boardId" : boardId},
      dataType: 'json',
      success: function (result) {
        console.log(result);
        let output = "<div class='form-control mb-4 comment-wrap'>";
        output += "<table class='table'>";
        for (let i in result) {
          output += "<tr>";
          output += "<input type=text name='id' value='" + result[i].id + "' hidden>";
          output += "<td class='comment-writer'>" + result[i].commentWriter + "</td>";
          output += "<td class='comment-contents'>" + result[i].commentContents + "</td>";
          output += "<td class='comment-created-date'>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
          output += "</tr>";
        }
        output += "</table>";
        output += "</div>";

        document.getElementById('comment-list').innerHTML = output;
        document.getElementById('commentWriter').value = '';
        document.getElementById('commentContents').value = '';
      },
      err: function () {
        alert("에러");
      }
    });
  }
</script>
</html>
