<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="col-sm-3">
	<div class="left-sidebar">
		<h2>Filter</h2>
		<div class="panel-group category-products" id="accordian">
			<!--category-productsr-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordian" href="#price"> <span class="badge pull-right">
								<i class="fa fa-plus"></i>
							</span> Mức giá
						</a>
					</h4>
				</div>
				<div id="price" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="trang-chu?gia=2">Dưới 2 triệu</a></li>
							<li><a href="trang-chu?gia=4">Từ 2-4 triệu</a></li>
							<li><a href="trang-chu?gia=7">Từ 4-7 triệu</a></li>
							<li><a href="trang-chu?gia=13">Từ 4-13 triệu</a></li>
							<li><a href="trang-chu?gia=20">Từ 13-20 triệu</a></li>
							<li><a href="trang-chu?gia=21">Trên 20 triệu</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordian" href="#ram"> <span class="badge pull-right">
								<i class="fa fa-plus"></i>
							</span> RAM
						</a>
					</h4>
				</div>
				<div id="ram" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="trang-chu?ram=2">2GB</a></li>
							<li><a href="trang-chu?ram=3">3GB</a></li>
							<li><a href="trang-chu?ram=4">4GB</a></li>
							<li><a href="trang-chu?ram=6">6GB</a></li>
							<li><a href="trang-chu?ram=8">8GB</a></li>
							<li><a href="trang-chu?ram=12">12GB</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordian" href="#dungluong"> <span class="badge pull-right">
								<i class="fa fa-plus"></i>
							</span> Dung lượng lưu trữ
						</a>
					</h4>
				</div>
				<div id="dungluong" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="trang-chu?dung-luong=32GB">32GB </a></li>
							<li><a href="trang-chu?dung-luong=64GB">64GB </a></li>
							<li><a href="trang-chu?dung-luong=128GB">128GB </a></li>
							<li><a href="trang-chu?dung-luong=256GB">256GB</a></li>
							<li><a href="trang-chu?dung-luong=512GB">512GB </a></li>
							<li><a href="trang-chu?dung-luong=1TB">1TB </a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!--/category-products-->

		<div class="brands_products">
			<!--brands_products-->
			<h2>Mobile phone brands</h2>
			<div class="brands-name">
				<ul class="nav nav-pills nav-stacked">
					<c:forEach items="${categoryList }" var="m">
						<li><a href="trang-chu?dien-thoai=${m.maHangSX }">${m.tenHangSX }</a></li>

					</c:forEach>
				</ul>
			</div>
		</div>
		<!--/brands_products-->

		<div class="price-range">
			<!--price-range-->
			<h2>Price Range</h2>
			<div class="well text-center">
				<input type="text" class="span2" value="" data-slider-min="1" data-slider-max="50" data-slider-step="1" data-slider-value="[15,35]" id="sl2">
				<br />
				<b class="pull-left">1tr VNĐ</b> <b class="pull-right">50tr VNĐ</b>
			</div>
		</div>
		<!--/price-range-->

		<div class="shipping text-center">
			<!--shipping-->
			<img src="images/home/left_image2.jpg" alt="" />
		</div>
		<!--/shipping-->

	</div>
</div>