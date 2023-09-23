<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Checkout" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">
			
		<div class="justify-center flex-col error-popup">
			<div class="justify-between">
				<span class="material-icons">error</span>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>
			<p id="error-text" class="pFont text-center">${errorMsg }</p>
		</div>
		<script src="js/error-popup.js"></script>

		<div class="checkout-container">

			<div class="checkout-summary">
				<div class="small-item-container">

					<c:if test="${not empty cartItems }">
						<c:set var="total" value="${0}" />
						<c:set var="itemCount" value="${0}" />
						<c:forEach items="${cartItems }" var="c" varStatus="item">
							<c:set var="total"
								value="${total + c.getProduct().getPrice() * c.count}" />
							<c:set var="itemCount" value="${itemCount + 1 * c.count}" />

							<div class="small-item">
								<a class="si-img-wrapper"
									href="/product-details?pId=${c.getProduct().getId() }"> <img
									alt="${c.getProduct().getPhotos() }"
									src="${c.getProduct().getPhotoImagePath() }" width="200">
								</a>
								<div class="si-details flex-col justify-center">
									<h3>${c.getProduct().getName() }</h3>
									<p class="amount">
										Items:
										<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${c.getProduct().getPrice()} " />
										&times; ${c.count }
									</p>
									<p class="price">&dollar; ${c.getProduct().getPrice() * c.count}</p>
								</div>
							</div>

						</c:forEach>
					</c:if>

					<c:if test="${empty cartItems }">
						<div class="flex-col align-center"
							style="background-color: var(- -secondary); border-radius: 10px; padding-bottom: 1.5rem;">
							<h2 class="section-heading text-center"
								style="color: var(- -white);">No Items in cart yet</h2>
							<button class="submit-button" type="button"
								onclick="window.location.href='products'">Shop Now!</button>
						</div>
					</c:if>

					<div id="delivery-total" class="checkout-total">
						<p class="cart-total justify-between">
								<span>Sub-total:</span> <span>&dollar;${total}</span>
						<c:if test="${itemCount > 4 }">
							<c:set var="shipping" value="${shippingFee * 2 }"></c:set>
							<p class="cart-total justify-between">
								<span>Shipping Fee:</span> <span>&dollar;${shippingFee * 2}</span>
							</p>
						</c:if>
						<c:if test="${itemCount <= 4 }">
							<c:set var="shipping" value="${shippingFee * 1 }"></c:set>
							<p class="cart-total justify-between">
								<span>Shipping Fee:</span> <span>&dollar;${shippingFee * 2}</span>
							</p>
						</c:if>

						<h4 class="cart-total justify-between">
							<span>Total :</span> <span>&dollar; ${total + shipping}</span>
						</h4>
					</div>
					
					<div id="pickup-total" class="checkout-total">

						<h4 class="cart-total justify-between">
							<span>Total :</span> <span>&dollar; ${total}</span>
						</h4>
					</div>

				</div>
				
				
				<div class="radio-wrapper">
					<div class="option">
						<input id="delivery-btn" class="input" type="radio" name="btn" value="option1"
							checked onclick="checkMethod()">
						<div class="btn">
							<span class="span">Delivery</span>
						</div>
					</div>
					<div class="option">
						<input id="pickup-btn" class="input" type="radio" name="btn" value="option2" onclick="checkMethod()">
						<div class="btn">
							<span class="span">Pickup</span>
						</div>
					</div>
				</div>
				
				
				<div id="delivery-form">
					<sf:form class="flex-col" method="post" modelAttribute="purchase" action="pay_with_paypal"
						style="gap: 1rem;">
						
						<input type="hidden" name="method" value="Delivery">
						
						<div class="justify-center">
							<input type="submit" value="Pay with Paypal" class="payment-btn btnAnimation">
						</div>
						
					</sf:form>

					<div class="justify-between flex-wrap" style="gap: 1rem;">

						<button class="submit-button cancel btnAnimation" type="button"
							onclick="window.history.back()" style="margin: 1rem auto;">Cancel</button>
					</div>
				</div>
				
				
				<div id="pickup-form" class="hidden">
					<sf:form class="flex-col" method="post" action="pay_with_paypal"
						style="gap: 1rem;">
						
						<input type="hidden" name="method" value="Pickup">
						
						<div class="justify-center">
							<input type="submit" value="Pay with Paypal" class="payment-btn btnAnimation">
						</div>
						
					</sf:form>
					
					<div class="justify-between flex-wrap" style="gap: 1rem;">

						<button class="submit-button cancel btnAnimation" type="button"
							onclick="window.history.back()" style="margin: 1rem auto;">Cancel</button>
					</div>
				</div>

				
				
			</div>
		</div>


	</div>
</main>

<script src="js/checkout-method.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>