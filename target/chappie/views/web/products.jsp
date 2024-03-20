<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Products</title>
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
								<h2>${item.tenDT}</h2>
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
								<li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
								<li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
							</ul>
						</div>

					</div>
				</div>

			</c:forEach>
		</div>

		<c:if test="${tag >= 1}">
			<ul class="pagination">
				<li class="${tag == 1?"disabled ":" "}"><a href="products?index=${tag-1}">&laquo;</a></li>
				<c:forEach begin="1" end="${model.totalPage }" var="i">
					<li class='${tag==i?"active":"" }'><a href="products?index=${i}">${i}</a></li>
				</c:forEach>
				<li class="${tag == model.totalPage?"disabled ":" "}"><a href="products?index=${tag+1}">&raquo;</a></li>
			</ul>
		</c:if>

	</div>

	<!--features_items-->


</body>

</html>