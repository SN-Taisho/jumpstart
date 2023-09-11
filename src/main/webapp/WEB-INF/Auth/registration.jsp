<jsp:include page="../Components/header.jsp">
	<jsp:param value="Sign Up" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center"
	style="min-height: 95vh;">
	<div class="width-limiter">
	
		<jsp:include page="../Components/error-popup.jsp">
			<jsp:param value="" name="ErrorMsg"/>
		</jsp:include>
		
		<%-- <jsp:include page="../Components/success-popup.jsp">
			<jsp:param value="Success" name="SuccessMsg"/>
		</jsp:include> --%>
	
		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/registration.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">Sign Up</h3>
				<span id="error-text" class="form-error">${error_msg}</span>
				<form id="registrationForm" class="form-card" autocomplete="off"
					onsubmit="validateRegistration(event)">

					<label class="input-group flex-col">Full Name <input
						id="fullname" type="text" required="true"
						placeholder="e.g. John Doe" autocomplete="off"
						onkeyup="validateFullname()" name="" path="" maxlength="50" />
					</label> <label class="input-group flex-col">Username <input
						id="username" type="text" required="true"
						placeholder="e.g. JohnDoe01" autocomplete="off"
						onkeyup="validateUsername()" name="" path="" maxlength="16" />
					</label> <label class="input-group flex-col">Email <input
						id="email" type="email" required="true"
						placeholder="example@email.com" autocomplete="off"
						onkeyup="validateEmail()" name="" path="" maxlength="255" />
					</label> <label class="input-group flex-col">Password <input
						id="password" type="password" required="true"
						placeholder="e.g. JohnDoe1" autocomplete="off"
						onkeyup="validatePassword()" name="" path="" maxlength="14" />
					</label>

					<button class="submit-button" type="submit" value="sign-up">Sign
						Up</button>

					<hr class="divider">

					<a class="alt-form-link trans-ease-out" href="/login"
						style="margin-bottom: 1rem;">Already have an account?</a>

				</form>
			</section>
		</div>
	</div>
</main>
<script src="js/validation.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>