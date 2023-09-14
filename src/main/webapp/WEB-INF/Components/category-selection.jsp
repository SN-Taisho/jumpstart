<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<div class="selection-wrapper">

	<c:if test="${empty selectedCateg }">
		<button class="default" onclick="window.location.href='products'">All
			Categories</button>
	</c:if>

	<c:if test="${not empty selectedCateg }">
		<button onclick="window.location.href='products'">All
			Categories</button>
	</c:if>

	<c:forEach items="${categories }" var="c">
		<c:if test="${selectedCateg eq c.name}">
			<button class="default"
				onclick="window.location.href='products?category=${c.name}'">${c.name }</button>
		</c:if>
		<c:if test="${selectedCateg ne c.name}">
			<button onclick="window.location.href='products?category=${c.name}'">${c.name }</button>
		</c:if>
	</c:forEach>
</div>