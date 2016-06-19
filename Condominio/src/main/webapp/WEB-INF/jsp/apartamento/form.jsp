<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Apartamento</h1>

<br>

<form action="${linkTo[ApartamentoController].adiciona(null)}"
	method="post">

	<input id="id" class="form-control" type="number" name="apartamento.id"
		value="${apartamento.id}" style="display: none" />

	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="numeroApt">Nº Apartamento *</label> <input
					id="numeroApt" class="form-control w3-input w3-border w3-round-large" type="number"
					name="apartamento.numeroApt" value="${apartamento.numeroApt}">
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="qtdQuartos">Quantidade de quartos *</label> <input
					id="qtdQuartos" class="form-control w3-input w3-border w3-round-large" type="number"
					name="apartamento.qtdQuartos" value="${apartamento.qtdQuartos}">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="proprietario">Proprietário *</label>
				<select	class="form-control w3-input w3-border w3-round-large"
					id="proprietario" name="apartamento.idProp">
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
					name="apartamento.tipoOcupacao">
					<option value="Proprietário">Proprietário</option>
					<option value="Inquilino">Inquilino</option>
					<option value="Vazio">Vazio</option>
				</select>
			</div>
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" type="submit">Salvar</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />