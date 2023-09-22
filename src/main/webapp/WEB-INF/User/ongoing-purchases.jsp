<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Ongoing Purchases" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter align-center flex-col"
		style="max-width: 768px; padding: 2rem 0rem 2rem;">
		
		<div class="item-container" style="margin-bottom: 3rem; width: clamp(250px, 80vw, 500px) !important;">
		
			<c:if test="${not empty ongoingPurchases }">
				<h2 class="section-heading hFont text-center">Ongoing Purchases</h2>
				<c:forEach var="p" items="${ongoingPurchases }">
					<div class="order-item">
						<div class="image-wrapper">
							<a href="/product-details?pId=${p.getProduct().getId() }">
							<img src="${p.getProduct().getPhotoImagePath() }" alt="${p.getProduct().getPhotos() }" width="150">
						</a>
						</div>
						<div class="oi-details">
							<h3>${p.getProduct().getName() } &times; ${p.count }</h3>
							<p>${p.ordered }</p>
							<p class="price">${p.method }</p>
							<p>Reference Code: ${p.reference }</p>
							<p class="price">&dollar; ${p.getProduct().getPrice() * p.count}</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty ongoingPurchases }">
				<div class="flex-col align-center"
					style="background-color: var(- -secondary); border-radius: 10px; padding-bottom: 1.5rem;">
					<h2 class="section-heading text-center"
						style="color: var(- -white);">No Ongoing Purchases</h2>
					<button class="submit-button" type="button"
						onclick="window.location.href='products'">Shop Now!</button>
				</div>
			</c:if>


		</div>

	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>