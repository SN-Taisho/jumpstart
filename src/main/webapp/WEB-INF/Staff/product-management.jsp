<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
			<button class="default"
				onclick="window.location.href='product-management'">Product-Management</button>
			<button onclick="window.location.href='add-product'">Add a
				New Product</button>
			<button>In-store Pickups</button>
			<button>Delivery Orders</button>
		</div>

		<div class="selection-wrapper">
			<button class="default">All Categories</button>
			<c:forEach items="${categories }" var="c">
				<button>${c.name }</button>
			</c:forEach>
		</div>

		<section class="product-list">

			<c:forEach items="${products }" var="p">
				<div class="product-card">
					<a class="card-img-wrapper" href="/product-details?pId=${p.id}">
						<img alt="${p.photos }" src="${p.photoImagePath }" width="275">
					</a>
					<h3>${p.name }</h3>
					<p class="price">&dollar;&nbsp;${p.price}</p>
					<p class="sales">Items sold: ${p.sales }</p>
					<p class="sales">Items in-stock: ${p.stock }</p>

					<button class="edit-btn" style="margin: 0rem 1rem 1rem auto;"
						onclick="window.location.href='edit-product?pId=${p.id}'">
						Edit Details<i class="material-icons">edit</i>
					</button>
				</div>
			</c:forEach>

		</section>

	</div>
</main>

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>