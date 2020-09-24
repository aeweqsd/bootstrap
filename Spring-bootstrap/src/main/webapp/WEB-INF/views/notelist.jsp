<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
	<table class="table table-striped">
	<tr>
		<th>선택</th>
		<th>쪽지 보낸이 </th>
		<th>쪽지 받은이</th>
		<th>내용</th>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td><label class="checkbox-inline">
  <input type="checkbox" class="checkbox" id="inlineCheckbox1" value="${list.idnote}">${list.idnote}
</label></td>
		<td>${list.idsender}</td>
		<td>${list.idreceiver}</td>
		<td><c:choose>
		<c:when test="${list.is_read == false}"><b>${list.content}</b></c:when>		
		<c:otherwise>${list.content}</c:otherwise>
		</c:choose>
		</td>
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
<script>
var select = new Set();
$(document).on('change','.checkbox',function(){
	var val = $(this).attr("value");
	if(select.has(val)){
		select.delete(val);
	}else{
	select.add(val);
	}
	if(select.size ==0){
		$('#notedelete').attr('disabled','disabled');
	}else{
		$('#notedelete').removeAttr('disabled');
	}
	console.log(JSON.stringify([...select]));	
})
$(document).on('click','#notedelete',function(){
	var arr1= [];
	var arr = [...select];
	for(let pp of arr){
		var noteinfo = new Object();
		console.log(pp);
		noteinfo.idnote = pp;
		noteinfo.idsender = 0;
		noteinfo.idreceiver = 0;
		noteinfo.content = "";
		noteinfo.is_read  = false;
		arr1.push(noteinfo);
	}
	var arr =JSON.stringify([...arr1]);
	console.log(arr);
	
	$.ajax('/deletenote',{
		type:'post',
		dataType:'html',
		contentType: 'application/json',
		data:JSON.stringify([...arr1]),
		
		success:function(){

		},
		error:function(){

		}


		});

	
})


</script>
