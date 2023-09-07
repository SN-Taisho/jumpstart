<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="category-selection">
	<button class="default">All Categories</button>
	<c:forEach begin="1" end="5" varStatus="loop">
		<button>Category-${loop.count }</button>
	</c:forEach>
</div>

<section class="product-list">
	<c:forEach begin="1" end="12" varStatus="loop">
		<div class="product-card">
			<a class="card-img-wrapper"
				href="/product-details?pId=${loop.count }"> <img
				alt="Card Photo" src="https://placehold.co/300" width="275">
			</a>
			<h3>Product - ${loop.count }</h3>
			<p class="price">&dollar;${loop.count * 100}</p>
			<button class="add-to-cart">
				Add to Cart<i class="material-icons">shopping_cart</i>
			</button>
		</div>
	</c:forEach>
</section>

