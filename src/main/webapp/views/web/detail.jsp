<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Chi tiết</title>
</head>

<body>
	<div class="col-sm-9 padding-right">
								<c:if test="${not empty message }">
								<div class="alert alert-${alert }">${message }</div>
							</c:if>
		<div class="product-details">
			<!--product-details-->
			<div class="col-sm-5">
				<div class="view-product">
					<img src="${model.image1}" alt="" />
					<h3>ZOOM</h3>
				</div>
				<div id="similar-product" class="carousel slide" data-ride="carousel">

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<c:forEach begin="1" end="3" var="i">
							<div class="item ${i==1?"active ":" "}">
								<a href=""><img src="${model.s_image }" style="max-width: 85px" alt=""></a> <a href=""><img src="${model.s_image }" style="max-width: 85px" alt=""></a> <a href=""><img
										src="${model.s_image }" style="max-width: 85px" alt=""></a>
							</div>
						</c:forEach>
					</div>

					<!-- Controls -->
					<a class="left item-control" href="#similar-product" data-slide="prev"> <i class="fa fa-angle-left"></i>
					</a> <a class="right item-control" href="#similar-product" data-slide="next"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>

			<div class="col-sm-7">
				<div class="product-information">
					<!--/product-information-->
					<img src="images/product-details/new.jpg" class="newarrival" alt="" />
					<h2>${model.tenDT }</h2>
					<p>Giá: ${model.getDonGiaFormat() }</p>
					<img src="images/product-details/rating.png" alt="" />
					<span>
						<span>${model.maHangSX }</span>
						<label>Quantity:</label>
						<input type="text" value="1" />

								<c:choose>
									<c:when test="${empty USERMODEL}">
										<a href="dang-nhap?action=login" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</c:when>	
									<c:otherwise>
										<form action="cart" method="post">
											<input type="hidden" name="productId" value="${model.id}">
											<input type="hidden" name="quantity" value="1" min="1">
											<input type="hidden" value="addToCart" name="action" />
											<button type="submit" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart
											</button>
										</form>
									</c:otherwise>
								</c:choose>				
					</span>
					<p>
						<b>RAM:</b> ${model.RAM }GB
					</p>
					<p>
						<b>Dung lượng:</b> ${model.dungLuong }
					</p>
					<p>
						<b>Brand:</b> Chappie-SHOPPER
					</p>
					<a href=""><img src="images/product-details/share.png" class="share img-responsive" alt="" /></a>
				</div>
				<!--/product-information-->
			</div>
		</div>
		<!--/product-details-->

		<div class="category-tab shop-details-tab">
			<!--category-tab-->
			<div class="col-sm-12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
				</ul>
			</div>
			<div class="tab-content">

				<div class="tab-pane fade active in" id="reviews">
					<div class="col-sm-12">
						<ul>
							<li><a href=""><i class="fa fa-user"></i>Huế</a></li>
							<li><a href=""><i class="fa fa-clock-o"></i>10:12 PM</a></li>
							<li><a href=""><i class="fa fa-calendar-o"></i>28 DEP 2022</a></li>
						</ul>
						<p>${model.chiTiet}</p>
						<p>
							<b>Write Your Review</b>
						</p>
<form action="send-mail" method="post">

  <input type="text" name="name" placeholder="Your Name">
  
  <input type="email" name="email" placeholder="Email Address">
  
  <textarea name="message"></textarea> 
    <input type="hidden" name="pId" value="${model.id }">
  
  <button type="submit">Submit</button>

</form>
					</div>
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
						<c:forEach items="${phoneRecommended1 }" var="item">
							<a href="chi-tiet?id=${item.id }">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image2 }" alt="" />
												<h2>${item.getDonGiaFormat() }</h2>
												<p>${item.tenDT }</p>
							</a>
								<c:choose>
									<c:when test="${empty USERMODEL}">
										<a href="dang-nhap?action=login" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</c:when>	
									<c:otherwise>
										<form action="cart" method="post">
											<input type="hidden" name="productId" value="${item.id}">
											<input type="hidden" name="quantity" value="1" min="1">
											<input type="hidden" value="addToCart" name="action" />
											<button type="submit" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart
											</button>
										</form>
									</c:otherwise>
								</c:choose>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</div>

					<div class="item">
						<c:forEach items="${phoneRecommended2 }" var="item">
							<a href="chi-tiet?id=${item.id }">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image2 }" alt="" />
												<h2>${item.getDonGiaFormat() }</h2>
												<p>${item.tenDT }</p>
							</a>
								<c:choose>
									<c:when test="${empty USERMODEL}">
										<a href="dang-nhap?action=login" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</c:when>	
									<c:otherwise>
										<form action="cart" method="post">
											<input type="hidden" name="productId" value="${item.id}">
											<input type="hidden" name="quantity" value="1" min="1">
											<input type="hidden" value="addToCart" name="action" />
											<button type="submit" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart
											</button>
										</form>
									</c:otherwise>
								</c:choose>
											</div>
										</div>
									</div>
								</div>

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