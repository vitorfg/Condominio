<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Proprietário</h1>

<br>

<script type="text/javascript" language="javascript">
	function valida_form() {
		if (document.getElementById("nomeProprietario").value.length < 3) {
			alert('Por favor, preencha o campo nome');
			document.getElementById("nomeProprietario").focus();

			return false
		} else if (document.getElementById("cpf").value.length != 11) {
			alert('Por favor, preencha o campo cpf');
			document.getElementById("cpf").focus();

			return false
		} else if ((document.getElementById("fone1").value.length < 8)) {
			alert('Por favor, preencha com pelo menos o telefone 1');
			document.getElementById("fone1").focus();

			return false
		}
	}
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

<form action="${linkTo[ProprietarioController].adiciona(null)}"
	method="post">

	<input id="id" class="form-control" type="number"
		name="proprietario.id" value="${proprietario.id}"
		style="display: none" />


	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="nomeProprietario">Nome *</label>
				<input	id="nomeProprietario" class="form-control w3-input w3-border w3-round-large" type="text"
					name="proprietario.nomeProprietario" data-toggle="tooltip" title="Nome do proprietário"
					placeholder="e.x Pedro Henrique" value="${proprietario.nomeProprietario}" />
			</div>
		</div>

	</div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="rg">RG</label>
				<input id="rg"	class="form-control w3-input w3-border w3-round-large" type="text"
					placeholder="e.x 402265885" data-toggle="tooltip" title="RG do proprietário"
					name="proprietario.rg" onkeypress="mascara(this,frg)" maxlength="12" value="${proprietario.rg}" />
			</div>
		</div>
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="cpf">CPF *</label>
				<input id="cpf"	class="form-control w3-input w3-border w3-round-large" type="text"
					placeholder="e.x 0581452658" data-toggle="tooltip" title="CPF do proprietário"
					name="proprietario.cpf" onkeypress="mascara(this,fcpf)" maxlength="14" value="${proprietario.cpf}" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="fone1">Telefone Residencial *</label>
				<input id="fone1" class="form-control w3-input w3-border w3-round-large" type="text"
					placeholder="e.x 11 20173114" data-toggle="tooltip" title="Telefone do proprietário"
					name="proprietario.fone1" onkeypress="mascara(this,ftelefone1)" maxlength="14" value="${proprietario.fone1}" />
			</div>
		</div>
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="fone2">Celular</label>
				<input id="fone2" class="form-control w3-input w3-border w3-round-large" type="text"
					placeholder="e.x 11 970124424" data-toggle="tooltip" title="Telefone do proprietário"
					name="proprietario.fone2" onkeypress="mascara(this,ftelefone2)" maxlength="15" value="${proprietario.fone2}" />
			</div>
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" data-toggle="tooltip" title="Salvar registro do proprietário"
			type="submit">Salvar</button>
		</div>
	</div>
	<h1 class="w3-text-white">Correcao</h1>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />