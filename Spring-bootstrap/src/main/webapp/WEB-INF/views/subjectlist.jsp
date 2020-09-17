<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ include file="link.jsp" %>
<body>
	<table class="table table-striped">
	<tr>
		<th>게시판 이름 </th>
		<th>게시글 수</th>
		<th>이용인원</th>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.subjectname}</td>
		<td>${list.idsubject}</td>
		<td></td>
	
	</tr>
	</c:forEach>
	
	</table>
<div class="center-block">
<nav><ul class="pagination">
<li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </ul></nav>
</div>



</body>