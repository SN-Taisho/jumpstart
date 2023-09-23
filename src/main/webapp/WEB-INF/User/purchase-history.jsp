<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Pickups" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<link rel="stylesheet" href="css/table.css">

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<form class="search-form page flex" action="purchase-history" method="get">
				<input class="search-bar" type="search" placeholder="Search User or Reference Code"
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
							<td data-label="Product">${p.getProduct().getName() }</td>
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

<c:if test="${not empty purchases }">
	<c:forEach items="${purchases }" var="p" varStatus="item">
		<dialog id="viewUserModel${item.count}" class="modal">

		<h3 class="modal-heading">User Info</h3>
		<span id="error-text" class="form-error"></span>
		<form class="align-center flex-col form">

			<label class="input-group flex-col">Full Name <input
				type="text" autocomplete="off" value="${p.getUser().getFullname() }"
				maxlength="50" readonly="readonly" />
			</label> 
			<label class="input-group flex-col">Email <input
				type="email" value="${p.getUser().getEmail() }" maxlength="255"
				readonly="readonly" />
			</label> 
			<label class="input-group flex-col">Mobile <input
				type="text" value="${p.getUser().getMobile() }" maxlength="15"
				readonly="readonly" />
			</label> 
			<label class="input-group flex-col">Address<textarea
					rows="4" readonly="readonly">${p.getUser().getAddress() }</textarea>
			</label>

		</form>
		<button id="closeViewUser${item.count}"
			class="material-icons modal-close">close</button>
		</dialog>

		<script>
const editUserM${item.count } = document.querySelector("#viewUserModel${item.count}");
const openViewUser${item.count} = document.querySelector("#openViewUser${item.count}");
const closeViewUser${item.count} = document.querySelector("#closeViewUser${item.count}");

openViewUser${item.count}.addEventListener("click", () => {
	editUserM${item.count }.showModal();
	});

closeViewUser${item.count}.addEventListener("click", () => {
		editUserM${item.count }.close();
	});
</script>

		<dialog id="confirmPickupM${item.count}" class="modal"
			style="height: fit-content;">

		<h3 class="modal-heading">
			Confirm<br>Pickup?
		</h3>

		<button class="action-btn approve btnAnimation" type="button"
			onclick="window.location.href='pickup_received?pickupId=${p.id}&search=${search }'"
			style="margin: 1.5rem auto 0.5rem;">Confirm Pickup</button>

		<button id="closePickupM${item.count}"
			class="material-icons modal-close">close</button>
		</dialog>

		<script>
const confirmPickupM${item.count} = document.querySelector("#confirmPickupM${item.count}");
const openPickupM${item.count} = document.querySelector("#openPickupM${item.count}");
const closePickupM${item.count} = document.querySelector("#closePickupM${item.count}");

openPickupM${item.count}.addEventListener("click", () => {
	confirmPickupM${item.count}.showModal();
	});

closePickupM${item.count}.addEventListener("click", () => {
	confirmPickupM${item.count}.close();
	});
</script>
	</c:forEach>
</c:if>
<jsp:include page="../Components/footer.jsp"></jsp:include>