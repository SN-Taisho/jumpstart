<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
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
		
		<div class="justify-center flex-col error-popup">
			<div class="justify-between">
				<span class="material-icons">error</span>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>
			<p id="error-text" class="pFont text-center">${errorMsg }</p>
		</div>

		<sec:authorize access="hasAnyRole('Admin','Staff')">
			<div class="selection-wrapper">
				<button onclick="window.location.href='products'">Product-Management</button>
				<button onclick="window.location.href='categories'">Categories</button>
				<button onclick="window.location.href='add-product'">Add a
					New Product</button>
				<button>In-store Pickups</button>
				<button>Delivery Orders</button>
			</div>
		</sec:authorize>

		<h2 class="section-heading text-center">Filter Search Results</h2>
		
		<div class="selection-wrapper">
			<c:if test="${empty selectedCateg }">
				<button class="default" onclick="window.location.href='search?keyword=${keyword }'">All
					Categories</button>
			</c:if>

			<c:if test="${not empty selectedCateg }">
				<button onclick="window.location.href='search?keyword=${keyword }'">All
					Categories</button>
			</c:if>

			<c:forEach items="${categories }" var="c">
				<c:if test="${selectedCateg eq c.name}">
					<button class="default"
						onclick="window.location.href='search?category=${c.name}&keyword=${keyword }'">${c.name }</button>
				</c:if>
				<c:if test="${selectedCateg ne c.name}">
					<button
						onclick="window.location.href='search?category=${c.name}&keyword=${keyword }'">${c.name }</button>
				</c:if>
			</c:forEach>
		</div>
		
		<form class="search-form page flex" action="search" method="get">
				<input class="search-bar" type="search" placeholder="Search"
					name="keyword" value="${keyword}" />
				<button class="search-btn material-icons" type="submit">search</button>
		</form>
		

		<section class="product-list">

			<c:forEach items="${products }" var="p">
				<c:if test="${p.stock > 0}">
					<div class="product-card">
						<a class="card-img-wrapper" href="/product-details?pId=${p.id}">
							<img alt="${p.photos }" src="${p.photoImagePath }" width="275">
						</a>
						<h3>${p.name }</h3>
						<p class="price">&dollar;&nbsp;${p.price}</p>
						<p class="sales">Items sold: ${p.sales }</p>
						
						<sec:authorize access="hasAnyRole('Admin','Staff')">
						<p class="sales">Items in-stock: ${p.stock }</p>
						</sec:authorize>
						
						<sec:authorize access="hasRole('User')">
						<sf:form action="add_to_cart" method="post" modelAttribute="product" target="dummyframe">
							<button class="add-to-cart" type="submit" name="id" value="${p.id }" onclick="addToCart()">
							Add to Cart<i class="material-icons">shopping_cart</i>
						</button>
						</sf:form>
						</sec:authorize>

						<sec:authorize access="hasAnyRole('Admin','Staff')">
							<button class="action-btn edit"
								style="margin: 0rem 1rem 1rem auto;"
								onclick="window.location.href='edit-product?pId=${p.id}'">
								Edit Details<i class="material-icons">edit</i>
							</button>
							<button class="action-btn delete"
								style="margin: 0rem 1rem 1rem auto;"
								onclick="window.location.href='delete_product?pId=${p.id}'">
								Delete<i class="material-icons">delete</i>
							</button>
						</sec:authorize>
					</div>
				</c:if>
			</c:forEach>

		</section>
		<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>
	</div>
</main>

<script src="js/success-popup.js"></script>
<script src="js/error-popup.js"></script>
<script src="js/cart-shake.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>