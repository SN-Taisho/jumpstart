function addToCart() {
	$('#cart').addClass('shake');
	setTimeout(function() {
		$('#cart').removeClass('shake')
	}, 500);
}