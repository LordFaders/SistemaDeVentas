<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Sistema Web G6' />
</jsp:include>

<body>
	<jsp:include page='../template/navbarInicio.jsp'>
		<jsp:param name='title' value='Sistema Web G6 2' />
	</jsp:include>

	<!-- 	<c:if test="${msgError != null}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${msgError}"></c:out>
			</div>
		</c:if> -->

	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						<img
							src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg"
							alt="logo" width="100">
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Registro</h1>

							<c:if test="${msgError != null}">
								<div class="alert alert-danger" role="alert">
									<c:out value="${msgError}"></c:out>
								</div>
							</c:if>

							<form:form method="POST" action="/direccion/agregar/usuario"
								modelAttribute="direccion">
								<div class="mb-3">
									<form:select path="usuario">
										<form:option value="0"> Seleccione Usuario</form:option>
										<c:forEach items="${listaUsuarios}" var="user">
										<c:if test="${user.direccion.id == null}">
											<form:option value="${user.id}">
												<c:out value="${user.nombre}"></c:out>
											</form:option>
											</c:if>
										</c:forEach>
									</form:select>
								</div>
								<div class="mb-3">
									<form:label class="mb-2 text-muted" path="calle">Calle</form:label>
									<form:errors path="calle" class="text-danger" />
									<form:input type="text" class="form-control" path="calle" />
									<div class="invalid-feedback">Se requiere la calle</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-muted" path="numero">Número </form:label>
									<form:errors path="calle" class="text-danger" />
									<form:input type="text" class="form-control" path="numero" />
									<div class="invalid-feedback">Se requiere el número</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-muted" path="sector">Sector</form:label>
									<form:input type="text" class="form-control" path="sector" />
									<div class="invalid-feedback">Se requiere el sector</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-muted" path="ciudad">Ciudad
                                                    </form:label>
									<form:input type="text" class="form-control" path="ciudad" />
									<div class="invalid-feedback">Se requiere la ciudad</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-muted" path="region">Región
                                                    </form:label>
									<form:input type="text" class="form-control" path="region" />
									<div class="invalid-feedback">Se requiere la ciudad</div>
								</div>

								<p class="form-text text-muted mb-3">Registrándose usted
									está de acuerdo con nuestros términos y condiciones.</p>

								<div class="align-items-center d-flex">
									<button type="submit" class="btn btn-primary ms-auto">
										Registrar</button>
								</div>
							</form:form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								¿Ya tiene una cuenta? <a href="/" class="text-dark">Login</a>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">Copyright &copy;
						2017-2022 &mdash; Desafio Latam</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>

</html>