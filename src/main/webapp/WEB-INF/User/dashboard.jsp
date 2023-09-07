<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Dashbaord" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">
	
		<h2 class="section-heading hFont text-center">Welcome to Jumpstart !</h2>
		
		<jsp:include page="../Components/product-listing.jsp"></jsp:include>
		
	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>