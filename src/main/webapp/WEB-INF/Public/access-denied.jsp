<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../Components/header.jsp">
	<jsp:param value="Access Denied" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="public justify-center">

	<div class="width-limiter" style="margin-top: 2rem;">
		<div class="pub-card">
			<img src="graphics/access-denied.svg" alt="svg">
			<h3 class="pub-heading danger">Access Denied</h3>
			<p class="pub-paragraph text-align-center">You do not have permission to access this page. Please return to the dashboard</p>
			<a href="/products" class="pub-link btnAnimation">Go Back</a>
		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>