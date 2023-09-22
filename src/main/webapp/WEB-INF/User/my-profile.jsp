<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="My Profile" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter align-center flex-col"
		style="margin: 3rem auto 3rem; max-width: 768px; padding: 0rem 2rem;">
		
		<div class="profile-container">
			<div class="img-wrapper">
				<img alt="Product" src="assets/Profile.png">
				<div>
					<button id="openEditProfile" class="action-btn edit btnAnimation" style="margin-bottom: 2rem;">
						Edit Profile</button>
					<form class="justify-center" action="logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" name="Logout"
							value="Logout" class="logout-btn"/>
					</form>
				</div>
			</div>
			<div class="profile-details">
				<h2 class="name">${user.fullname }</h2>
				
				<span class="profile-label"><i class="material-icons">person</i>Username</span>
				<p>${user.username }</p>
				
				<span class="profile-label"><i class="material-icons">mail</i>Email</span>
				<p>${user.email }</p>
				
				<span class="profile-label"><i class="material-icons">phone</i>Mobile No.</span>
				
				<c:if test="${user.mobile eq null }"><p>User hasn't given a mobile number yet.</p></c:if>
				<p>${user.mobile }</p>
				
				<span class="profile-label"><i class="material-icons">house</i>Address</span>
				<c:if test="${user.address eq null }"><p>User provided an address yet.</p></c:if>
				<p>${user.address }</p>

				<button class="action-btn" style="background-color: var(--accent);"
					onclick="window.location.href='ongoing-purchases'">
					Ongoing Purchases<i class="material-icons"
						style="margin-left: 5px;">pending</i>
				</button>
				<button class="action-btn" style="background-color: var(--accent);"
					onclick="window.location.href='purchase-history'">
					View Purchase History<i class="material-icons"
						style="margin-left: 5px;">history</i>
				</button>
			</div>
		</div>

		<h2 class="section-heading hFont text-center" style="margin-top: 3rem;">Recent Purchases</h2>
		
		<div class="item-container" style="width: clamp(250px, 80vw, 500px) !important;">

			<c:forEach var="p" items="${recentPurchases }">
				<div class="order-item">
					<div class="oi-details">
						<a href="/product-details?pId=${p.getProduct().getId() }">
							<h3>${p.getProduct().getName() }</h3>
						</a>
						<p>Date of purchase: ${p.ordered }</p>
						<p class="price">&dollar; ${p.getProduct().getPrice() * p.count}</p>
						<%-- <div class="oi-actions">
							<button class="edit" onclick="window.location.href='purchase-details?pId=${p.id}'">View Order</button>
						</div> --%>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</main>

<dialog id="editProfileModal" class="modal">

<h3 class="modal-heading">Edit Profile</h3>
<span id="error-text" class="form-error"></span>

<sf:form id="editProfileForm" class="align-center flex-col form"
	method="post" action="update_profile" modelAttribute="user"
	onsubmit="validatedEditProfile(event)">

	<label class="input-group flex-col">Full Name <input
		id="fullname" type="text" required="true" placeholder="e.g. John Doe"
		autocomplete="off" onkeyup="validateFullname()" name="fullname" path="fullname" value="${user.fullname }"
		maxlength="50" />
	</label> 
	
	<label class="input-group flex-col">Email <input id="email"
		type="email" required="true" placeholder="example@email.com"
		autocomplete="off" onkeyup="validateEmail()" name="email" path="email" value="${user.email }"
		maxlength="255" />
	</label> 
	
	<label class="input-group flex-col">Mobile <input id="Mobile"
		type="text" required="true" placeholder="(XX)-(your phone number)"
		autocomplete="off" name="mobile" path="mobile" value="${user.mobile }"
		maxlength="15" />
	</label>
	
	<label class="input-group flex-col">Address<textarea required="required"
			placeholder="Your physical address" rows="3" name="address"
			path="address">${user.address }</textarea>
	</label>

	<button class="submit-button save btnAnimation" type="submit" style="margin: 0rem auto;">Save</button>
		
</sf:form>
<button id="closeEditProfile" class="material-icons modal-close">close</button>
</dialog>

<script>
const editProfileM = document.querySelector("#editProfileModal");
const openEditProfile = document.querySelector("#openEditProfile");
const closeEditProfile = document.querySelector("#closeEditProfile");

openEditProfile.addEventListener("click", () => {
	editProfileM.showModal();
	});

closeEditProfile.addEventListener("click", () => {
		editProfileM.close();
	});
</script>

<script src="js/validation.js"></script>
<script src="js/error-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>