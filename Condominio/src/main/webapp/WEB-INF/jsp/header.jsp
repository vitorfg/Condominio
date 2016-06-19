<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
		
	<title>Controle de Condomínio</title>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<style>
	div.conteudo {
        margin: 10px;
    }
    </style>
	
	
</head>
<!--  -->
<body>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<title>Controle de Condomínio</title>

<style>
div.conteudo {
	margin: 10px;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>

<script type="text/javascript">
<!-- Mascara de entrada --> 
$(document).ready(function(){
	$('#dataReferencia').mask('00/00/0000'); //Data de Referencia
	$('#txtCep').mask('00000-000'); //CEP
	$('#valorDespesa').mask('000.000.000.000.000,00', {reverse: true}); //Dinheiro
	$('#valorCobrado').mask('000.000.000.000.000,00', {reverse: true});
	
	
});


	<!-- Menu Sidenav/função de sub menu -->
	function myAccProp() {
		var x = document.getElementById("AccProp");

		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-black";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-black", "");
		}
	}

	function myAccApto() {
		var x = document.getElementById("AccApto");

		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-black";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-black", "");
		}
	}

	function myAccCond() {
		var x = document.getElementById("AccCond");

		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-black";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-black", "");
		}
	}

	function myAccDesp() {
		var x = document.getElementById("AccDesp");

		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-black";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-black", "");
		}
	}
	<!--Menu Sidenav -->
	function w3_open() {
		document.getElementById("main").style.marginLeft = "25%";
		document.getElementsByClassName("w3-sidenav")[0].style.width = "25%";
		document.getElementsByClassName("w3-sidenav")[0].style.display = "block";
		document.getElementsByClassName("w3-opennav")[0].style.display = 'none';
	}

	function w3_close() {
		document.getElementById("main").style.marginLeft = "0%";
		document.getElementsByClassName("w3-sidenav")[0].style.display = "none";
		document.getElementsByClassName("w3-opennav")[0].style.display = "inline-block";
	}
</script>

</head>
<body>
	<nav class="w3-sidenav w3-gray w3-card-2" style="display: none">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-closenav w3-large">Fechar &times;</a>

		<div class="w3-accordion">
			<a onclick="myAccProp()" href="#"> Proprietario <i
				class="fa fa-caret-down"></i>
			</a>
			<div id="AccProp" class="w3-accordion-content w3-white w3-card-4">
				<a href="${linkTo[ProprietarioController].form()}">Novo
					Proprietário</a> <a href="${linkTo[ProprietarioController].lista()}">Consultar</a>
			</div>
		</div>

		<div class="w3-accordion">
			<a onclick="myAccApto()" href="#"> Apartamento <i
				class="fa fa-caret-down"></i>
			</a>
			<div id="AccApto" class="w3-accordion-content w3-white w3-card-4">
				<a href="${linkTo[ApartamentoController].form()}">Novo
					Apartamento</a> <a href="${linkTo[ApartamentoController].lista()}">Consultar</a>
			</div>
		</div>

		<div class="w3-accordion">
			<a onclick="myAccCond()" href="#"> Condominio <i
				class="fa fa-caret-down"></i>
			</a>
			<div id="AccCond" class="w3-accordion-content w3-white w3-card-4">
				<a href="${linkTo[CondominioController].form()}">Novo Condominio</a>
				<a href="${linkTo[CondominioController].lista()}">Consultar</a>
			</div>
		</div>

		<div class="w3-accordion">
			<a onclick="myAccDesp()" href="#"> Despesas <i
				class="fa fa-caret-down"></i>
			</a>
			<div id="AccDesp" class="w3-accordion-content w3-white w3-card-4">
				<a href="${linkTo[DespesasController].form()}">Nova Despesa</a> <a
					href="${linkTo[DespesasController].lista()}">Consultar</a>
			</div>
		</div>

	</nav>

	<div id="main">
		<ul class="w3-navbar w3-black">
			<li><a class="active" href="#"><span
					class="w3-opennav w3-medium-large" onclick="w3_open()">&#9776;</span></a>
			</li>
			<li><a href="${linkTo[IndexController].index()}" class="w3-gray">Home</a>
			</li>
			<li><a href="${linkTo[SobreController].form()}">Sobre</a></li>
		</ul>
	</div>
	<div class="w3-container">