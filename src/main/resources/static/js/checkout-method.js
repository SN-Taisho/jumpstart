if (document.getElementById("delivery-btn").checked == true) {
	}

function checkMethod() {
	if (document.getElementById("delivery-btn").checked == true) {
		document.getElementById("delivery-form").classList.remove("hidden");
		document.getElementById("pickup-form").classList.add("hidden");
	}
	
	if (document.getElementById("pickup-btn").checked == true) {
		document.getElementById("pickup-form").classList.remove("hidden");
		document.getElementById("delivery-form").classList.add("hidden");
	}
}