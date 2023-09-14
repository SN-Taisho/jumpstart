<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="!isAuthenticated()">
	<jsp:include page="../Components/header.jsp">
		<jsp:param value="Contact Us" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<jsp:include page="../Components/nav-bar.jsp">
		<jsp:param value="Contact Us" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>

<div class="page-divider"></div>

<main>

	<div class="width-limiter justify-center" style="margin-top: 3rem;">
		<div class="pub-card">
			<h3 class="pub-heading">Contact Us</h3>
			<img src="graphics/contact-us.svg" alt="svg">
			<div id="contactContainer" class="justify-evenly flex-wrap">
				<div class="contact-card">
					<h4 class="pub-subheading">Email</h4>
					<p class="pub-paragraph">jumpstart@gmail.com</p>
				</div>
				<div class="contact-card">
					<h4 class="pub-subheading">Telephone</h4>
					<p class="pub-paragraph">+63 344-3306</p>
				</div>
				<div class="contact-card">
					<h4 class="pub-subheading">Address</h4>
					<p class="pub-paragraph">145 Tori Lane, Pasig, Metro Manila,
						Philippines</p>
				</div>
			</div>
		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>