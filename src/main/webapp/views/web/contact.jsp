<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact us</title>
</head>
<body>
	<div id="contact-page" class="container">
		<div class="bg">
			<div class="row">
				<div class="col-sm-12">
					<h2 class="title text-center">
						Contact <strong>Us</strong>
					</h2>
					<div class="contact-map">
						<img src="<%=request.getContextPath()%>/images/2560px-World_Flag_map.png" alt="" />
					</div>
					<!-- <div id="gmap" class="contact-map"> -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8">
				<div class="contact-form">
					<h2 class="title text-center">Get In Touch</h2>
					<div class="status alert alert-success" style="display: none"></div>
					<form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
						<div class="form-group col-md-6">
							<input type="text" name="name" class="form-control" required="required" placeholder="Name">
						</div>
						<div class="form-group col-md-6">
							<input type="email" name="email" class="form-control" required="required" placeholder="Email">
						</div>
						<div class="form-group col-md-12">
							<input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
						</div>
						<div class="form-group col-md-12">
							<textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
						</div>
						<div class="form-group col-md-12">
							<input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="contact-info">
					<h2 class="title text-center">Contact Info</h2>
					<address>
						<p>Chappie x N.V.Đ shopper Inc.</p>
						<p>143 Hàn Mặc Tử, p.Vĩ Dạ, TP Huế</p>
						<p>Việt Nam</p>
						<p>Mobile: (+84) 35 77 JQKA</p>
						<p>Fax: có dùng deo đâu</p>
						<p>Email: nvdinh2003@gmail.com</p>
					</address>
					<div class="social-networks">
						<h2 class="title text-center">Social Networking</h2>
						<ul>
							<li><a href="https://www.facebook.com/nvdinhhh/" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li><a href="views/404.jsp"><i class="fa fa-twitter"></i></a></li>
							<li><a href="https://github.com/NVDinh2003" target="_blank"><i class="fa fa-github"></i></a></li>
							<li><a href="views/404.jsp"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="https://www.google.com.vn/" target="_blank"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!--/#contact-page-->
</body>
</html>