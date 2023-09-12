/*----------  6-DIGIT CODE VALIDATION  ----------*/

// ERROR MESSAGE TAG
const errorText = document.getElementById("error-text");

// COLORS
const error = "#e32b2b";
const success = "#2cb67d";
const bgDark = "#16161a";

const form = document.getElementById("otpForm");
const fullOTP = document.getElementById("fullOTP");
const inputs = form.querySelectorAll('.OTP');
const KEYBOARDS = {
	backspace: 8,
	arrowLeft: 37,
	arrowRight: 39,
}

/*----------  OTP Functions ----------*/

// MOVE TO NEXT INPUT BOX
function handleInput(e) {
const input = e.target;
const nextInput = input.nextElementSibling
	if (nextInput && input.value) {
		nextInput.focus();
	if (nextInput.value) {
		nextInput.select();
		}
	}
}

// SPLIT PASTE INTO THE DIFFERENT INPUTS
function handlePaste(e) {
	e.preventDefault();
	const paste = e.clipboardData.getData('text')
	inputs.forEach((input, i) => {
		input.value = paste[i] || ''
	})
}

// MOVE BACK UPON BACKSPACE
function handleBackspace(e) { 
	const input = e.target;
		if (input.value) {
		input.value = '';
		return;
	}

	try {
		input.previousElementSibling.focus();
	} catch(err) {
		
	}
}

// MOVE LEFT
function handleArrowLeft(e) {
const previousInput = e.target.previousElementSibling
	if (!previousInput) return
		previousInput.focus()
	}

// MOVE RIGHT
function handleArrowRight(e) {
const nextInput = e.target.nextElementSibling
	if (!nextInput) return
		nextInput.focus()
	}
	
	form.addEventListener('input', handleInput)
	inputs[0].addEventListener('paste', handlePaste)
	
	inputs.forEach(input => {
	input.addEventListener('focus', e => {
	setTimeout(() => {
	  e.target.select()
	}, 0)
	})
	
		input.addEventListener('keydown', e => {
		switch(e.keyCode) {
		  case KEYBOARDS.backspace:
		    handleBackspace(e)
		    break
		  case KEYBOARDS.arrowLeft:
		    handleArrowLeft(e)
		    break
		  case KEYBOARDS.arrowRight:
		    handleArrowRight(e)
		    break
		  default:  
		}
	})
})

/*----------  OTP Form Validations ----------*/
let errorMessage = "";
function showErrorPopup() {
    errorText.innerText = errorMessage;
    $(".error-popup").css("visibility", "visible");
    $(".error-popup").fadeIn("fast");
    setTimeout(function () {
        $(".error-popup").fadeOut("fast");
    }, 7000);
}
	
function validateOTPForm(event) {

	event.preventDefault();
	
	const digits = [];
	const errFound = [];

// 	STORES INPUT VALUES INTO DIGITS[]
	for (i=0; i < inputs.length; i++) {
		digits.push(inputs[i].value);
		
		if (isNaN(inputs[i].value)) {
			errFound.push(i);
			inputs[i].classList.add("error");
		} else {
			inputs[i].classList.remove("error");
		}
	}

// 	CONCATENATED DIGITS
	const otpCode = digits.join('');

	if (otpCode.length < 6) {
		errorMessage = "Please enter the full 6 digit code";
		showErrorPopup();
		return false;
		
	} else if (isNaN(otpCode)) {
		errorMessage = "Please only enter numerical digits";
		showErrorPopup();
		return false;
		
	} else {
		fullOTP.value = otpCode;
		form.submit();
	}
}

// ONKEYUP OTP VALIDATION
function validateOTP() {
	
	const digits = [];
	const errFound = [];

// 	STORES INPUT VALUES INTO DIGITS[]
	for (i=0; i < inputs.length; i++) {
		digits.push(inputs[i].value);
		
		if (isNaN(inputs[i].value)) {
			errFound.push(i);
			inputs[i].classList.remove("correct");
			inputs[i].classList.add("error");
		} else if (inputs[i].value == "") {
			inputs[i].classList.remove("correct");
			inputs[i].classList.remove("error");
		} else {
			inputs[i].classList.remove("error");
			inputs[i].classList.add("correct");
		}
	}
	if (errFound == "") {
		errorText.innerText = "";
	}
}