<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Products" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<link rel="stylesheet" href="css/table.css">

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<div class="align-center success-popup">
			<span class="material-icons">done</span>
			<p id="error-text" class="pFont success-text">${successMsg }</p>
			<button class="btnAnimation icon material-icons"
				onclick="closeSuccess()">close</button>
		</div>

		<sec:authorize access="hasAnyRole('Admin','Staff')">
			<div class="selection-wrapper">
				<button class="default" onclick="window.location.href='user-management'">User-Management</button>
				<button onclick="window.location.href='products'">Product-Management</button>
				<button onclick="window.location.href='categories'">Categories</button>
				<button onclick="window.location.href='add-product'">Add a
					New Product</button>
				<button>In-store Pickups</button>
				<button>Delivery Orders</button>
			</div>
		</sec:authorize>

		<table class="res-table wide" style="max-width: 1440px;">
			<caption>User Managment</caption>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Fullname</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Role</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users }" var="u" varStatus="item">
					<tr>
						<td data-label="No.">${item.count }</td>
						<td data-label="Fullname">${u.fullname }</td>
						<td data-label="Username">${u.username }</td>
						<td data-label="Email">${u.email }</td>
						<td class="roles" data-label="Role">
							<sf:form class="role-form" onsubmit="saveAnimation${item.count}()"
								action="/reassign_user?username=${u.username }" method="post" target="dummyframe">
								
								<select class="input-select" name="roleString"
									style="margin-left: 5px;" required>
									
									<c:forEach items="${u.roles}" var="userRole">
										<c:set var="thisUserRole" value="${userRole.name }"></c:set>
									</c:forEach>
									
									<c:forEach items="${allRoles }" var="r">
										<c:if test="${thisUserRole eq r.name }">
											<option value="${thisUserRole }" selected>${thisUserRole }</option>
										</c:if>
										<c:if test="${thisUserRole ne r.name }">
											<option value="${r.name}">${r.name}</option>
										</c:if>
									</c:forEach>

								</select>
								<button id="roleSaveBtn${item.count }" class="action-btn edit" type="submit"><i class="material-icons">save</i></button>
								
							</sf:form>
							<script type="text/javascript">
								function saveAnimation${item.count}() {
									$('#roleSaveBtn${item.count }').addClass('saved');
									setTimeout(function() {
										$('#roleSaveBtn${item.count }').removeClass('saved')
									}, 500);
								}
							</script>
						</td>
						<td class="actions" data-label="Actions">
							<button id="openEditUser${item.count }" class="action-btn edit"><i class="material-icons">edit</i></button>
							<button id="openDeleteM${item.count }" class="action-btn delete"><i class="material-icons">delete</i></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</main>

<c:forEach items="${users }" var="u" varStatus="item">
	<dialog id="editUserModal${item.count }" class="modal">

	<h3 class="modal-heading">Edit User<br>Information</h3>
	<span id="error-text" class="form-error"></span> <sf:form
		class="align-center flex-col form" method="post"
		action="edit_user_info?username=${u.username }" modelAttribute="user">

		<label class="input-group flex-col">Full Name <input
		id="fullname" type="text" required placeholder="e.g. John Doe"
		autocomplete="off" onkeyup="validateFullname()" name="fullname" path="fullname" value="${u.fullname }"
		maxlength="50" />
	</label> 
	
	<label class="input-group flex-col">Email <input id="email"
		type="email" required placeholder="example@email.com"
		autocomplete="off" onkeyup="validateEmail()" name="email" value="${u.email }"
		maxlength="255" />
	</label> 
	
	<label class="input-group flex-col">Mobile <input id="Mobile"
		type="text" required placeholder="(XX)-(your phone number)"
		autocomplete="off" name="mobile" value="${u.mobile }"
		maxlength="15" />
	</label>
	
	<label class="input-group flex-col">Address<textarea required="required"
			placeholder="Your physical address" rows="3" name="address"
			path="address">${u.address }</textarea>
	</label>

		<button class="submit-button save btnAnimation" type="submit"
			style="margin: 0rem auto;">Save</button>

	</sf:form>
	<button id="closeEditUser${item.count }"
		class="material-icons modal-close">close</button>
	</dialog>

	<script>
const editUserM${item.count } = document.querySelector("#editUserModal${item.count }");
const openEditUser${item.count } = document.querySelector("#openEditUser${item.count }");
const closeEditUser${item.count } = document.querySelector("#closeEditUser${item.count }");

openEditUser${item.count }.addEventListener("click", () => {
	editUserM${item.count }.showModal();
	});

closeEditUser${item.count }.addEventListener("click", () => {
		editUserM${item.count }.close();
	});
</script>

	<dialog id="deleteConfM${item.count }"
		class="modal" style="height: fit-content;">

	<h3 class="modal-heading">
		Confirm<br>Delete User?
	</h3>

	<button class="action-btn delete btnAnimation" type="button"
		onclick="window.location.href='delete_user?uId=${u.id}'"
		style="margin: 1.5rem auto 0.5rem;">Delete</button>

	<button id="closeDeleteM${item.count }"
		class="material-icons modal-close">close</button>
	</dialog>

	<script>
const deleteConfM${item.count } = document.querySelector("#deleteConfM${item.count }");
const openDeleteM${item.count } = document.querySelector("#openDeleteM${item.count }");
const closeDeleteM${item.count } = document.querySelector("#closeDeleteM${item.count }");

openDeleteM${item.count }.addEventListener("click", () => {
	deleteConfM${item.count }.showModal();
	});

closeDeleteM${item.count }.addEventListener("click", () => {
	deleteConfM${item.count }.close();
	});
</script>
</c:forEach>

<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>