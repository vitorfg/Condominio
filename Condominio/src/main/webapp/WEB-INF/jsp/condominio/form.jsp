<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">
	<h1>Cadastro de Condominio</h1>

	<br>

	<form action="${linkTo[CondominioController].adiciona(null)}"
		method="post">
		
		<input id="id" class="form-control" type="number" name="condominio.id"
			value="${condominio.id}"  style="display:none"/>
		
		<div class="row"></div>
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="dataReferencia">Data De Referência *</label> <input
						id="dataReferencia" class="form-control" type="text"
						name="condominio.dataReferencia"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataReferencia}"/>">

				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="dataEmissao">Data De Emissão *</label> <input
						id="dataEmissao" class="form-control" type="text"
						name="condominio.dataEmissao"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataEmissao}"/>">

				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="dataVencimento">Data De Vencimento *</label> <input
						id="dataVencimento" class="form-control" type="text"
						name="condominio.dataVencimento"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataVencimento}"/>">

				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="dataPagamento">Data De Pagamento *</label> <input
						id="dataPagamento" class="form-control" type="text"
						name="condominio.dataPagamento"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataPagamento}"/>">

				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="numParcelas">Número de Parcelas</label> <input
						id="numParcelas" class="form-control" type="number"
						name="condominio.numParcelas" value="${condominio.numParcelas}" />
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="parcelasPagas">Parcelas Pagas</label> <input
						id="parcelasPagas" class="form-control" type="number"
						name="condominio.parcelasPagas"
						value="${condominio.parcelasPagas}" />
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="apartamento">Apartamento *</label> <select
						class="form-control" id="apartamento"
						name="condominio.apartamento">
						<c:forEach var="apartamento" items="${apartamento}">
							<option value="${condominio.apartamento}"></option>
						</c:forEach>
					</select>

				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="porcentagemJuros">Porcentagem de Juros *</label> <input
						id="porcentagemJuros" class="form-control" type="number"
						name="condominio.porcentagemJuros"
						value="${condominio.porcentagemJuros}" />
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="late">Atraso</label> <input id="late"
						class="radio-inline" type="checkbox" name="condominio.late"
						value="${condominio.late}" /> &nbsp; <label for="pagouAtual">Pago
						no Mês Corrente</label> <input id="pagouAtual" class="radio-inline"
						type="checkbox" name="condominio.pagouAtual"
						value="${condominio.pagouAtual}" />
					<!-- Linkar com variável boolean no java -->
				</div>
			</div>

			<div class="col-sm-3"></div>

			<div class="col-sm-3"></div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="totalPagar">Total a Pagar *</label> <input
						id="totalPagar" class="form-control" type="number"
						name="condominio.totalPagar" value="${condominio.totalPagar}" />
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-sm-12">
				<button class="btn btn-primary pull-right" type="submit">Salvar</button>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />