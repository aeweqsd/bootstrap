<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ include file="link.jsp" %>
<script src="/static/Setting2.js"></script>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand">테스트페이지</a>	
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/">Home</a></li>
					<sec:authorize access="isAnonymous()">
					<li><a href="#" id="show_login">로그인</a></li>
					<li><a href="#" id="show_Register">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li><a href="/logout">로그아웃</a></li>
					<li><a href="#" id="show_Register">내정보보기</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="#" id="show_admin">관리자 도구</a></li>
					</sec:authorize>
					
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginform" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="loginform">Login</h4>
					</div>
				<div class="modal-body">
					<form action="/loginPro" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-group">
								<label for="id" class="control-label">id</label>
								<input type="text" class="form-control" id="username" name="username" required>
								<label for="password" class="control-label">password</label>
								<input type="password" class="form-control" id="password" name="password" required>
								<div class="checkbox">
									<label>
										<input type="checkbox" value="remember-me">Remember
									</label>
								</div>
							</div>
					<button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>		
					</form>
					</div>
				</div>
			</div>
		</div>
		
<script>
$('#show_login').on('click',function(){
	$('#loginModal').modal('show');
});
$(document).on('click', '#show_admin', function () {
	window.open("admin","Register","width=800,height=700 location=yes");
});



</script>