const deliveryBtn = document.getElementById("delivery-btn");
const deliveryForm = document.getElementById("delivery-form");
const deliveryTotal = document.getElementById("delivery-total");

const pickupBtn = document.getElementById("pickup-btn");
const pickupForm = document.getElementById("pickup-form");
const pickupTotal = document.getElementById("pickup-total");

if (deliveryBtn.checked == true) {
	pickupForm.classList.add("hidden");
	pickupTotal.classList.add("hidden");
	}

function checkMethod() {
	if (deliveryBtn.checked == true) {
		deliveryForm.classList.remove("hidden");
		deliveryTotal.classList.remove("hidden");
		pickupForm.classList.add("hidden");
		pickupTotal.classList.add("hidden");
	}
	
	if (pickupBtn.checked == true) {
		pickupForm.classList.remove("hidden");
		pickupTotal.classList.remove("hidden");
		deliveryForm.classList.add("hidden");
		deliveryTotal.classList.add("hidden");
	}
}