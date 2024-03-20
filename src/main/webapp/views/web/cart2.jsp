<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Shopping cart</title>
</head>

<body>
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="trang-chu">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td class="image">Item</td>
                            <td class="description"></td>
                            <td class="price">Price</td>
                            <td class="quantity">Quantity</td>
                            <td class="total">Total</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    
	               <c:choose>
				
				    <c:when test="${empty cartItems}">
				    
				        <%@ include file="/views/no_item_found.jsp"%>
				    
				    </c:when>
				
				    <c:otherwise>
				    	<c:forEach items="${cartItems}" var="cartItem">
					        <tr>
					            <td class="cart_product">
					                <a href="chi-tiet?id=${cartItem.phone.id }"><img src="${cartItem.phone.image1}" style="max-width: 100px;" alt=""></a>
					            </td>
					            <td class="cart_description">
					                <h4>
					                    <a href="chi-tiet?id=${cartItem.phone.id }">   ${cartItem.phone.tenDT}</a>
					                </h4>
					                <p>Web ID: ${cartItem.phone.id}</p>
					            </td>
					            <td class="cart_price">
					                <p style="font-size: 14px !important">${cartItem.phone.getDonGiaFormat()}</p>
					            </td>
 <!--                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href=""> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                        <a class="cart_quantity_down" href=""> - </a>
                                    </div>
                                </td> -->
        <td class="cart_quantity">
            <div class="cart_quantity_button">
<%--                 <a class="cart_quantity_up" href="cart?action=updateQuantity&productId=${cartItem.phone.id}&actionType=increase"> + </a> --%>
					<a href="" class="cart_quantity_up">
					<form action="cart" method="post">
					     <input type="hidden" name="action" value="updateQuantity">
					     <input type="hidden" name="productId" value="${cartItem.phone.id}">
					     <input type="hidden" name="actionType" value="increase">
					     <button type="submit"> + </button>				     
					</form>
					</a>	
                <input class="cart_quantity_input" type="text" name="quantity" value="${cartItem.quantity}" autocomplete="off" size="2">
                <%-- <a class="cart_quantity_down" href="cart?action=updateQuantity&productId=${cartItem.phone.id}&actionType=decrease"> - </a> --%>
            		<a href="" class="cart_quantity_down">
            		<form action="cart" method="post">
					     <input type="hidden" name="action" value="updateQuantity">
					     <input type="hidden" name="productId" value="${cartItem.phone.id}">
					     <input type="hidden" name="actionType" value="decrease">
					     <button type="submit"> - </button>				     
					</form>
					</a>	
            </div>
        </td>
					            <td class="cart_total">
					                <p class="cart_total_price" style="font-size: 16px !important">
					               <fmt:formatNumber value="${cartItem.phone.donGia * cartItem.quantity}" 
					                  type="currency" 
					                  currencyCode="VND"
					                  maxFractionDigits="0"/> VNĐ  </p>
					            </td>
					            <td class="cart_delete">
                                    <form action="cart" method="post">
                                        <input type="hidden" name="action" value="removeItem">
                                        <input type="hidden" name="productId" value="${cartItem.phone.id}">
                                        <button type="submit" class="cart_quantity_delete"><i class="fa fa-times"></i></button>
                                    </form>
                                </td>
					        </tr>
					    </c:forEach>
				  	</c:otherwise>
				
				</c:choose>
			    			
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!--/#cart_items -->

    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>What would you like to do next?</h3>
                <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="chose_area">
                        <ul class="user_option">
                            <li><input type="checkbox"> <label>Use Coupon Code</label></li>
                            <li><input type="checkbox"> <label>Use Gift Voucher</label></li>
                            <li><input type="checkbox"> <label>Estimate Shipping & Taxes</label></li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field"><label>Country:</label> <select>
                                    <option>Việt Nam</option>
                                    <option>United States</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select></li>
                            <li class="single_field"><label>Region / State:</label> <select>
                                    <option>Select</option>
                                    <option>Dhaka</option>
                                    <option>London</option>
                                    <option>Dillih</option>
                                    <option>Lahore</option>
                                    <option>Alaska</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select></li>
                            <li class="single_field zip-field"><label>Zip Code:</label> <input type="text"></li>
                        </ul>
                        <a class="btn btn-default update" href="">Get Quotes</a> <a class="btn btn-default check_out" href="">Continue</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">
                    
                  <c:choose>
				
				    <c:when test="${empty cartItems}">				    
				        	<ul>
                                <li>Cart Sub Total <span>...</span></li>
                                <li>Eco Tax <span>...</span></li>
                                <li>Shipping Cost <span>...</span></li>
                                <li>Total <span>...</span></li>
                            </ul>			    
				    </c:when>
				
					    <c:otherwise>
					    <ul>
                            <li>Cart Sub Total <span>
                             		<fmt:formatNumber value="${cartTotal}" 
					                  type="currency" 
					                  currencyCode="VND"
					                  maxFractionDigits="0"/> VNĐ</span></li>
                            <li>Eco Tax (0.2%) <span>
                             		<fmt:formatNumber value="${cartTotal*0.02 }" 
					                  type="currency" 
					                  currencyCode="VND"
					                  maxFractionDigits="0"/> VNĐ</span></li>
                            <li>Shipping Cost <span>Free</span></li>
                            <li>Total <span>
                             		<fmt:formatNumber value="${cartTotal-cartTotal*0.02}" 
					                  type="currency" 
					                  currencyCode="VND"
					                  maxFractionDigits="0"/> VNĐ</span></li>
                        </ul>
					   </c:otherwise>
                  </c:choose>                       
                        <a class="btn btn-default update" href="">Update</a> <a class="btn btn-default check_out" href="checkout">Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#do_action-->
</body>


</html>
