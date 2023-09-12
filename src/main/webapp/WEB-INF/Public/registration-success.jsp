<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../Components/header.jsp">
	<jsp:param value="Thank You" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="public justify-center">

	<div class="width-limiter" style="margin-top: 2rem;">
		<div class="pub-card">
			<img src="graphics/registration-success.svg" alt="svg">
			<h3 class="pub-heading confirmation">Registration Success</h3>
			<p class="pub-paragraph text-align-center">Your account has been
				successfully registered, you may now use your credentials to log in.</p>
			<a href="/login" class="pub-link success btnAnimation">Login Now!</a>
		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>