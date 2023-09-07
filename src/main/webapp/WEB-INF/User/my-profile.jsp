<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Product Name" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter align-center flex-col"
		style="margin: 3rem auto 3rem; max-width: 768px; padding: 0rem 2rem;">
		<div class="profile-container">
			<div class="img-wrapper">
				<img alt="Product" src="https://placehold.co/500">
				<div>
					<button id="openEditProfile" class="edit-profile-btn btnAnimation">
						Edit Profile</button>
				</div>
			</div>
			<div class="profile-details">
				<h2 class="name">User full name</h2>
				
				<span class="profile-label"><i class="material-icons">person</i>Username</span>
				<p>username</p>
				
				<span class="profile-label"><i class="material-icons">mail</i>Email</span>
				<p>email@email.com</p>
				
				<span class="profile-label"><i class="material-icons">phone</i>Mobile No.</span>
				<p>09034427823</p>
				
				<span class="profile-label"><i class="material-icons">house</i>Address</span>
				<p>21 Sample St. Sample City</p>
			</div>
		</div>

		<h2 class="section-heading hFont text-center" style="margin-top: 3rem;">Order History</h2>
		
		<div class="item-container" style="width: clamp(250px, 80vw, 500px) !important;">

			<c:forEach begin="1" end="3" varStatus="loop">
				<div class="order-item">
					<div class="oi-details">
						<h3>Order - ${loop.count }</h3>
						<p class="date">Date of purchase: Sept 07, 2023</p>
						<p class="price">&dollar; ${loop.count * 100 }</p>
						<div class="oi-actions">
							<button class="edit">View Order</button>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</main>

<dialog id="editProfileModal" class="modal">

<h3 class="modal-heading">Edit Profile</h3>
<span id="error-text" class="form-error"></span>

<form id="editProfileForm" class="align-center flex-col form"
	method="post" action="update_profile" modelAttribute="user"
	onsubmit="validatedEditProfile(event)">

	<label class="input-group flex-col">Full Name <input
		id="fullname" type="text" required="true" placeholder="e.g. John Doe"
		autocomplete="off" onkeyup="validateFullname()" name="" path=""
		maxlength="50" />
	</label> <label class="input-group flex-col">Email <input id="email"
		type="email" required="true" placeholder="example@email.com"
		autocomplete="off" onkeyup="validateEmail()" name="" path=""
		maxlength="255" />
	</label> <label class="input-group flex-col">Mobile <input id="email"
		type="email" required="true" placeholder="(XX)-(your phone number)"
		autocomplete="off" onkeyup="validateMobile()" name="" path=""
		maxlength="255" />
	</label> <label class="input-group flex-col">Password <input
		id="password" type="password" required="true"
		placeholder="e.g. JohnDoe1" autocomplete="off"
		onkeyup="validatePassword()" name="" path="" maxlength="14" />
	</label>

	<button class="submit-button btnAnimation"
		style="background-color: var(- -success);" type="submit">Save</button>
</form>
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
<jsp:include page="../Components/footer.jsp"></jsp:include>