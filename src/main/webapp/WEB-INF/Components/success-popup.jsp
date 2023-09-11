<div class="align-center success-popup">
	<span class="material-icons">done</span>
	<p id="error-text" class="pFont success-text"><%=request.getParameter("SuccessMsg") != null ? request.getParameter("SuccessMsg") : ""%></p>
	<button class="btnAnimation icon material-icons"
		onclick="closeSuccess()">close</button>
</div>

<script src="js/success-popup.js"></script>