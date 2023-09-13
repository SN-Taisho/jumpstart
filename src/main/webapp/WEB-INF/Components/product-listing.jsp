<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="selection-wrapper">
	<button class="default">All Categories</button>
	<c:forEach items="${categories }" var="c">
		<button>${c.name }</button>
	</c:forEach>
</div>

<section class="product-list">

	<c:forEach items="${products }" var="p">
		<div class="product-card">
			<a class="card-img-wrapper"
				href="/product-details?pId=${p.id}"> <img
				alt="${p.photos }" src="${p.photoImagePath }" width="275">
			</a>
			<h3>${p.name }</h3>
			<p class="price">&dollar;&nbsp;${p.price}</p>
			<button class="add-to-cart">
				Add to Cart<i class="material-icons">shopping_cart</i>
			</button>

			<sec:authorize access="hasAnyRole('Admin','Staff')">
				<button class="edit-btn" style="margin: 0rem 1rem 1rem auto;">
					Edit Details<i class="material-icons">edit</i>
				</button>
			</sec:authorize>
		</div>
	</c:forEach>
	
</section>

