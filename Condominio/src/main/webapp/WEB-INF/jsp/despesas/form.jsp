<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Despesa</h1>

<br>

<form action="${linkTo[DespesasController].adiciona(null)}"
	method="post">

	<input id="id" class="form-control" type="number" name="despesas.id"
		value="${despesas.id}" style="display: none" />


		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="descricao">Descrição *</label> <input id="descricao"
					class="w3-input w3-border w3-round-large" type="text" placeholder="e.x Conta de Luz" name="despesas.descricao"
					value="${despesas.descricao}" />
		</div>


	</div>
		<div class="w3-row-padding">
				<div class="w3-third conteudo">
				<label for="valorDespesa">Valor da Despesa *</label> <input
					id="valorDespesa" class="w3-input w3-border w3-round-large" placeholder="e.x 140.00" type="number"
					name="despesas.valorDespesa" value="${despesas.valorDespesa}" />
			</div>
		</div>
		<div class="w3-row-padding">
				<div class="w3-third conteudo">
				<label for="valorCobrado">Valor Cobrado *</label> <input
					id="valorCobrado" class="w3-input w3-border w3-round-large" placeholder="e.x 140.00" type="number"
					name="despesas.valorCobrado" value="${despesas.valorCobrado}" />
			</div>
		</div>

	<div class="w3-row-padding">
				<div class="w3-third conteudo">
				<label for="dataReferencia">Data De Referência *</label> <input
					id="dataReferencia" class="w3-input w3-border w3-round-large" placeholder="e.x 10/09/2016" type="text"
					name="despesas.dataReferencia"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${despesas.dataReferencia}"/>">

			</div>
	
		<div class="w3-row-padding">
				<div class="w3-third conteudo">
				<label for="condominio">Condominio *</label> <select
					class="w3-input w3-border w3-round-large" id="condominio" name="despesas.idCond" style=" height : 36px;">
					<c:forEach var="d" items="${condominio}">
						<option value="${d.id}">${d.descricao}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div class="w3-row-padding">
			<div class="w3-third conteudo" style=" width : 134px;">
				<label for="especifico">Específica  </label> <input id="especifico"
					class="w3-radio w3-border w3-round-large" type="radio" name="despesas.especifico"
					value="true" />
					
					&nbsp;
					
				<label for="especifico">Comum </label> 
			<input id="especifico" class="w3-radio w3-border w3-round-large" type="radio" name="despesas.especifico" value="false" checked="checked"></div>
		</div>


	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" type="submit">Salvar</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />