<div class="align-center error-popup">
	<span class="material-icons">error</span>
	<p id="error-text" class="pFont error-text"><%=request.getParameter("ErrorMsg") != null ? request.getParameter("ErrorMsg") : ""%></p>
	<button class="btnAnimation icon material-icons"
		onclick="closeFormError()">close</button>
</div>

<script src="js/error-popup.js"></script>