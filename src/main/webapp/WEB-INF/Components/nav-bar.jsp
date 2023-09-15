<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jumpstart | <%=request.getParameter("HTMLtitle") != null ? request.getParameter("HTMLtitle") : "Jumpstart"%>
</title>


<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;700&family=Montserrat:wght@100;400;500;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/post-login.css">

<link rel="icon" href="assets/Logo.svg" type="image/icon type">

</head>

<body>
	<header id="navbar" class="no-select">

		<div class="width-limiter justify-between">

				<a id="navbarLeft" class="align-center text-deco-none"
					href="/products"> <img src="assets/Logo.svg" alt="Logo"
					width="100">
					<h1 class="hFont">Jumpstart</h1>
				</a>

			<c:if test="${empty hideSearch }">
				<form class="search-form nav flex" action="search" method="get">
					<input class="search-bar" type="search" placeholder="Search"
						name="keyword" value="${keyword}" />
					<button class="search-btn material-icons" type="submit">search</button>
				</form>
			</c:if>

			<ul id="nav-links" class="align-center list-style-none hFont">
				<li><a href="/cart" class="align-center" style="color: var(--secondary);"><i
						class="material-icons" style="margin-right: 0rem;">shopping_cart</i></a></li>
						
				<li><a href="/my-profile" class="alt align-center"><i
						class="material-icons" style="margin-right: 0.5rem;">account_circle</i>Profile</a></li>
			</ul>

			<button
				class="nav-menu-open autohide material-icons btnAnimation align-center justify-center"
				onclick="toggleNavMenu()">menu</button>
		</div>

	</header>

	<nav class="nav-menu">
		<ul class="nav-menu-links">
			<li><a href="/my-profile">Profile</a></li>
			<li><a href="/dashboard">Dashboard</a></li>
			<li><a href="/cart">Cart</a></li>
			<li><a href="/purhcases">Purchases</a></li>
			<li><a href="/purhcases">Search</a></li>
			<form action="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> 
					<input type="submit" name="Logout"
					value="Logout" class="logout-btn" />
			</form>
		</ul>
	</nav>