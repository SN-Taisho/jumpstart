<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Registration Confirmation" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center" style="min-height: 95vh;">
	<div class="width-limiter">
	
		<div class="justify-center flex-col error-popup">
			<div class="justify-between">
				<span class="material-icons">error</span>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>
			<p id="error-text" class="pFont text-center">${errorMsg }</p>
		</div>
		<script src="js/error-popup.js"></script>
		
		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/forgot-password.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">Forgot Password</h3>
				<sf:form id="emailForm" class="form-card" autocomplete="on"
					onsubmit="validateEmailForm(event)" method="post"
					action="reset_request">

					<label class="input-group flex-col">Email <input id="email"
						type="email" required placeholder="example@email.com"
						autocomplete="off" onkeyup="validateEmail()" name="email"
						maxlength="255" />
					</label>

					<button type="submit" class="submit-button">Submit</button>

					<div class="separator pFont" style="margin-top: -0.5rem">or</div>

					<a class="alt-form-link trans-ease-out" href="/signup">Don't have an account?</a>

				</sf:form>
			</section>
		</div>
	</div>
</main>
<script src="js/validation.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>