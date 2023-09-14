<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="!isAuthenticated()">
	<jsp:include page="../Components/header.jsp">
		<jsp:param value="Terms and Conditions" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<jsp:include page="../Components/nav-bar.jsp">
		<jsp:param value="Terms and Conditions" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>

<div class="page-divider"></div>

<main>

	<div class="width-limiter justify-center" style="margin-top: 3rem;">
		<div class="pub-card" style="align-items: start;">
			<span class="pub-date">Last Updated: September 7, 2023</span>
			<h3 class="pub-heading">Terms and Conditions</h3>

			<p class="pub-paragraph">These terms and conditions apply to the
				use of our website. By using Jumpstart, you agree to these terms and
				conditions. If you do not agree to these terms and conditions, you
				should not use our Jumpstart.</p>

			<hr class="divider" style="margin-bottom: 1rem;">

			<h4 class="pub-subheading">Intellectual Property Rights</h4>
			<p class="pub-paragraph">All content on Jumpstart is protected by
				copyright and trademark law. You may use our content for personal,
				non-commercial purposes only. You may not use our content for any
				other purpose without our express written consent.</p>

			<hr class="divider" style="margin-bottom: 1rem;">

			<h4 class="pub-subheading">Order Acceptance and Cancellation</h4>
			<p class="pub-paragraph">We reserve the right to accept or reject
				any order placed on Jumpstart. If we reject an order, we will notify
				you as soon as possible.</p>

			<hr class="divider" style="margin-bottom: 1rem;">

			<h4 class="pub-subheading">Warranty Disclaimer</h4>
			<p class="pub-paragraph">We do not provide any warranties for the
				products sold on our website. However, we provide warranties for
				items bought via in-store pickups.</p>

			<hr class="divider" style="margin-bottom: 1rem;">

			<h4 class="pub-subheading">Indemnification</h4>
			<p class="pub-paragraph">YYou agree to indemnify us for any
				damages that may arise from your use of our website.</p>

		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>