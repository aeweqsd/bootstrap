<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ include file="link.jsp" %>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-6"><a href="#" id="user_manage">사용자 관리</a></div>
			<div class="col-sm-6"><a href="#" id="subject_manage">게시판 관리</a>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="user_manager" tabindex="-1" role="dialog" aria-labelledby="user_manage" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">유저관리</h4>
					</div>
				<div class="modal-body">
				</div>
				</div>
			</div>
		</div>
	<div class="modal fade" id="subject_manager" tabindex="-1" role="dialog"aria-labelledby="subject_manager" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">게시판 관리</h4>
					</div>
				<div class="modal-body">
				<div id="subjectlist"></div>
				<input type="text" class="form-control"id=val>
				<button type="button"id="read_subject"class="btn btn-primary">게시판 검색</button>
				<button type="button"id="create_subject"class="btn btn-default">게시판 생성</button>
				<button type="button"id="delete_subject"class="btn btn-danger">게시판 삭제</button>
				</div>
				</div>
			</div>
		</div>
</body>


<script >

$(document).ready(function(){
	
});
$('#user_manage').on('click',function(){
	console.log($('#user_manage'));
	$('#user_manager').modal('show');
});
$('#subject_manage').on('click',function(){
	$('#subject_manager').modal('show');
/*	$.ajax('/read_subject',{
		type:'get',
		dataType: 'html',
		success:function(html){
			$('#subjectlist').append(html);
			},
		error:function(request,status,error){
			}

		});
	*/
});
$('#create_subject').on('click',function(){
	var name= $('#val').val();
	if(name ==null){
		alert('주제를 입력하셔야 합니다');
		return;
	}
	$.ajax('/create_subject',{
		type:'post',
		data: {subjectname : name},
		dataType:'html',
		success:function(html){
		
		},
		error:function(request,status,error){}

		});

});


</script>