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
			
			<c:choose>
			
			    <c:when test="${empty allProducts}">
			    
			        <%@ include file="/views/no_item_found.jsp"%>
			    
			    </c:when>
			
			    <c:otherwise>
			
					<c:forEach items="${allProducts}" var="item">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${item.image1 }" alt="" />
										<h2>${item.tenDT}</h2>
										<p>${item.getDonGiaFormat() }</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<a href="chi-tiet?id=${item.id }">
										<div class="product-overlay">
											<div class="overlay-content">
												<h2>${item.getDonGiaFormat() }</h2>
												<p>${item.tenDT }</p>
									</a>
												<!-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a> -->
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
		
							</div>
						</div>
		
					</c:forEach>

			    
			    </c:otherwise>
			
			</c:choose>
			
		
		</div>
		<!-- end feature item -->
		<c:if test="${page >= 1}">
			<ul class="pagination">
				<li class="${page == 1?"disabled ":" "}"><a href="products?index=${page-1}">&laquo;</a></li>
				<c:forEach begin="1" end="${totalPage }" var="i">
					<li class='${page==i?"active":"" }'><a href="products?index=${i}">${i}</a></li>
				</c:forEach>
				<li class="${page == totalPage?"disabled ":" "}"><a href="products?index=${page+1}">&raquo;</a></li>
			</ul>
		</c:if>

	</div>

	<!--features_items-->


</body>

</html>