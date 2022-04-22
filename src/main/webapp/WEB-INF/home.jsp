<jsp:include page='template/head.jsp'>
	<jsp:param name='title' value='Sistema Web G6' />
</jsp:include>

<html>
<body>
	<jsp:include page='template/navBarLogueado.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
		<jsp:param name='nombre' value='${nombreUsuario }' />
	</jsp:include>

	<jsp:include page='template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>