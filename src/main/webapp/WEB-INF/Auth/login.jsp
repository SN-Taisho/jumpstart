<jsp:include page="../Components/header.jsp">
	<jsp:param value="Sign Up" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center"
	style="min-height: 95vh;">
	<div class="width-limiter">
		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/login.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">Log In</h3>
				<span id="error-text" class="form-error">${error_msg}</span>
				<form id="registrationForm" class="form-card" autocomplete="off">

					<label class="input-group flex-col">Username <input
						id="username" type="text" required="true"
						placeholder="e.g. JohnDoe01" autocomplete="off"
						onkeyup="validateUsername()" name="" path="" maxlength="16" />
					</label> <label class="input-group flex-col">Password <input
						id="password" type="password" required="true"
						placeholder="e.g. JohnDoe1" autocomplete="off"
						onkeyup="validatePassword()" name="" path="" maxlength="14" />
					</label>

					<button class="submit-button" type="submit" value="login">Log
						In</button>

					<hr class="divider">

					<a class="alt-form-link trans-ease-out" href="/signup"
						style="margin-bottom: 1rem;">Dont have an account?</a>
				</form>
			</section>
		</div>
	</div>
</main>

<jsp:include page="../Components/footer.jsp"></jsp:include>