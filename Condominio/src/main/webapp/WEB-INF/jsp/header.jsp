<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<title>Sistema de Condominio</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- ================================================================= -->
	<div class="container">
		<h2>Sistema de Condominio</h2>
		<ul class="nav nav-tabs" role="tablist">
			<li><a href="${linkTo[IndexController].index()}">Home</a></li>
			<li><a href="${linkTo[UsuarioController].lista()}">Usuarios</a></li>
			<c:if test="${usuarioLogado.logado}">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Controle Horas<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${linkTo[HoraLancadaController].form()}">Lançamento
								Horas</a></li>
						<li><a href="${linkTo[HoraLancadaController].lista()}">Listagem
								Horas</a></li>
					</ul></li>
				<li><a href="${linkTo[LoginController].desloga()}">Logout</a></li>
			</c:if>
			<li><a href="#">Sobre</a></li>
		</ul>
	</div>

	<div class="container">
		<! class="col-sm-8">
		<!--  conteudo -->