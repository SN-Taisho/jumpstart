<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Product Management" name="HTMLtitle" />
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

		<div class="selection-wrapper">
			<button class="default" onclick="window.location.href='product-management'">Product-Management</button>
			<button onclick="window.location.href='add-product'">Add a New Product</button>
			<button>In-store Pickups</button>
			<button>Delivery Orders</button>
		</div>

		<jsp:include page="../Components/product-listing.jsp"></jsp:include>

	</div>
</main>

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>