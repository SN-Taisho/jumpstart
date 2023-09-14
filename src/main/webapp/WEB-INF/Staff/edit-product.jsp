<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<c:forEach items="${product}" var="p">
	<c:set var="id" value="${p.id}"></c:set>
	<c:set var="name" value="${p.name}"></c:set>
	<c:set var="desc" value="${p.description}"></c:set>
	<c:set var="currentCategory" value="${p.getCategory().getName()}"></c:set>
	<c:set var="price" value="${p.price}"></c:set>
	<c:set var="stock" value="${p.stock}"></c:set>
	<c:set var="sales" value="${p.sales}"></c:set>
</c:forEach>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Add Product" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<div class="selection-wrapper">
			<button onclick="window.location.href='product-management'">Product-Management</button>
			<button onclick="window.location.href='add-product'">Add a New Product</button>
			<button>In-store Pickups</button>
			<button>Delivery Orders</button>
		</div>
		
		<section style="background-color: var(--bgDark); border-radius: 5px; margin-bottom: 3rem; padding: 0.5rem;">
			<h3 class="form-heading">Edit Product Information</h3>

			<sf:form class="flex-col align-center" style="gap: 1rem;"
				method="post" action="edit_product?pId=${id }" modelAttribute="product">

				<label class="input-group flex-col">Product Name <input
					type="text" required placeholder="Name of the product"
					autocomplete="off" name="name" value="${name }"/>
				</label>

				<label class="input-group flex-col">Product Description <textarea
						required placeholder="Write someothing about the product" rows="5"
						name="description">${desc }</textarea>
				</label>

				<div class="input-group flex-wrap" style="gap: 1rem;">
					<label class="select-label">Category<select class="input-select" name="categoryString" style="margin-left: 5px;" required>
					
							<c:forEach items="${categories }" var="category">
								
								<c:if test="${currentCategory eq category.name }">
									<option value="${currentCategory }" selected>${currentCategory }</option>
								</c:if>
								<c:if test="${currentCategory ne category.name }">
									<option value="${category.name}">${category.name}</option>
								</c:if>
								
								
							</c:forEach>
							
					</select></label>
				</div>

				<label class="input-group flex-col" style="margin: 1rem 0rem 2rem;">Amount in stock<input
					type="number" required autocomplete="off" name="stock" value="${stock }"
					style="width: 200px;"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
				</label>
				
				<label class="input-group flex-col" style="margin: 1rem 0rem 2rem;">Price (USD) <input
					type="number" required autocomplete="off" name="price" value="${price }"
					style="width: 200px;"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
				</label>

				<div class="justify-between flex-wrap" style="gap: 1rem;">
					<button class="submit-button save btnAnimation" type="submit"
					style="margin: 1rem auto;">Save Changes</button>
					<button class="submit-button cancel btnAnimation" type="button" onclick="window.history.back()"
					style="margin: 1rem auto;">Cancel</button>
				</div>

			</sf:form>
		</section>

	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>