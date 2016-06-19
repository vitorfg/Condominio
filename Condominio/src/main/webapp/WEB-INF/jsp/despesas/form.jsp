<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Despesa</h1>

<br>

<form action="${linkTo[DespesasController].adiciona(null)}"
	method="post">

	<input id="id" class="form-control" type="number" name="despesas.id"
		value="${despesas.id}" style="display: none" />

	<div class="row">
		<div class="col-sm-6">
			<div class="form-group">
				<label for="descricao">Descri��o *</label> <input id="descricao"
					class="form-control" type="text" name="despesas.descricao"
					value="${despesas.descricao}" />
			</div>
		</div>

	</div>
	<div class="row">
		<div class="col-sm-3">
			<div class="form-group">
				<label for="valorDespesa">Valor da Despesa *</label> <input
					id="valorDespesa" class="form-control" type="number"
					name="despesas.valorDespesa" value="${despesas.valorDespesa}" />
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<label for="valorCobrado">Valor Cobrado *</label> <input
					id="valorCobrado" class="form-control" type="number"
					name="despesas.valorCobrado" value="${despesas.valorCobrado}" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3">
			<div class="form-group">
				<label for="dataReferencia">Data De Refer�ncia *</label> <input
					id="dataReferencia" class="form-control" type="text"
					name="despesas.dataReferencia"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${despesas.dataReferencia}"/>">

			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<label for="condominio">Condominio *</label> <select
					class="form-control" id="condominio" name="despesas.idCond">
					<c:forEach var="d" items="${condominio}">
						<option value="${d.id}">${d.descricao}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="form-group">
				<label for="especifico">Espec�fica</label> <input id="especifico"
					class="radio-inline" type="radio" name="despesas.especifico"
					value="true" />
					
					&nbsp;
					
				<label for="especifico">Comum</label> <input id="especifico"
					class="radio-inline" type="radio" name="despesas.especifico"
					value="false" checked="checked" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-6">
			<button class="btn btn-primary pull-right" type="submit">Salvar</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />