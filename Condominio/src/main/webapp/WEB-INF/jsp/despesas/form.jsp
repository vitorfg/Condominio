<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Despesa</h1>

<br>

<script>
	$(document).ready (function() {
		$('[data-toggle="tooltip"]').tooltip();
	});

	function valida_form() {
		if (document.getElementById("dataReferencia").value.length < 10) {
			alert('Por favor, preencha o campo de Data de referencia conforme o exemplo');
			document.getElementById("dataReferencia").focus();

			return false
		} else if ((document.getElementById("descricao").value == "")) {
			alert('Por favor, escreva uma descrição');
			document.getElementById("descricao").focus();

			return false
		}else if ((document.getElementById("valorDespesa").value == "")) {
			alert('Por favor, preencha o campo Valor da despesa conforme o exemplo');
			document.getElementById("valorDespesa").focus();

			return false
		}else if ((document.getElementById("condominio").value == null)) {
			alert('Por favor, selecione um apartamento');
			document.getElementById("condominio").focus();

			return false
		}
	}
</script>

<form action="${linkTo[DespesasController].adiciona(null)}"
	method="post" onsubmit="return valida_form(this)">

	<input id="id" class="form-control" type="number" name="despesas.id"
		value="${despesas.id}" style="display: none" />

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<label for="descricao">Descrição *</label> <input id="descricao"
				class="w3-input w3-border w3-round-large" type="text"
				placeholder="e.x Conta de Luz" data-toggle="tooltip"
				title="Descrição da despesa" name="despesas.descricao"
				value="${despesas.descricao}" />
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<label for="valorDespesa">Valor da Despesa *</label> <input
				id="valorDespesa" class="w3-input w3-border w3-round-large"
				placeholder="e.x 140.00" data-toggle="tooltip"
				title="Valor da despesa" type="number" name="despesas.valorDespesa"
				onkeypress="mascara(this,soNumeros)" maxlength="40"
				value="${despesas.valorDespesa}" />
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<label for="dataReferencia">Data De Referência *</label> <input
				id="dataReferencia" class="w3-input w3-border w3-round-large"
				placeholder="e.x 10/06/2006" data-toggle="tooltip"
				title="Data de referência da despesa" type="text"
				name="despesas.dataReferencia" onkeypress="mascara(this,fdata)"
				maxlength="10"
				value="<fmt:formatDate pattern="dd/MM/yyyy" value="${despesas.dataReferencia.time}"/>">
		</div>
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="condominio">Apartamento *</label> <select
					class="w3-input w3-border w3-round-large" id="condominio"
					data-toggle="tooltip" title="Condominio da despesa"
					name="despesas.idCond" style="height: 36px;">
					<c:forEach var="c" items="${condominios}">
						<option value="${c.id}">${c.apartamento.numeroApt}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo" style="width: 134px;">
			<label for="especifico" data-toggle="tooltip" title="Específico">Específico</label>
			<input id="especifico" class="w3-radio w3-border w3-round-large"
				data-toggle="tooltip" title="Específico" type="radio"
				name="despesas.especifico" value="true" /> &nbsp; <label
				for="especifico" data-toggle="tooltip" title="Comum">Comum </label>
			<input id="especifico" class="w3-radio w3-border w3-round-large"
				data-toggle="tooltip" title="Comum" type="radio"
				name="despesas.especifico" value="false" checked="checked">
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" data-toggle="tooltip"
				title="Salvar registro da despesa" type="submit">Salvar</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />