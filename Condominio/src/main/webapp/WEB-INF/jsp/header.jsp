<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Controle de Condomínio</title>
	
	<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<h2>Gerenciamento De Apartamentos</h2>
		<ul class="nav nav-tabs" role="tablist">
			<li><a href="${linkTo[IndexController].index()}">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Proprietário<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${linkTo[ProprietarioController].form()}">Novo Proprietário</a></li>
						<li><a href="${linkTo[ProprietarioController].lista()}">Consultar</a></li> <!-- Chamada para lista, rever. -->
					</ul></li>
				
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Apartamento<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${linkTo[ApartamentoController].form()}">Novo Apartamento</a></li>
						<li><a href="${linkTo[ApartamentoController].lista()}">Consultar</a></li> <!-- Chamada para lista, rever. -->
					</ul></li>
					
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Condominio<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${linkTo[CondominioController].form()}">Novo Condominio</a></li>
						<li><a href="${linkTo[CondominioController].lista()}">Consultar</a></li> <!-- Chamada para lista, rever. -->
					</ul></li>
					
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Despesas<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${linkTo[DespesasController].form()}">Nova Despesa</a></li>
						<li><a href="${linkTo[DespesasController].lista()}">Consultar</a></li> <!-- Chamada para lista, rever. -->
					</ul></li>
			<li><a href="${linkTo[SobreController].form()}">Sobre</a></li>
		</ul>
	</div>