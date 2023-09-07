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
<link
	href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;700&family=Montserrat:wght@100;400;500;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/styles.css">

<link rel="icon" href="assets/Logo.svg" type="image/icon type">

</head>

<body>

	<header id="navbar" class="no-select">

		<div class="width-limiter justify-between">
			<a id="navbarLeft" class="align-center text-deco-none" href="/home">
				<img src="assets/Logo.svg" alt="Logo" width="100">
				<h1 class="hFont">Jumpstart</h1>
			</a>

			<ul id="nav-links" class="align-center list-style-none hFont">
				<li><a href="/login">Log In</a></li>
				<li><a href="/signup" class="alt">Sign Up</a></li>
			</ul>

			<button class="nav-menu-open autohide material-icons btnAnimation align-center justify-center"
				onclick="toggleNavMenu()">menu</button>
		</div>

	</header>

	<nav class="nav-menu">
		<ul class="nav-menu-links">
			<li><a href="/home">Home</a></li>
			<li><a href="/login">Log In</a></li>
			<li><a href="/signup">Sign Up</a></li>
	</nav>