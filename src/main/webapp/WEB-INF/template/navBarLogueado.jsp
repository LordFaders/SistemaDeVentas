<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">${param.title}</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">${param.nombre }</a></li>
				<li class="nav-item"><a class="nav-link" href="/cliente">Crear Cliente</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/producto">Crear Producto</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="auto">Crear Auto</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/venta">Venta</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/venta/ver">Ver Venta</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/venta/export/pdf">Exportar Ventas</a>
				</li>
				<li class="nav-item"><form method="POST" action="/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> 
								<input
								type="submit" value="Logout" />
						</form>
				</li>
				
			</ul>
		</div>
	</div>
</nav>
