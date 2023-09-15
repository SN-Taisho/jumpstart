<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Add Product" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<div class="selection-wrapper">
			<button onclick="window.location.href='products'">Product Management</button>
			<button onclick="window.location.href='categories'">Categories</button>
			<button class="default" onclick="window.location.href='add-product'">Add a New Product</button>
			<button>In-store Pickups</button>
			<button>Delivery Orders</button>
		</div>
		
		<section style="background-color: var(--bgDark); border-radius: 5px; margin-bottom: 3rem; padding: 0.5rem;">
			<h3 class="form-heading">Add a Product</h3>

			<sf:form class="flex-col align-center" style="gap: 1rem;"
				method="post" action="add_product" modelAttribute="product" enctype="multipart/form-data">

				<label class="input-group flex-col">Product Name <sf:input
					type="text" required="true" placeholder="Name of the product"
					autocomplete="off" name="name" path="name"/>
				</label>

				<label class="input-group flex-col">Product Description <textarea
						required placeholder="Write someothing about the product" rows="5"
						name="description"></textarea>
				</label>

				<div class="input-group flex-wrap" style="gap: 1rem;">
					<label class="select-label">Category<select class="input-select" name="categoryString" style="margin-left: 5px;" required>
							<option value="" selected disabled hidden="true">Choose here</option>
							<c:forEach items="${categories }" var="category">
								<option value="${category.name}">${category.name}</option>
							</c:forEach>
					</select></label>
					<button id="openNewCategory" class="submit-button" type="button">Create
						New Category</button>
				</div>


				<label class="input-group flex-col" style="margin: 1rem 0rem 2rem;">Initial Amount <sf:input
					type="number" required="true" autocomplete="off" name="stock" path="stock"
					style="width: 200px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" />
				</label>
				
				<label class="input-group flex-col" style="margin: 1rem 0rem 2rem;">&dollar; Price<sf:input
					type="number" step="0.01" required="true" autocomplete="off" name="price" path="price"
					style="width: 200px;" oninput="this.value=parseInt(this.value.replace('.',''))/100"/>
				</label>

				<div class="input-group flex-col">
					<label class="file-input">Upload a Picture (Preferrably 1:1)</label> <input
						required type="file" name="fileImage" id="photo"
						accept="image/png, image/jpeg" />
				</div>
				<div class="image-preview">
					<img id="imgPreview" class="pFont" src="#" alt=""/>
				</div>

				<script>
            $(document).ready(() => {
            	
                $("#photo").change(function () {
                    const file = this.files[0];
                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function (event) {
                            $("#imgPreview")
                              .attr("src", event.target.result);
                        };
                        reader.readAsDataURL(file);
                    }
                });
            });
      	 	</script>

				<div class="justify-between flex-wrap" style="gap: 1rem;">
					<button class="submit-button save btnAnimation" type="submit"
						style="margin: 1rem auto;">Save Changes</button>
					<button class="submit-button cancel btnAnimation" type="button"
						onclick="window.history.back()" style="margin: 1rem auto;">Cancel</button>
				</div>

			</sf:form>
		</section>

	</div>
</main>

<dialog id="newCategoryModal" class="modal">

<h3 class="modal-heading">Create New<br>Category</h3>
<span id="error-text" class="form-error"></span>

<sf:form class="align-center flex-col form"
	method="post" action="create_category" modelAttribute="category">

	<label class="input-group flex-col">Category Name <input
		id="fullname" type="text" required="true" placeholder="e.g. Mice"
		autocomplete="off" name="name" path="name" maxlength="50" />
	</label>

	<label class="input-group flex-col">Description<textarea required="required"
			placeholder="A brief description of the category" rows="3" name="description"
			path="description"></textarea>
	</label>

	<button class="submit-button save btnAnimation" type="submit" style="margin: 0rem auto;">Create</button>
		
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

<jsp:include page="../Components/footer.jsp"></jsp:include>