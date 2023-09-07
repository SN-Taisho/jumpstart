<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Cart" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<div class="cart-wrapper">
			<div class="item-container">

				<c:forEach begin="1" end="5" varStatus="loop">
					<div class="cart-item">
						<a class="ci-img-wrapper"
							href="/product-details?pId=${loop.count }"> <img
							alt="Card Photo" src="https://placehold.co/300" width="200">
						</a>
						<div class="ci-details">
							<h3>Product - ${loop.count }</h3>
							<p class="amount">Items: ${loop.count }</p>
							<p class="price">&dollar; ${loop.count * 100 }</p>
							<div class="ci-actions">
								<button class="delete">Remove</button>
								<button class="edit">Edit amount</button>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="cart-details">

				<c:forEach begin="1" end="5" varStatus="loop">
					<div class="item-details">
						<p class="justify-between">
							<span>Item - ${loop.count }</span><span>&dollar;${loop.count * 100}</span><span>&times; ${loop.count }</span>
						</p>
					</div>
				</c:forEach>
				<h4 class="cart-total justify-between">
					<span>Total :</span> <span>9099</span>
				</h4>
				<button class="checkout">Proceed to Checkout</button>
			</div>
		</div>

	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>