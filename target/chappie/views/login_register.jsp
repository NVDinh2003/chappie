<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body>
	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<!--login form-->
						<h2>Login to your account</h2>
						<form action="dang-nhap" method="post">
							<input type="text" name="username" placeholder="Email hoặc SĐT..." required/>
							<input type="password" name="password" placeholder="Mật khẩu..." required/>
							<span>
								<input type="checkbox" class="checkbox">
								Keep me signed in
							</span>
							<c:if test="${not empty message }">
								<div class="alert alert-${alert }">${message }</div>
							</c:if>
							<input type="hidden" value="login" name="action" />
							<button type="" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form">
						<!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="#">
							<input type="text" placeholder="Họ..." required/>
							<input type="text" placeholder="Tên..." required/>
							<input type="email" placeholder="Email..." required/>
							<input type="text" placeholder="Số điện thoại..." required/>
							<input type="password" placeholder="Mật khẩu..." required/>
							<input type="date" placeholder="Ngày sinh..." required/>
							<input type="text" placeholder="Địa chỉ..." required/>
							<button type="" class="btn btn-default">Signup</button>
						</form>
					</div>
					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->
</body>

</html>