<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<title>Controle de Condomínio</title>

<style>
div.conteudo {
	margin: 10px;
}
</style>


<title>Controle de Condomínio</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>

<script type="text/javascript">
	function mascara(objeto, funcao) {
		varObjeto = objeto
		varFuncao = funcao
		setTimeout("funMascara()", 1)
	}

	function funMascara() {
		varObjeto.value = varFuncao(varObjeto.value)
	}

	function soNumeros(variavel) {
		return variavel.replace(/\D/g, "")
	}

	function ftelefone1(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
		variavel = variavel.replace(/(\d{4})(\d)/, "$1-$2") //Coloca hífen entre o quarto e o quinto dígitos
		return variavel //A função seguira os passos, e se você não colocar um limite condizente, o hifen vai ficar entre
		// o quarto e quinto numero somente.
	}

	function ftelefone2(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
		variavel = variavel.replace(/(\d{5})(\d)/, "$1-$2") //Coloca hífen entre o quarto e o quinto dígitos
		return variavel //A função seguira os passos, e se você não colocar um limite condizente, o hifen vai ficar entre
		// o quarto e quinto numero somente.
	}

	function fcpf(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/(\d{3})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
		variavel = variavel.replace(/(\d{3})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
		//de novo (para o segundo bloco de números)
		variavel = variavel.replace(/(\d{3})(\d{1,2})$/, "$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
		return variavel
	}

	function frg(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/(\d{2})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
		variavel = variavel.replace(/(\d{3})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
		//de novo (para o segundo bloco de números)
		variavel = variavel.replace(/(\d{3})(\d{1,2})$/, "$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
		return variavel
	}
	function fcep(variavel) {
		variavel = variavel.replace(/D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/^(\d{5})(\d)/, "$1-$2") //Esse é tão fácil que não merece explicações
		return variavel
	}
	function freferencia(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/^(\d\d)(\d)/g, "$1/$2") //Coloca barra em volta dos dois primeiros dígitos
		variavel = variavel.replace(/(\d{4})(\d)/, "$1/$2") //Coloca hífen entre o quarto e o quinto dígitos
		return variavel //A função seguira os passos, e se você não colocar um limite condizente, o hifen vai ficar entre
		// o quarto e quinto numero somente.
	}
	function fdata(variavel) {
		variavel = variavel.replace(/\D/g, "") //Remove tudo o que não é dígito
		variavel = variavel.replace(/^(\d\d)(\d)/g, "$1/$2")
		variavel = variavel.replace(/^(\d\d)(\d)/g, "$1/$2") //Coloca barra em volta dos dois primeiros dígitos
		variavel = variavel.replace(/(\d{2})(\d)/, "$1/$2") //Coloca hífen entre o quarto e o quinto dígitos
		return variavel //A função seguira os passos, e se você não colocar um limite condizente, o hifen vai ficar entre
		// o quarto e quinto numero somente.
	}

	//<!-- Menu Sidenav/função de sub menu -->
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