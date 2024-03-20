<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> (+84) 35 77 JQKA</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i> nvdinh2003@gmail.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href="https://www.facebook.com/nvdinhhh/" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li><a href="https://github.com/NVDinh2003" target="_blank"><i class="fa fa-github"></i></a></li>
							<li><a href="views/404.jsp"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="https://www.google.com.vn/" target="_blank"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="trang-chu"><img class="mycss-logo-shop" src="./images/home/logo_chappie.jpg" alt="" /></a>
					</div>
					<div class="btn-group pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
								VietNam
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">USA</a></li>
								<li><a href="#">UK</a></li>
							</ul>
						</div>

						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
								VNĐ
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Đô la</a></li>
								<li><a href="#">Dollar</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
						
							<c:if test="${not empty USERMODEL}">
								<li><a href="cart?action=viewCart"><i class="fa fa-shopping-cart"></i>
									<i>(${cartItems.size()})</i>
									 Cart</a>
								</li>
							
							</c:if>		
							<c:if test="${empty USERMODEL}">
								<li><a href="dang-nhap?action=login"><i class="fa fa-shopping-cart"></i>
								<i>(0)</i> Cart</a></li>
							</c:if>						

							<c:if test="${not empty USERMODEL}">
								<li><a href="#"><i class="fa fa-user"></i>Hi ${USERMODEL.ten} !</a></li>
								<c:if test="${USERMODEL.role == 1}">
									<li><a href="admin-home"><i class="fa fa-user"></i>Admin home</a></li>
								</c:if>
								<li><a href="dang-nhap?action=logout"><i class="fa fa-lock"></i> Logout</a></li>
							</c:if>
							
							<c:if test="${empty USERMODEL}">
								<li><a href="#"><i class="fa fa-user"></i> No account</a></li>
								<li><a href="dang-nhap?action=login"><i class="fa fa-lock"></i> Login</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="trang-chu" class="active">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="products">Products</a></li>
									<li><a href="cart?action=viewCart">Cart</a></li>

								</ul></li>
							<li><a href="contact?action=help">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">

					<form class="search-form" action="products" method="get">
						<input type="text" name="search" placeholder="Search..." class="input-search">
						<button type="submit" class="btn-search">
							<i class="fa fa-search " aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom-->
</header>
<!--/header-->