<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Identity Verification" name="HTMLtitle" />
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
				<img alt="Registration Graphic" src="graphics/email-sent.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">
					OTP<br>Verification Code
				</h3>
				<sf:form id="otpForm" class="form-card" autocomplete="on"
					onsubmit="validateOTPForm(event)" method="post"
					action="verify_identity">

					<label class="input-group flex-col text-align-center">
						Please enter the verification code sent to your email below <input
						type="hidden" autocomplete="off" name="email" value="${email}">
						<input id="fullOTP" type="hidden" maxlength="6" autocomplete="off"
						name="OTP">

						<div class="otp-container justify-center"
							style="margin: 0.5rem 0rem;">

							<input class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()"> <input
								class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()"> <input
								class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()"> <input
								class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()"> <input
								class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()"> <input
								class="OTP" type="text" required maxlength="1"
								autocomplete="off" onkeyup="validateOTP()">

						</div>
					</label>

					<button type="submit" class="submit-button"
						style="margin-bottom: 1rem;">Verify</button>

				</sf:form>
			</section>
		</div>
	</div>
</main>
<script src="js/otp-validation.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>