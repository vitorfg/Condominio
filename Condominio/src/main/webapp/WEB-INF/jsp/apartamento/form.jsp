<%@page import="br.com.fatec.controller.ApartamentoController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Apartamento</h1>

<br>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

function valida_form() {
	if (document.getElementById("numeroApt").value.length < 3) {
		alert('Por favor, preencha o campo numero do apartamento.');
		document.getElementById("numeroApt").focus();

		return false
	} else if (document.getElementById("qtdQuartos").value.length < 1) {
		alert('Por favor, preencha o campo de quantidade de quartos.');
		document.getElementById("qtdQuartos").focus();

		return false
	}else if(document.getElementById("proprietario").value == null){
		alert('Por favor, selecione um proprietario.');
		document.getElementById("proprietario").focus();

		return false

	}else if(document.getElementById("tipoOcupacao").value == null){
		alert('Por favor, selecione uma ocupacao.');
		document.getElementById("tipoOcupacao").focus();

		return false

	}
}
</script>

<form action="${linkTo[ApartamentoController].adiciona(null)}"
	method="post" onsubmit="return valida_form(this)">

	<input id="id" class="form-control" type="number" name="apartamento.id"
		value="${apartamento.id}" style="display: none" />

	<font color = "red"> ${message}</font>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="numeroApt">Nº Apartamento *</label> <input
					id="numeroApt" class="form-control w3-input w3-border w3-round-large" type="number"
					placeholder="e.x 320" data-toggle="tooltip" title="Número do apartamento"
					name="apartamento.numeroApt" onkeypress="mascara(this,soNumeros)" maxlength="3" value="${apartamento.numeroApt}">
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="qtdQuartos">Quantidade de quartos *</label> <input
					id="qtdQuartos" class="form-control w3-input w3-border w3-round-large" type="number"
					placeholder="e.x 2" name="apartamento.qtdQuartos" data-toggle="tooltip" title="Quantidade de quartos"
					onkeypress="mascara(this,soNumeros)" maxlength="1" value="${apartamento.qtdQuartos}">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="proprietario">Proprietário *</label>
				<select	class="form-control w3-input w3-border w3-round-large" data-toggle="tooltip" title="Nome do proprietário"
					id="proprietario" name="apartamento.idProp" style=" height : 40px;">
					<c:forEach var="p" items="${proprietarios}">
						<option value="${p.id}">${p.nomeProprietario}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="tipoOcupacao">Tipo de ocupação *</label> <select
					class="form-control w3-input w3-border w3-round-large" id="tipoOcupacao"
					data-toggle="tooltip" title="Tipo de ocupação" name="apartamento.tipoOcupacao">
					<option value="Proprietário">Proprietário</option>
					<option value="Inquilino">Inquilino</option>
					<option value="Vazio">Vazio</option>
				</select>
			</div>
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" data-toggle="tooltip" title="Salvar apartamento"
			 type="submit">Salvar</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />