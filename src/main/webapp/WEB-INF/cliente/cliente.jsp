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
		<jsp:param name='nombre' value='${nombreUsuario }' />
	</jsp:include>

<body>
	<div class="container col-4 mt-5 text-white">
		<h1>Crear Cliente</h1>
		<form:form method="POST" action="/cliente" modelAttribute="cliente">
			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="nombre">Nombre</form:label>
				<form:input type="text" class="form-control" path="nombre" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="apellido">Apellido</form:label>
				<form:input type="text" class="form-control" path="apellido" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="email">Email</form:label>
				<form:input type="text" class="form-control" path="email" />
			</div>
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Registrar</button>
			</div>
		</form:form>
		<div class="container mt-5">
			<div class="table-responsive-md">
				<table class="table text-white">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Apellido</th>
							<th scope="col">Email</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cliente" items="${listaClientes}">
							<tr>
								<th scope="row"><c:out value="${cliente.id}"></c:out></th>
								<td><c:out value="${cliente.nombre}"></c:out></td>
								<td><c:out value="${cliente.apellido}"></c:out></td>
								<td><c:out value="${cliente.email}"></c:out></td>
								<td><a class="btn btn-outline-warning"
									href="/cliente/editar/${cliente.id}" role="button">Editar</a> <a
									class="btn btn-outline-danger"
									href="/cliente/eliminar/${cliente.id}" role="button">Eliminar</a>
									<a class="btn btn-outline-success"
									href="/cliente/compras/${cliente.id}" role="button"><c:out value="${cliente.compras.size()}"></c:out> compras</a>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>