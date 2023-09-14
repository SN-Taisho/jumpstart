<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Dashbaord" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<h2 class="section-heading hFont text-center">Welcome to
			Jumpstart !</h2>

		<div class="selection-wrapper">
			<button class="default">All Categories</button>
			<c:forEach items="${categories }" var="c">
				<button>${c.name }</button>
			</c:forEach>
		</div>

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

						<button class="add-to-cart">
							Add to Cart<i class="material-icons">shopping_cart</i>
						</button>
					</div>
				</c:if>
			</c:forEach>

		</section>

	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>