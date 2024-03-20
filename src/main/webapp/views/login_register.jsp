<%@include file="/common/taglib.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>

<% request.setCharacterEncoding("UTF-8"); %>
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
						<c:if test="${not empty USERMODEL }">
							<input type="text" name="username" value="${USERMODEL.email}" required/>
							<input type="password" name="password" value="${USERMODEL.matKhau}" required/>
						</c:if>
						<c:if test="${empty USERMODEL }">
							<input type="text" name="username" placeholder="Email hoặc SĐT..." required/>
							<input type="password" name="password" placeholder="Mật khẩu..." required/>
						</c:if>
							
					<span>
					    <input type="checkbox" name="checkboxIsChecked" class="checkbox">
					    Keep me signed in
<%-- <input type="checkbox" name="checkboxIsChecked" class="checkbox" <c:if test="${cookie['UserName'] ne null}">checked</c:if>>
Keep me signed in --%>

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
				      <form action="dang-nhap" method="post">
				            <input type="text" name="ho" placeholder="Họ..." required/>
				            <input type="text" name="ten" placeholder="Tên..." required/>
				            <input type="email" name="email" placeholder="Email..." required/>
				            <input type="text" name="sdt" placeholder="Số điện thoại..." required/>
				            <input type="password" name="matKhau" placeholder="Mật khẩu..." required/>
				            <input type="date" name="ngaySinh" placeholder="Ngày sinh..." required/>
				            <input type="text" name="diaChi" placeholder="Địa chỉ..." required/>
				            
				            <c:if test="${not empty message }">
								<div class="alert alert-${alert }">${message }</div>
							</c:if>
				            <input type="hidden" value="register" name="action" />
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