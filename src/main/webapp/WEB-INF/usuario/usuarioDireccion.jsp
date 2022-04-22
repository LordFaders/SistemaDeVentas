<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Sistema Web G6' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema Web G6' />
</jsp:include>
<body>
	<div class="container col-4 mt-5 text-white">

		<h1>Usuario / Dirección</h1>
		<c:if test="${msgError != null}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${msgError}"></c:out>
			</div>
		</c:if>
		<c:if test="${msgOK != null}">
			<div class="alert alert-success" role="alert">
				<c:out value="${msgOK}"></c:out>
			</div>
		</c:if>
</div>
	<div class="container mt-5">
		<div class="row"></div>
		<table class="table text-white">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nombre</th>
					<th scope="col">Calle</th>
					<th scope="col">Numero</th>
					<th scope="col">Sector</th>
					<th scope="col">Ciudad</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="usuario" items="${listaUsuarios}">
					<tr>
						<th scope="row"><c:out value="${usuario.id}"></c:out></th>
						<td><c:out value="${usuario.nombre}"></c:out></td>
						<td><c:out value="${usuario.direccion.calle}"></c:out></td>
						<td><c:out value="${usuario.direccion.numero}"></c:out></td>
						<td><c:out value="${usuario.direccion.sector}"></c:out></td>
						<td><c:out value="${usuario.direccion.ciudad}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	
	
	<div class="container mt-5">
	<h1>Dirección / Usuario</h1>
		<div class="row">
		<table class="table text-white">
			<thead>
				<tr>
					<th scope="col">#</th>
	
					<th scope="col">Calle</th>
					<th scope="col">Numero</th>
					<th scope="col">Sector</th>
					<th scope="col">Ciudad</th>
					<th scope="col">Nombre</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="direccion" items="${listaDirecciones}">
					<tr>
						<th scope="row"><c:out value="${direccion.id}"></c:out></th>
						<td><c:out value="${direccion.calle}"></c:out></td>
						<td><c:out value="${direccion.numero}"></c:out></td>
						<td><c:out value="${direccion.sector}"></c:out></td>
						<td><c:out value="${direccion.ciudad}"></c:out></td>
						<td><c:out value="${direccion.usuario.nombre}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>