<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>Chappie</span>xN.V.Đ-SHOP</h1>
									<h2>Ai Phôn 14 pờ rồ mắc 1TB</h2>
									<p>iPhone 14 series có sự nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung, bộ vi xử lý mạnh mẽ, 
									thời lượng pin ấn tượng và camera chuẩn điện ảnh, mang đến trải nghiệm người dùng thông minh nhất từ trước đến nay.</p>
									<button type="button" class="btn btn-default get">Lụm ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="<%=request.getContextPath()%>/images/home/iphone-14-pro-max-timjpg.jpg" class="mycss-height-phone girl img-responsive" alt="" />
									<img src="<%=request.getContextPath()%>/images/home/Label_01-05.png"  class="pricing" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Chappie</span>xN.V.Đ-SHOP</h1>
									<h2>Samsung Galaxy Z Fold4 512GB</h2>
									<p>Samsung Galaxy Z Fold4 512GB sở hữu màn hình lớn cùng cơ chế gấp gọn giúp người dùng có thể dễ dàng mang theo. Cùng với đó là sự nâng cấp về hiệu 
									 năng và phần mềm giúp máy xử lý tốt hầu hết mọi tác vụ bạn cần từ làm việc đến giải trí.</p>
									<button type="button" class="btn btn-default get">Lụm ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="<%=request.getContextPath()%>/images/home/samsung-galaxy-z-fold4-xanh-512gb-600x600.jpg" class="mycss-height-phone girl img-responsive" alt="" />
									<img src="<%=request.getContextPath()%>/images/home/label-moi-ra-mat-fnal.png"  class="pricing" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Chappie</span>xN.V.Đ-SHOP</h1>
									<h2>Xiaomi Black Shark 6 Pro</h2>
									<p>The Xiaomi Black Shark 6 Pro 5G will be launched in India on December 31, 2022 (Expected). The mobile will be equipped with striking features and specifications.
									 You will be able to buy this mobile from Xiaomi at a starting price of Rs 47,665.</p>
									<button type="button" class="btn btn-default get">Lụm ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="<%=request.getContextPath()%>/images/home/Xiaomi-BLACK-SHARK-4S-Pro-18.jpg" class="mycss-height-phone girl img-responsive" alt="" />
									<img src="<%=request.getContextPath()%>/images/home/Label_01-02.png" class="pricing" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->