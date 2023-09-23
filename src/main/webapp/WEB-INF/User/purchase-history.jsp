<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Purchase History" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<link rel="stylesheet" href="css/table.css">

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<form class="search-form page flex" action="purchase-history" method="get">
				<input class="search-bar" type="search" placeholder="Search Product or Reference Code"
					name="search" value="${search}" />
				<button class="search-btn material-icons" type="submit">search</button>
		</form>
		
		<table class="res-table wide" style="max-width: 1440px;">
			<caption>Purchase Hisotry</caption>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Reference Code</th>
					<th scope="col">Photo</th>
					<th scope="col">Product</th>
					<th scope="col">Count</th>
					<th scope="col">Price</th>
					<th scope="col">Date Ordered</th>
					<th scope="col">Date Received</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty purchases }">
					<c:forEach items="${purchases }" var="p" varStatus="item">
						<tr>
							<td data-label="No.">${item.count }</td>
							<td data-label="Reference Code">${p.reference }</td>
							<td data-label="Photo" class="table-photo">
								<div class="image-wrapper">
									<img alt="${p.getProduct().getPhotos() }"
										src="${p.getProduct().getPhotoImagePath() }" width="75">
								</div>
							</td>
							<td data-label="Product"><a href="product-details?pId=${p.getProduct().getId() }">${p.getProduct().getName() }</a></td>
							<td data-label="Count">${p.count }</td>
							<td data-label="Price"><p style="color: var(--accent);">&dollar; ${p.getProduct().getPrice() * p.count}</p></td>
							<td data-label="Date Ordered">${p.ordered }</td>
							<td data-label="Date Received">${p.received }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty purchases }">
					<td colspan="8">
						<h2 class="section-heading text-center" style="color: var(--white);">No Order Found</h2>
					</td>
				</c:if>
			</tbody>
		</table>
	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>