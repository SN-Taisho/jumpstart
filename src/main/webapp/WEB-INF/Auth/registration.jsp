<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Sign Up" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center"
	style="min-height: 95vh;">
	<div class="width-limiter">

		<div class="justify-center flex-col error-popup">
			<div class="justify-between">
				<span class="material-icons">error</span>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>
			<p id="error-text" class="pFont text-center">${errorMsg }</p>
		</div>

		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/registration.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">Sign Up</h3>
				<sf:form id="registrationForm" class="form-card" autocomplete="off"
					onsubmit="validateRegistration(event)" method="post" action="sign_up" modelAttribute="user">

					<label class="input-group flex-col">Full Name <input
						id="fullname" type="text" required="true"
						placeholder="e.g. John Doe" autocomplete="off"
						onkeyup="validateFullname()" name="fullname" path="fullname" maxlength="50" />
					</label> <label class="input-group flex-col">Username <input
						id="username" type="text" required="true"
						placeholder="e.g. JohnDoe01" autocomplete="off"
						onkeyup="validateUsername()" name="username" path="username" maxlength="16" />
					</label> <label class="input-group flex-col">Email <input
						id="email" type="email" required="true"
						placeholder="example@email.com" autocomplete="off"
						onkeyup="validateEmail()" name="email" path="email" maxlength="255" />
					</label> <label class="input-group flex-col">Password <input
						id="password" type="password" required="true"
						placeholder="e.g. JohnDoe1" autocomplete="off"
						onkeyup="validatePassword()" name="password" path="password" maxlength="14" />
					</label>

					<button class="submit-button" type="submit" value="sign-up">Sign
						Up</button>

					<hr class="divider">

					<a class="alt-form-link trans-ease-out" href="/login"
						style="margin-bottom: 1rem;">Already have an account?</a>
						
				</sf:form>
			</section>
		</div>
	</div>
</main>
<script src="js/validation.js"></script>
<script src="js/error-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>