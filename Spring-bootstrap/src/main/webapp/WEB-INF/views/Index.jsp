<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@include file= "header.jsp" %>
	<c:set var="user" value="${user}"/>

	<div class ="container" role="main">
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font color="red">
        <p>Your login attempt was not successful due to <br/>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>
		<div class="row">
			<div class= "col-sm-7"> 
			 	<div class="col-sm-12">
			 		<div class="media">
			 			<h4 class="media-heading">실시간 인기 게시물</h4>
			 			<div class="media-body">
			 				<h4 class="media-heading"><a href="#">글제목</a></h4>
			 				글내용
			 				<h4 class="media-heading">글제목</h4>
			 				글내용
			 				<h4 class="media-heading">글제목</h4>
			 				글내용
			 				<h4 class="media-heading">글제목</h4>
			 				글내용
			 				<h4 class="media-heading">글제목</h4>
			 				글내용
			 				
			 			</div>
			 		
			 		</div>
			 	</div>

			</div>
			<div class="col-sm-5">
			<h4>게시판 목록</h4>
				<div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-primary active">
				    <input type="radio" name="options" value="1" autocomplete="off" checked> 활동회원순
				  </label>
				  <label class="btn btn-primary">
				    <input type="radio" name="options" value="2" autocomplete="off"> 이름순
				  </label>
				  <label class="btn btn-primary">
				    <input type="radio" name="options" value="3" autocomplete="off"> 게시글 작성순
				  </label>
				</div>
				<button type="button" class="btn btn-default btn-lg"id="refresh">
				  <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
				</button>
				<div id ="show_list"></div>
			</div>
		</div>
	</div>

</body>
</html>
<script>

$(document).ready(function(){
$.ajax('/read_subject',{
	type:'get',
	dataType: 'html',
	data:{
		val : 2
	},
	success:function(html){
		$('#show_list').append(html);
		},
	error:function(request,status,error){
		}

	});
})
$(document).on('click','#refresh',function(){
	 var val = $('input[name="options"]:checked').val();
	$.ajax('/read_subject',{
		type:'get',
		dataType:'html',
		data:{
			val : val
			},
		success:function(html){
			$('#show_list').empty();
			$('#show_list').append(html);
			},
		error:function(request,status,error){

		}

		})



	
})
</script>
