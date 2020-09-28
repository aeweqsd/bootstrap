<%@include file= "header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<c:set var="subjectname" value="${subjectname}"/>
<c:set var="maxpage" value="${maxpage}"/>
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
				<button type="button" id ="boarddelete" value ="${list.idboard}"class="btn btn-xs btn-danger">글삭제</button>
				<button type="button" id ="boardmodified" value ="${list.idboard}"class="btn btn-xs btn-warning">글수정</button>
				</c:if>
				</div>
			</c:forEach>
			</div>		
				<div class="col-sm-12">
					<form id="search-box" >
						<input type="hidden" id="eee" value="board">
							<div class="col-sm-2">
								<select class="form-control" id="q">
								<option>아이디</option>
								<option>제목</option>
								<option>내용</option>
								</select>								
							</div>
							<div class="col-sm-8">
								<input type="text" id="w" class="form-control " placeholder="">
							</div>
							<div class="col-sm-2">
								<button type="button" value="${subjectname}" id="search" class="btn btn-default">검색</button>
							</div>
					</form>
						<nav>
							<ul class="pagination">
								<li>
								      <a href="#" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
										  <c:forEach var ="i" begin ="1" end="${maxpage}">
										  <li><a href="/selectsubjectshow?subjectname=${subjectname}&currentpage=${i}"><c:out value="${i}"/></a>
										  </c:forEach>
								      <a href="#" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								 </li>
						    </ul>
						</nav>
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
var subjectname = '<c:out value ="${subjectname}"/>';
$('#makingboardmodal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text("글 작성 :" +recipient)
	  modal.find('.modal-body #subjectname').val(recipient)
	  modal.find('.modal-body #boardname').val('')
	  modal.find('.modal-body #content').val('')
	  modal.find('.modal-footer #boardcreatepro').removeAttr('value').empty().append('글작성')
	})
$(document).on('click','#showoneboard1',function(){
	var idboard = $(this).attr('value');
	var modal =$('#showoneboard');
	modal.find('.modal-body #boardname').empty()
	modal.find('.modal-body #boardwriter').empty()
	modal.find('.modal-body #hit').empty()
	modal.find('.modal-body #boardcontent').empty()
	
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
	var obj = new Object();
	var subject = $('#subjectname').val();
	var name = $('#boardname').val();
	var content = $('#content').val();
	var idboard =$(this).attr('value');
	if(!name){
		alert("제목을 작성하세요");
		return;
	}
	if(!content){
		alert("내용을 작성하세요");
		return;
	}
	obj.boardsubject = subject;
	obj.boardname = name;
	obj.boardcontent = content;
	obj.boardwriter = user;
	if(idboard !=null){
		obj.idboard = idboard
	}else{
		obj.idboard =0;
	}
	var Data = JSON.stringify(obj);
	console.log(obj)
	$.ajax('/boardcreating',{
		type:'post',
		dataType: 'html',
		data:{
				Data : Data
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
	var button =$(this)
	$.ajax('/likecreating',{
		type:'get',
		dataType: 'html',
		data:{
				usernumber : usernumber,
				idboard : Idboard
			},
		success:function(html){
			$('#status').append('<div class="alert alert-success alert-dismissible"role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>좋아요가 완료되었습니다</div>');
			button.attr('disabled','disabled')
			$('#thumbs-down').removeAttr('disabled')
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
			$('#thumbs-up').removeAttr('disabled')
			$(this).attr('disabled','')
		},
		error:function(request,status,error){
			}

		});	
})
$(document).on('click','#boarddelete',function(){
	var idboard = $(this).attr('value');
	$.ajax('/deleteboard',{
		type:'delete',
		dataType:'json',
		data:{
			idboard : idboard
		},
		success:function(json){
			alert("글이 삭제 되었습니다.");
		},
		error:function(request,status,error){
			console.log(request +' '+ status + ' ' + error);
			console.log( request.status );
			console.log( request.statusText );
			console.log( request.responseText );
			console.log( request.readyState );
		}
		});
})
$(document).on('click','#boardmodified',function(){
	var idboard =$(this).attr('value');
	$.ajax('/boardmodified',{
		type: 'put',
		dataType:'json',
		data:{
			idboard:idboard
		},
		success:function(json){
			var modal = $('#makingboardmodal');
			modal.modal('show');
			modal.find('.modal-title').text("글 수정")
			modal.find('.modal-body #subjectname').val(json.boardsubject)
			modal.find('.modal-body #boardname').val(json.boardname)
			modal.find('.modal-body #content').val(json.boardcontent)
			var button =modal.find('.modal-footer #boardcreatepro').empty()
			button.append('글 수정')
			button.attr('value',json.idboard)
			console.log(json);
		},
		error:function(request,status,error){
		}
		
	});	
})
$(document).on('click','#search',function(){
	console.log($('#eee').val())  //from ->
	console.log($('#q').val()) // 컬럼 id content name
	console.log($('#w').val()) // 검색 ->like ?
	console.log($(this).attr('value')) //from ->subjectname

	
})
</script>
	
