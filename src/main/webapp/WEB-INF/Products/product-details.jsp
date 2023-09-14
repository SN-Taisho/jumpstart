<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:forEach items="${product}" var="p">
	<c:set var="id" value="${p.id }"></c:set>
	<c:set var="name" value="${p.name}"></c:set>
	<c:set var="desc" value="${p.description}"></c:set>
	<c:set var="price" value="${p.price}"></c:set>
	<c:set var="stock" value="${p.stock}"></c:set>
	<c:set var="sales" value="${p.sales}"></c:set>
	<c:set var="photo" value="${p.photos}"></c:set>
	<c:set var="photoImagePath" value="${p.photoImagePath}"></c:set>
</c:forEach>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Product Name" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter"
		style="margin: 3rem auto 3rem; max-width: 768px; padding: 0rem 2rem;">
		
		<div class="align-center success-popup">
			<span class="material-icons">done</span>
			<p id="error-text" class="pFont success-text">${successMsg }</p>
			<button class="btnAnimation icon material-icons"
				onclick="closeSuccess()">close</button>
		</div>
		
		<div class="product-details-container">
			<div class="img-wrapper">
				<img alt="${photos }" src="${photoImagePath }">
				<div>
					<p class="stock">Items left in stock: ${stock }</p>
					<h3 class="price">&dollar;&nbsp; ${price }</h3>
					<p class="sales" style="margin-top: -12px;">Items sold: ${sales }</p>

					<div class="flex-wrap" style="gap: 1rem;">
						<button class="add-to-cart"
							style="margin: 0rem auto 0rem 0rem; padding: 0.7rem 1.25rem; width: 160px;">
							Add to Cart<i class="material-icons">shopping_cart</i>
						</button>
						<sec:authorize access="hasAnyRole('Admin','Staff')">
							<button class="action-btn edit" onclick="window.location.href='/edit-product?pId=${id}'" style="margin: 0rem auto 0rem 0rem; padding: 0.7rem 1.25rem; width: 160px;">
								Edit Details<i class="material-icons">edit</i>
							</button>
						</sec:authorize>
					</div>
				</div>
			</div>
			<div class="product-details">
				<h2 class="name">${name }</h2>
				<p class="desc">${desc }</p>
			</div>
		</div>
	</div>
</main>

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>