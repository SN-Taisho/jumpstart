<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<footer class="">

	<div class="width-limiter justify-center flex-col"
		style="padding: 1rem 2rem;">
		<div id="footer-top" class="hFont">
			<a href="home" class="align-center text-deco-none"> <img
				src="assets/Logo.svg" alt="Logo" width="75" />
				<h1>Jumpstart</h1>
			</a>
		</div>

		<div id="footer-mid" class="align-start justify-between">
			<div id="footer-mid-l">

				<ul class="foot-links align-start flex-col list-style-none">
					<h5 class="footer-subheader">Company</h5>
					<li><a href="/about-us">About Us</a></li>
					<li><a href="/contact-us">Contact Us</a></li>
				</ul>

				<sec:authorize access="!isAuthenticated()">
					<ul class="foot-links align-start flex-col list-style-none">
						<h5 class="footer-subheader">Account</h5>
						<li><a href="/login">Login</a></li>
						<li><a href="/signup">Sign Up</a></li>
					</ul>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					
					<sec:authorize access="hasRole('User')">
					<ul class="foot-links align-start flex-col list-style-none">
						<h5 class="footer-subheader">Jumpstart</h5>
						<li><a href="/dashboard">Products</a></li>
						<li><a href="/cart">My Cart</a></li>
						<li><a href="/my-profile">My Profile</a></li>
					</ul>
					</sec:authorize>
					
					<sec:authorize access="hasRole('Staff')">
					<ul class="foot-links align-start flex-col list-style-none">
						<h5 class="footer-subheader">Products</h5>
						<li><a href="/product-management">Manage</a></li>
						<li><a href="/add-product">Add</a></li>
						<li><a href="/in-store-pickups">Pickups</a></li>
						<li><a href="/deliveries">Deliveries</a></li>
					</ul>
					</sec:authorize>
					
				</sec:authorize>


			</div>

			<div id="footer-mid">
				<div id="contact-block" class="align-end flex-col pFont">
					<h5 class="hFont">Contact Us</h5>
					<p>+63 1075693</p>
					<p>jumpstart@gmail.com</p>
					<p>404 Address st. Country</p>
				</div>
			</div>
		</div>

		<div id="footer-bot" class="align-center justify-between pFont">
			<div id="footer-bot-l">
				<p>Zeru&#169;2023</p>
			</div>

			<div id="footer-bot-r" class="align-center">
				<ul id="bot-links" class="align-center list-style-none">
					<li><a href="/privacy-policy">Privacy Policy</a></li>
					<li><a href="/terms-and-conditions">Terms & Conditions</a></li>
				</ul>
			</div>
		</div>
	</div>

</footer>
<script src="js/nav-menu.js"></script>
</body>
</html>