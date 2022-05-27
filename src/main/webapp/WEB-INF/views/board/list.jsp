<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: PM 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <jsp:include page="../layout/header.jsp" />
  <title>글 목록</title>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/index.css">
</head>
<body>
<div class="container">
  <table class="table table-striped">
    <thead>
    <tr>
      <th>글 번호</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
    </thead>
    <tbody>
      <c:forEach var="board" items="${boardList}">
        <tr>
          <td>${board.id}</td>
          <td><a href="${pageContext.request.contextPath}/board/detail?id=${board.id}&boardWriter=${board.boardWriter}">${board.boardTitle}</a></td>
          <td>${board.boardContents}</td>
          <td>${board.boardWriter}</td>
          <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}" /></td>
          <td>${board.boardHits}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<c:choose>
  <c:when test="${sessionScope.loginId==null}">
    <div class="container">
      <div class="col-md-3 align-content-end">

      </div>
    </div>
  </c:when>
  <c:otherwise>
    <div class="container">
      <div class="col-md-3 align-content-end">
        <button type="button" onclick="boardSaveForm()" class="btn btn-outline-dark me-2 mb-4">글 작성</button>
      </div>
    </div>
  </c:otherwise>
</c:choose>

<div class="container">
  <ul class="pagination justify-content-center">
    <c:choose>
      <c:when test="${paging.page<=1}">
        <li class="page-item disabled">
          <a class="page-link"><</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item">
          <a class="page-link" href="${pageContext.request.contextPath}/board/list?page=${paging.page-1}"><</a>
        </li>
      </c:otherwise>
    </c:choose>

    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
      <c:choose>
        <c:when test="${paging.page eq i}">
          <li class="page-item active">
            <a class="page-link">${i}</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/board/list?page=${i}">${i}</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <c:choose>
      <c:when test="${paging.page>=paging.endPage}">
        <li class="page-item disabled">
          <a class="page-link">></a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item">
          <a class="page-link" href="${pageContext.request.contextPath}/board/list?id=${paging.page+1}">></a>
        </li>
      </c:otherwise>
    </c:choose>
  </ul>
</div>
</body>
<script>
  const boardSaveForm = () => {
    location.href = '/board/save';
  }
</script>
</html>
