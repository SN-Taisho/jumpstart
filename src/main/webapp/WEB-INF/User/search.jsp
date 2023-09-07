<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<form class="search-form mobile flex" style="margin: 1rem auto; width: 80%;" action="search" method="get">
			<input class="search-bar" type="search" placeholder="Search"
				name="keyword" value="${keyword}" />
			<button class="search-btn material-icons" type="submit">search</button>
		</form>

		<jsp:include page="../Components/product-listing.jsp"></jsp:include>

	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>