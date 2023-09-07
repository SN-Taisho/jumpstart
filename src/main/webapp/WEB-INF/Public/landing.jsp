<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../Components/header.jsp">
	<jsp:param value="Home" name="HTMLtitle" />
</jsp:include>

	<main>
		<div class="width-limiter">
			<div id="landing-display" class="no-select">
				<div id="banner-text" class="pFont text-center">
					<h1>Jumpstart</h1>
					<p>Made by Enthusiasts, For Enthusiasts</p>
					<button id="banner-button" class="align-center justify-between">
						Shop Now<i class="material-icons">shopping_cart</i>
					</button>
				</div>
				<img alt="bannerImage" src="assets/banner.jpg">
			</div>
			
			<h2 class="section-heading hFont text-center">What's new?</h2>
			
			<div id="landing-content" class="no-select">
				<div class="content-row">
					<img alt="content" src="assets/1.png" height="720">
				</div>
				
				<div class="content-row">
					<img alt="content" src="assets/2.png" height="720">
				</div>
				
				<div class="content-row">
					<img alt="content" src="assets/3.png" height="720">
				</div>
			</div>


		</div>
	</main>
	
<jsp:include page="../Components/footer.jsp"></jsp:include>