<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp"/>

<div class="container">
	<h1>Cadastro de Proprietário</h1>

	<br>

	<form action="${linkTo[ProprietarioController].adiciona(null)}"
		method="post">
		
		<input id="id" class="form-control" type="number" name="proprietario.id"
			value="${proprietario.id}"  style="display:none"/>
				
				
				<div class="row">
				<div class="w3-row-padding">
					<div class="w3-third conteudo">
						<label for="nomeProprietario">Nome *</label> <input id="nomeProprietario"
							class="form-control w3-input w3-border w3-round-large" type="text" name="proprietario.nomeProprietario"
							value="${proprietario.nomeProprietario}"/>
					</div>
				</div>
				
			</div>
			<div class="row">
				<div class="w3-row-padding">
					<div class="w3-third conteudo">
							<label for="rg">RG</label> <input id="rg"
								class="form-control w3-input w3-border w3-round-large" type="text" name="proprietario.rg"
								value="${proprietario.rg}"/>
						</div>
					</div>
					<div class="w3-row-padding">
					<div class="w3-third conteudo">
							<label for="cpf">CPF *</label> <input id="cpf"
								class="form-control w3-input w3-border w3-round-large" type="text" name="proprietario.cpf"
								value="${proprietario.cpf}"/>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="w3-row-padding">
					<div class="w3-third conteudo">
						<label for="fone1">Telefone 1 *</label> <input id="fone1"
							class="form-control w3-input w3-border w3-round-large" type="text" name="proprietario.fone1"
							value="${proprietario.fone1}"/>
					</div>
				</div>
				<div class="w3-row-padding">
					<div class="w3-third conteudo">
						<label for="fone2">Telefone 2</label> <input id="fone2"
							class="form-control w3-input w3-border w3-round-large" type="text" name="proprietario.fone2"
							value="${proprietario.fone2}"/>
					</div>
				</div>
			</div>

			<div class="w3-row-padding">
				<div class="w3-third conteudo">
					<button class="w3-btn w3-round w3-ripple" type="submit">Salvar</button>
				</div>
			</div>
			<h1 class="w3-text-white">Correcao</h1>
		</form>
	</div>
	
<script type="text/javascript" language="javascript">
	function valida_form (){
		if(document.getElementById("nomeProprietario").value.length < 3){
			alert('Por favor, preencha o campo nome');
			document.getElementById("nomeProprietario").focus();
			return false
		}else if(document.getElementById("cpf").value.length != 11){
			alert('Por favor, preencha o campo cpf');
			document.getElementById("cpf").focus();
			return false
		}else if((document.getElementById("fone1").value.length < 8)){
			alert('Por favor, preencha com pelo menos o telefone 1');
			document.getElementById("fone1").focus();
			return false
		}
	}
</script>
		
		
		
		<!-- Antigo -->
		
		<%-- <div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="nomeProprietario">Nome *</label> <input
						id="nomeProprietario" class="form-control" type="text"
						name="proprietario.nomeProprietario"
						value="${proprietario.nomeProprietario}" />
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="rg">RG</label> <input id="rg" class="form-control"
						type="text" name="proprietario.rg" value="${proprietario.rg}" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label for="cpf">CPF *</label> <input id="cpf" class="form-control"
						type="text" name="proprietario.cpf" value="${proprietario.cpf}" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="fone1">Telefone 1 *</label> <input id="fone1"
						class="form-control" type="text" name="proprietario.fone1"
						value="${proprietario.fone1}" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label for="fone2">Telefone 2</label> <input id="fone2"
						class="form-control" type="text" name="proprietario.fone2"
						value="${proprietario.fone2}" />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-primary pull-right" type="submit">Salvar</button>
			</div>
		</div> --%>
	</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"/>