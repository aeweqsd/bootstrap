<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
 <%@ include file="link.jsp" %>
 <body>
 <div class="container-fluid">
 	<div class="row">
 		<div class="col-sm-12">
 		<div id="show"></div>
 		
 		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#makingnotemodal">쪽지쓰기</button>
 		<button type="button" id="notedelete" class="btn btn-danger" disabled="disabled">쪽지삭제</button>
 		</div>
 	</div>
 </div>
 <div class="modal fade" id="makingnotemodal" tabindex="-1" role="dialog" aria-labelledby="makingnote" aria-hidden="true">
 	<div class="modal-dialog">
 		<div class="modal-content">
	 		<div class="modal-header">
	 			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="makingnote">쪽지쓰기</h4>
	 		</div>
	 		<div class="modal-body">
	 			<form>
	 				<div class="form-group">
	 					<div class="row">
	 						<div class="col-xs-8">
			 					<label for="receivername" class="control-label">보낼 상대</label>
			 					<input type="text" class="form-control" id="receiver" placeholder ="아이디쓰면서 체크">
			 					<div id="status"></div>
	 						</div>
	 					</div>
	 					<label for="content" class="control-label">내용:</label>
	 					<textarea class="form-control" id="content"></textarea>
	 				</div>
	 			</form>
	 		</div>
	 		<div class="modal-footer">
	 			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	 			<button type="button"id="sendmessage" class="btn btn-primary">쪽지보내기</button>
	 		</div>
 		</div>
 	</div>
 
 </div>
 </body>
 <script>
 var usernumber= '<c:out value ="${usernumber}"/>';
$(document).ready(function(){
	$.ajax('/readnote',{
		type:'post',
		dataType:'html',
		data:{
			usernumber : usernumber
		},
		success:function(html){
			$('#show').append(html);
		},
		error:function(){
		}

		});

	
})

$(document).on('keyup','#receiver',function(){
	var id = $(this).val()
	if(id.length <3){
		$('#status').empty();
		$('#status').append('<div class="alert alert-danger role="alert"><strong>아이디를 완성하세요</strong></div>');
		$('#sendmessage').attr('disabled','disabled');
		return;
	}else{
	$.ajax('/check_id',{
		type:'put',
		dataType:'json',
		data:{
			id :id
		},
		success:function(json){
			console.log(json);
			if(json.idreceiver ==0){
				$('#status').empty();
				$('#status').append('<div class="alert alert-warning role="alert"><strong>이 상대는 없는 상대입니다</strong></div>');
				$('#sendmessage').attr('disabled','disabled');
			}else{
				$('#status').empty();
				$('#status').append('<div class="alert alert-success role="alert"><strong>아이디가 있는 상대입니다.</strong></div>');
				$('#sendmessage').removeAttr('disabled');
			}
			$('#sendmessage').attr('value',json.idreceiver)

		},
		error:function(request,status,error){

		}

	});
	}
	
})
$(document).on('click','#sendmessage',function(){
	var idreceiver = $(this).attr('value');
	var content = $('#content').val();
	$.ajax('/sendmessage',{
		type:'post',
		dataType:'json',
		data :{
			idsender : usernumber,
			idreceiver : idreceiver,
			content : content
		},
		success:function(json){
			$('#status').empty();
			$('#status').append('<div class="alert alert-warning role="alert"><strong>메세지를 성공적으로 보냈습니다.</strong></div>');
			$('#receiver').val('');
			$('#content').val('');
		},
		error:function(request,status,error){

		}



		});
	
})


 </script>