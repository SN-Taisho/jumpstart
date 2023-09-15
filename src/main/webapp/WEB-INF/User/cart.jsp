<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Cart" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">
		
		<div class="align-center success-popup">
			<span class="material-icons">done</span>
			<p id="error-text" class="pFont success-text">${successMsg }</p>
			<button class="btnAnimation icon material-icons"
				onclick="closeSuccess()">close</button>
		</div>
		
		<div class="cart-wrapper" style="margin-bottom: 3rem;">
			<div class="item-container">

				<c:set var="total" value="${0}"/>
				<c:forEach items="${cartItems }" var="c" varStatus="item">
					<c:set var="total" value="${total + c.getProduct().getPrice() * c.count}" />
					<div class="cart-item">
						<a class="ci-img-wrapper"
							href="/product-details?pId=${c.getProduct().getId() }"> <img
							alt="${c.getProduct().getPhotos() }" src="${c.getProduct().getPhotoImagePath() }" width="200">
						</a>
						<div class="ci-details">
							<h3>${c.getProduct().getName() }</h3>
							<p class="amount">
								Items:
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${c.getProduct().getPrice()} " />
								&times; ${c.count }
							</p>
							<p class="price">&dollar; ${c.getProduct().getPrice() * c.count}</p>
							<div class="ci-actions">
								<button class="delete"
									onclick="window.location.href='/remove_from_cart?cId=${c.id}'">Remove</button>
								<button id="openEditAmount${item.count }" class="edit">Edit
									Amount</button>
							</div>
						</div>
					</div>
					
				</c:forEach>

			</div>
			<div class="cart-details">
				<h4 class="cart-total justify-between">
					<span>Total :</span> <span>&dollar; ${total }</span>
				</h4>
				<button class="checkout">Proceed to Checkout</button>
			</div>
		</div>
		<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>
	</div>
</main>

<c:forEach items="${cartItems }" var="c" varStatus="item">
	<dialog id="editAmountModal${item.count }" class="modal" style="height: fit-content;">

	<h3 class="modal-heading">Edit Amount</h3>
	<span id="error-text" class="form-error"></span> <sf:form
		class="align-center flex-col form" method="post"
		action="edit_cartItem_amount?cId=${c.id }" modelAttribute="cartItem">

		<label class="input-group flex-col" style="margin: 1rem 0rem 2rem;">Item
			amount<input type="number" required autocomplete="off" name="count"
			value="${c.count }"
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
		</label>

		<button class="submit-button save btnAnimation" type="submit"
			style="margin: 0rem auto;">Save</button>

	</sf:form>
	<button id="closeEditAmount${item.count }"
		class="material-icons modal-close">close</button>
	</dialog>

	<script>
const editAmountM${item.count } = document.querySelector("#editAmountModal${item.count }");
const openEditAmount${item.count } = document.querySelector("#openEditAmount${item.count }");
const closeeditAmount${item.count } = document.querySelector("#closeEditAmount${item.count }");

openEditAmount${item.count }.addEventListener("click", () => {
	editAmountM${item.count }.showModal();
	});

closeEditAmount${item.count }.addEventListener("click", () => {
		editAmountM${item.count }.close();
	});
</script>
</c:forEach>

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>