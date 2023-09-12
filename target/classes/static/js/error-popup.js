// Error Popup
if ($('#error-text').is(':empty')) {
	// ERROR TEXT HIDDEN BY DEFAULT
	$('.error-popup').css('visibility', 'hidden');
} else {
	$('.error-popup').css('visibility', 'visible');
	$('.error-popup').fadeIn('fast');
	setTimeout(function() {
		$('.error-popup').fadeOut('fast');
	}, 7000);
}
function closeFormError() {
	$(".error-popup").fadeOut("fast");
}