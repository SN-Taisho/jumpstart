<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="!isAuthenticated()">
	<jsp:include page="../Components/header.jsp">
		<jsp:param value="About Us" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<jsp:include page="../Components/nav-bar.jsp">
		<jsp:param value="About Us" name="HTMLtitle" />
	</jsp:include>
</sec:authorize>


<div class="page-divider"></div>

<main>

	<div class="width-limiter justify-center" style="margin-top: 3rem;">
		<div class="pub-card">
		<h3 class="pub-heading">About Us</h3>
			<img src="graphics/about-us.svg" alt="svg">
			<p class="pub-paragraph">
				ABC Job Portal is a website where you can browse through hundreds of
				job posts from top companies and apply for your dream job with just
				a few clicks.<br> <br>Don't miss this chance and join ABC
				Job Portal today!
			</p>
			<a href="/signup" class="pub-link">Shop Now!</a>
	</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>