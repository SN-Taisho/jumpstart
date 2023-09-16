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
				<sec:authorize access="hasRole('Admin')">
					<button onclick="window.location.href='user-management'">User-Management</button>
				</sec:authorize>
				<button onclick="window.location.href='products'">Product-Management</button>
				<button class="default" onclick="window.location.href='categories'">Categories</button>
				<button onclick="window.location.href='add-product'">Add a
					New Product</button>
				<button>In-store Pickups</button>
				<button>Delivery Orders</button>
			</div>
		</sec:authorize>


		<table class="res-table small" style="max-width: 922px;">
			<caption>
				Category Managment
				<button id="openNewCategory" class="submit-button" type="button"
					style="margin: 15px 15px 5px;">Create New Category</button>
			</caption>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Category</th>
					<th scope="col">Description</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty categories }">
				<c:forEach items="${categories }" var="c" varStatus="item">
					<tr>
						<td data-label="No.">${item.count }</td>
						<td data-label="Category">${c.name }</td>
						<td data-label="Description">${c.description }</td>
						<td class="actions" data-label="Actions">
							<button id="openEditCategory${item.count }" class="action-btn edit">Edit</button>
							<button id="openDeleteM${item.count }" class="action-btn delete">Delete</button>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty categories }">
					<td colspan="4">
						<h2 class="section-heading text-center" style="color: var(--white);">No Categories Listed</h2>
					</td>
				</c:if>
			</tbody>
		</table>
	</div>
</main>

<dialog id="newCategoryModal" class="modal">

<h3 class="modal-heading">
	Create New<br>Category
</h3>
<span id="error-text" class="form-error"></span> <sf:form
	class="align-center flex-col form" method="post"
	action="create_category" modelAttribute="category">

	<label class="input-group flex-col">Category Name <input
		id="fullname" type="text" required placeholder="e.g. Mice"
		autocomplete="off" name="name" maxlength="50" />
	</label>

	<label class="input-group flex-col">Description<textarea
			required="required" placeholder="A brief description of the category"
			rows="3" name="description"></textarea>
	</label>

	<button class="submit-button save btnAnimation" type="submit"
		style="margin: 0rem auto;">Create</button>

</sf:form>
<button id="closeNewCategory" class="material-icons modal-close">close</button>
</dialog>

<script>
const newCategoryM = document.querySelector("#newCategoryModal");
const openNewCategory = document.querySelector("#openNewCategory");
const closeNewCategory = document.querySelector("#closeNewCategory");

openNewCategory.addEventListener("click", () => {
	newCategoryM.showModal();
	});

closeNewCategory.addEventListener("click", () => {
		newCategoryM.close();
	});
</script>

<c:forEach items="${categories }" var="c" varStatus="item">
	<dialog id="editCategoryModal${item.count }" class="modal" style="height: fit-content;">

	<h3 class="modal-heading">Edit Category</h3>
	<span id="error-text" class="form-error"></span> <sf:form
		class="align-center flex-col form" method="post"
		action="edit_category?cId=${c.id }" modelAttribute="category">

		<label class="input-group flex-col">Category Name <input
			id="fullname" type="text" required placeholder="e.g. Mice"
			autocomplete="off" name="name" maxlength="50" value="${c.name }" />
		</label>

		<label class="input-group flex-col">Description<textarea
				required="required"
				placeholder="A brief description of the category" rows="3"
				name="description">${c.description }</textarea>
		</label>

		<button class="submit-button save btnAnimation" type="submit"
			style="margin: 0rem auto;">Create</button>

	</sf:form>
	<button id="closeEditCategory${item.count }"
		class="material-icons modal-close">close</button>
	</dialog>

	<script>
const editCategoryM${item.count } = document.querySelector("#editCategoryModal${item.count }");
const openEditCategory${item.count } = document.querySelector("#openEditCategory${item.count }");
const closeEditCategory${item.count } = document.querySelector("#closeEditCategory${item.count }");

openEditCategory${item.count }.addEventListener("click", () => {
	editCategoryM${item.count }.showModal();
	});

closeEditCategory${item.count }.addEventListener("click", () => {
		editCategoryM${item.count }.close();
	});
</script>

<dialog id="deleteConfM${item.count }"
		class="modal" style="height: fit-content; margin-top: 25vh;">

	<h3 class="modal-heading">
		Confirm<br>Delete Product?
	</h3>

	<button class="action-btn delete btnAnimation" type="button"
		onclick="window.location.href='delete_category?cId=${c.id}'"
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

<script src="js/success-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>