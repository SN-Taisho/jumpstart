// Success Popup
if ($('.success-text').is(':empty')) {
	// ERROR TEXT HIDDEN BY DEFAULT
	$(".success-popup").css("visibility", "hidden");
} else {
	$(".success-popup").css("visibility", "visible");
	$(".success-popup").fadeIn("fast");
	setTimeout(function() {
		$(".success-popup").fadeOut("fast");
	}, 5000);
}
function closeSuccess() {
	$(".success-popup").fadeOut("fast");
}