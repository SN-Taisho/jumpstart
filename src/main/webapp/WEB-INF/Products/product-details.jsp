<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Product Name" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter"
		style="margin: 3rem auto 3rem; max-width: 1024px; padding: 0rem 2rem;">
		<div class="product-details-container">
			<div class="img-wrapper">
				<img alt="Product" src="https://placehold.co/500">
				<div>
					<p class="stock">Items left in stock: x</p>
					<h3 class="price">&dollar; 450</h3>

					<button class="add-to-cart" style="margin: 0rem auto 0rem 0rem; padding: 0.7rem 1.25rem; width: 160px;">
						Add to Cart<i class="material-icons">shopping_cart</i>
					</button>
				</div>
			</div>
			<div class="product-details">
				<h2 class="name">Product Name</h2>
				<p class="desc">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi
					repudiandae consequuntur voluptatum laborum numquam blanditiis
					harum quisquam eius sed odit fugiat iusto fuga praesentium optio,
					eaque rerum! Provident similique accusantium nemo autem. Veritatis
					obcaecati tenetur iure eius earum ut molestias architecto voluptate
					aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt
					quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas
					aliquid.</p>
			</div>
		</div>
	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>