<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Registration Confirmation" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center" style="min-height: 95vh;">
	<div class="width-limiter">
		<div class="tb-container align-center justify-between">
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/email-sent.svg">
			</div>
			<section class="tb-form flex-col">

				<h3 class="form-heading">
					OTP<br>Verification Code
				</h3>
				<span id="error-text" class="form-error"></span>
				<sf:form id="otpForm" class="form-card" autocomplete="on"
					onsubmit="validateOTPForm(event)" method="post"
					action="verify_registration">

					<label class="input-group flex-col text-align-center">
						Please enter the verification code sent to your email below <input
						type="hidden" autocomplete="off" name="username"
						value="${username}"> <input id="fullOTP" type="hidden"
						maxlength="6" autocomplete="off" name="OTP">

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

					<button class="submit-button" style="margin-bottom: 1rem;">Verify</button>

				</sf:form>
			</section>
		</div>
	</div>
</main>
<script src="js/otp-validation.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>