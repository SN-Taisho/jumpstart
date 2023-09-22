<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Thank You" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="public justify-center">

	<div class="width-limiter" style="margin-top: 2rem;">
		<div class="pub-card">
		
			<c:if test="${method == 'Delivery' }">
				<img src="graphics/delivery.svg" alt="svg" />
			</c:if>
			
			<c:if test="${method == 'Pickup' }">
				<img src="graphics/pickup.svg" alt="svg" />
			</c:if>
			
			<h3 class="pub-heading confirmation">Payment Success</h3>
			<p class="pub-paragraph text-align-center">${successMsg }</p>
			<a href="/my-purchases" class="pub-link success btnAnimation">View Purchases!</a>
		</div>
	</div>

</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>