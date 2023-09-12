<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../Components/header.jsp">
	<jsp:param value="Password Changed" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="public justify-center">

	<div class="width-limiter" style="margin-top: 2rem;">
		<div class="pub-card">
			<img src="graphics/password-changed.svg" alt="svg">
			<h3 class="pub-heading confirmation">Password Changed</h3>
			<p class="pub-paragraph text-align-center">Your password has been successfully changed, you may now use your new password to log in.</p>
			<a href="/login" class="pub-link success btnAnimation">Login Now!</a>
		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>