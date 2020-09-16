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