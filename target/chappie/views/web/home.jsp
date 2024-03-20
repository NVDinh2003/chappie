<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>

<body>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">Features Items</h2>

			<c:forEach items="${model.listResult }" var="item">
				<div class="col-sm-4">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="${item.image1 }" alt="" />
								<h2>${item.donGia}</h2>
								<p>${item.tenDT }</p>
								<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>
							<a href="chi-tiet?id=${item.id }">
								<div class="product-overlay">
									<div class="overlay-content">
										<h2>${item.donGia }</h2>
										<p>${item.tenDT }</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
							</a>
						</div>
						<div class="choose">
							<ul class="nav nav-pills nav-justified">
								<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
								<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!--end features_items-->

		<div class="category-tab">
			<!--category-tab-->
			<div class="col-sm-12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tshirt" data-toggle="tab">iPhone</a></li>

					<c:forEach items="${manuList }" var="m">
						<li><a href="#" data-toggle="tab">${m.tenHangSX }</a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="tab-content">
				<div class="tab-pane fade active in" id="tshirt">
					<c:forEach items="${phoneManufacture.listResult }" var="item">
						<a href="chi-tiet?id=${item.id }">
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="${item.image2 }" alt="" />
											<h2>${item.donGia }</h2>
											<p>${item.tenDT }</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>

									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--/category-tab-->

		<div class="recommended_items">
			<!--recommended_items-->
			<h2 class="title text-center">recommended items</h2>

			<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<c:forEach items="${phoneRecommended1.listResult }" var="item">
							<a href="chi-tiet?id=${item.id }">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image2 }" alt="" />
												<h2>${item.donGia }</h2>
												<p>${item.tenDT }</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>

					</div>
					<div class="item">
						<c:forEach items="${phoneRecommended2.listResult }" var="item">
							<a href="chi-tiet?id=${item.id }">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image2 }" alt="" />
												<h2>${item.donGia }</h2>
												<p>${item.tenDT }</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
					<div class="item">
						<c:forEach items="${phoneRecommended3.listResult }" var="item">
							<a href="chi-tiet?id=${item.id }">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image2 }" alt="" />
												<h2>${item.donGia }</h2>
												<p>${item.tenDT }</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>

					</div>
				</div>
				<a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev"> <i class="fa fa-angle-left"></i>
				</a> <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next"> <i class="fa fa-angle-right"></i>
				</a>
			</div>
		</div>
		<!--/recommended_items-->

	</div>

</body>

</html>