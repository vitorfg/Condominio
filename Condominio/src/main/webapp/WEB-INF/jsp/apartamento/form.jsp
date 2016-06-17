<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="container">
	<h1>Cadastro de Apartamento</h1>

	<br>

	<form action="${linkTo[ApartamentoController].adiciona(null)}"
		method="post">
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="numeroApt">Nº Apartamento *</label> <input
						id="numeroApt" class="form-control" type="text"
						name="apartamento.numeroApt" value="${apartamento.numeroApt}">
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label for="qtdQuartos">Quantidade de quartos *</label> <input
						id="qtdQuartos" class="form-control" type="text"
						name="apartamento.qtdQuartos" value="${apartamento.qtdQuartos}">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="proprietario">Proprietário *</label> <select
						class="form-control" id="proprietarios">
						<c:forEach var="p" items="${proprietarios}">
							<option value="${p.nomeProprietario}">${p.nomeProprietario}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="tipoOcupacao">Tipo de ocupação *</label> <select
						class="form-control" id="tipoOcupacao"
						name="apartamento.tipoOcupacao">
						<option value="${apartamento.tipoOcupacao}">Proprietário</option>
						<option value="${apartamento.tipoOcupacao}">Inquilino</option>
						<option value="${apartamento.tipoOcupacao}">Vazio</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-primary pull-right" type="submit">Salvar</button>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />