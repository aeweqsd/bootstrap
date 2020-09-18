<%@include file= "header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<c:set var="subjectname" value="${subjectname}"/>
<sec:authentication var="user" property="principal" />  
<c:set var="username" value="${user.username}"/>
<c:set var="usernumber" value="${user.usernumber}"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="col-sm-12">
			<c:forEach var="list" items="${list}">
				<div class="col-sm-12" id="qqqqq">
				<div class="col-sm-12"><a href="#"id="showoneboard1" value="${list.idboard}">${list.boardname}</a></div> 
				<span class="glyphicon glyphicon-time"aria-hidden="true"></span>${list.datetime}
				<span class="glyphicon glyphicon-user" aria-hidden="true"> </span>${list.boardwriter} | 
				<span class="glyphicon glyphicon-eye-open"aria-hidden="true"> </span> ${list.hit} | 

				<span class="glyphicon glyphicon-thumbs-up"></span>  ${list.likenum}
				<c:if test="${username eq list.boardwriter}">
				<button type="button" class="btn btn-xs btn-danger">글삭제</button>
				<button type="button" class="btn btn-xs btn-warning">글수정</button>
				</c:if>
				</div>
			</c:forEach>
			</div>		
				<div class="col-sm-12">
						<nav>
							<ul class="pagination">
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
						    </ul>
						</nav>
						<c:out value ="${user}"/>
				    <button type="button"id="makeboard" class="btn btn-primary"data-toggle="modal" data-target="#makingboardmodal" data-whatever="${subjectname}">글 생성</button>
				</div>
			</div>
			<div class="col-sm-2"></div>
	</div>
</div>
<div class="modal fade" id="makingboardmodal" tabindex="-1" role="dialog" aria-labelledby="makingboard" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="makingboard">글 생성</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="subjectname" class="control-label">주제:</label>
						<input type="text" class="form-control" id="subjectname" disabled>
					</div>
					<div class="form-group">
						<label for="boardname" class="control-label">제목:</label>
						<input type="text" class="form-control" id="boardname">
					</div>
					<div class="form-group">
						<label for="content" class="control-label">내용:</label>
						<textarea class="form-control" id="content"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="boardcreatepro" class="btn btn-primary">글 작성</button>
			</div>
		</div>
	
	</div>
</div>
<div class="modal fade" id="showoneboard" tabindex="-1"role="dialog" aria-labelledby="showonboard" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="title">글 보기</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
						<div class="col-md-12" id="boardname"></div>
						<div class= "col-md-4 col-md-offset-8">
						<span class="glyphicon glyphicon-user" aria-hidden="true" id="boardwriter"></span>
						<span class="glyphicon glyphicon-eye-open"aria-hidden="true" id="hit"> </span></div>
						<div class="col-md-12">
						<div id="boardcontent"></div></div>
						</div>
						<div class="col-md-12"></div>
					
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div id="status"></div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 col-md-offset-5">
							<button type="button" class="btn btn-default btn-lg" id="thumbs-up">
								<span class="glyphicon glyphicon-thumbs-up"></span></button>
							<button type="button" class="btn btn-default btn-lg" id="thumbs-down">
								<span class="glyphicon glyphicon-thumbs-down"></span></button>
						</div>
							<div class="col-md-12"></div>
							<div class="col-md-12">댓-글</div>
						</div>
					</div>	
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	
	</div>

</div>
<script>
var user = '<c:out value ="${username}"/>';
var usernumber= '<c:out value ="${usernumber}"/>';
$('#makingboardmodal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text("글 작성 :" +recipient)
	  modal.find('.modal-body #subjectname').val(recipient)
	})
$(document).on('click','#showoneboard1',function(){
	var idboard = $(this).attr('value');
	var modal =$('#showoneboard');
	
	$.ajax('/selectboard',{
		type:'get',
		dataType:'json',
		data:{
			Idboard : idboard,
			usernumber : usernumber
		},
		success:function(board){
			var idboard = board.idboard;
			var boardname = board.boardname;
			var boardcontent = board.boardcontent;
			var hit = board.hit;
			var boardwriter = board.boardwriter;
			var likenum = board.likenum;
			var isthumb = board.isthumb;
			$('#thumbs-up').attr('value',idboard);
			$('#thumbs-down').attr('value',idboard);
			modal.find('.modal-title').text(idboard  + " 글 보기");
			modal.find('.modal-body #boardname').append(boardname);
			modal.find('.modal-body #boardwriter').append(boardwriter);
			modal.find('.modal-body #hit').append(hit);
			modal.find('.modal-body #boardcontent').append(boardcontent);
			if(isthumb){
				$('#thumbs-up').attr('disabled','disabled');
			}else{
				$('#thumbs-down').attr('disabled','disabled');
				}
			$('#showoneboard').modal('show');
		
		},
		error:function(request,status,error){
		}

		});
	
	

	
})	
$(document).on('click','#boardcreatepro',function(){
	var subject = $('#subjectname').val();
	var name = $('#boardname').val();
	var content = $('#content').val();
	if(!name){
		alert("제목을 작성하세요");
		return;
	}
	if(!content){
		alert("내용을 작성하세요");
		return;
	}
	$.ajax('/boardcreating',{
		type:'post',
		dataType: 'html',
		data:{
				boardname : name,
				boardsubject : subject,
				boardcontent :content,
				boardwriter : user
			},
		success:function(html){
			$('#makingboardmodal').modal('hide');
			},
		error:function(request,status,error){
			}

		});

	
})
$(document).on('click','#thumbs-up',function(){
	var Idboard = $(this).attr('value');
	$.ajax('/likecreating',{
		type:'get',
		dataType: 'html',
		data:{
				usernumber : usernumber,
				idboard : Idboard
			},
		success:function(html){
			$('#status').append('<div class="alert alert-success alert-dismissible"role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>좋아요가 완료되었습니다</div>');
			},
		error:function(request,status,error){
			}

		});	
})
$(document).on('click','#thumbs-down',function(){
	var Idboard = $(this).attr('value');
	$.ajax('/likedelete',{
		type:'delete',
		dataType: 'html',
		data:{
				usernumber : usernumber,
				idboard : Idboard
			},
		success:function(html){
			alert("좋아요가 취소되었습니다")	
		},
		error:function(request,status,error){
			}

		});	
})

</script>
	
