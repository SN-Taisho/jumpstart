<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<c:forEach items="${user }" var="u">
	<c:set var="fullname" value="${u.fullname }"></c:set>
	<c:set var="username" value="${u.username }"></c:set>
	<c:set var="email" value="${u.email }"></c:set>
	<c:set var="mobile" value="${u.mobile }"></c:set>
	<c:set var="address" value="${u.address }"></c:set>
</c:forEach>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Product Name" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter align-center flex-col"
		style="margin: 3rem auto 3rem; max-width: 768px; padding: 0rem 2rem;">
		
		<div class="profile-container">
			<div class="img-wrapper">
				<img alt="Product" src="assets/Profile.png">
				<div>
					<button id="openEditProfile" class="edit-profile-btn btnAnimation">
						Edit Profile</button>
				</div>
			</div>
			<div class="profile-details">
				<h2 class="name">${fullname }</h2>
				
				<span class="profile-label"><i class="material-icons">person</i>Username</span>
				<p>${username }</p>
				
				<span class="profile-label"><i class="material-icons">mail</i>Email</span>
				<p>${email }</p>
				
				<span class="profile-label"><i class="material-icons">phone</i>Mobile No.</span>
				
				<c:if test="${mobile eq null }"><p>User hasn't given a mobile number yet.</p></c:if>
				<p>${mobile }</p>
				
				<span class="profile-label"><i class="material-icons">house</i>Address</span>
				<c:if test="${address eq null }"><p>User provided an address yet.</p></c:if>
				<p>${address }</p>
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

<sf:form id="editProfileForm" class="align-center flex-col form"
	method="post" action="update_profile" modelAttribute="user"
	onsubmit="validatedEditProfile(event)">

	<label class="input-group flex-col">Full Name <input
		id="fullname" type="text" required="true" placeholder="e.g. John Doe"
		autocomplete="off" onkeyup="validateFullname()" name="fullname" path="fullname" value="${fullname }"
		maxlength="50" />
	</label> 
	
	<label class="input-group flex-col">Email <input id="email"
		type="email" required="true" placeholder="example@email.com"
		autocomplete="off" onkeyup="validateEmail()" name="email" path="email" value="${email }"
		maxlength="255" />
	</label> 
	
	<label class="input-group flex-col">Mobile <input id="Mobile"
		type="text" required="true" placeholder="(XX)-(your phone number)"
		autocomplete="off" name="mobile" path="mobile" value="${mobile }"
		maxlength="15" />
	</label>
	
	<label class="input-group flex-col">Address<textarea required="required"
			placeholder="Your physical address" rows="3" name="address"
			path="address">${address }</textarea>
	</label>

	<button class="submit-button btnAnimation"
		style="background-color: var(--success);" type="submit">Save</button>
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