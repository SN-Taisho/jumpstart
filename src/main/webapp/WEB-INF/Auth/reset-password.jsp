<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Reset Password" name="HTMLtitle" />
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
	
		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/forgot-password.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">Reset Password</h3>
				<sf:form id="resetForm" class="form-card" autocomplete="on"
					method="post" action="reset_password"
					onsubmit="validateResetForm(event)">

					<label class="input-group flex-col">Password <input
						id="password" type="password" required="true"
						placeholder="e.g. JohnDoe1" autocomplete="off"
						onkeyup="validatePassword()" name="password" path="password"
						maxlength="14" />
					</label>

					<label class="input-group flex-col">Confirm your password<input
						type="password" id="passwordConfirmation"
						placeholder="Re-enter your new password" autocomplete="false"
						maxlength="14" required="true" onkeyup="validatePConfirmation()" />

					</label>

					<input type="hidden" name="email" value="${email}" required="true" />

					<button type="submit" class="submit-button" style="margin: 0.5rem;">Change Password</button>

				</sf:form>
			</section>
		</div>
	</div>
</main>
<script src="js/validation.js"></script>
<script src="js/error-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>