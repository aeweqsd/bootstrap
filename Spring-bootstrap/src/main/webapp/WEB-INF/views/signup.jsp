<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@include file="link.jsp" %>
<script src="/static/Setting2.js"></script>
<body>
	<div class="Container">
		<div class="row">
			<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<div class="col-xs-12">
				 	<form action="/CreateMember" method="post">
				 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				 		<div class="col-xs-12">
					 		<label for="id">ID</label>
							<div class="form-group">
								<input type="text" placeholder="id"name="username" id="id" class="form-control" required>				 	
					 		</div>
					 		<button type="button" class="btn btn-info" id="Check_overlap" >중복확인</button>
					 		<div id="check"></div>
					 	</div>
				 		<label for="password">Password</label>
				 		<div class="form-group">
				 			<input type="password" placeholder="Password" name="password" id="password"class="form-control"required>
				 		</div>
				 		<label for="check-password">check-password</label>
				 		<div class="form-group">
				 			<input type="password" placeholder="check_password" name="check_password" id="check-password" class="form-control"required>
				 		</div>
				 		<label for="name">Name</label>
				 		<div class="form-group">
				 			<input type="text" placeholder="name" name="uname" id="name" class="form-control"required>
				 		</div>
				 		
				 		<button type="submit" id="Register_submit" class="btn btn-lg btn-primary btn-block">Submit</button>
				 	</form>
				</div>
			</div>
			<div class="col-xs-2"></div>
		</div>
	
	</div>
</body>
<script>
$('#Check_overlap').on('click',function(){
 	alert();
	$('#check_info').remove();
	var username =$('#id').val();
	$.ajax('Check_overlap',{
		type:'get',
		dataType:"json",
		data:{
			 username : username
			},
		success:function(msg){
			console.log(msg);
			if(!msg.overlap){
				$('#check').append('<div class="alert alert-success" id="check_info" role="alert">가능합니다</div>');
			}else{
				$('#check').append('<div class="alert alert-danger"id="check_info" role="alert">다른아이디를 사용하여 주세요</div>');
			}
			
		},
		error:function(request,status,error){
		}
			

		});
	 })
</script>