<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Condominio</h1>

<br>

<script type="text/javascript" language="javascript">
	function valida_form() {
		if (document.getElementById("dataReferencia").value.length != 7) {
			alert('Por favor, preencha o campo de Data de referencia conforme o exemplo');
			document.getElementById("dataReferencia").focus();

			return false
		} else if (document.getElementById("dataEmissao").value.length != 7) {
			alert('Por favor, preencha o campo de Data de emiss�o conforme o exemplo');
			document.getElementById("dataEmissao").focus();

			return false
		} else if ((document.getElementById("dataVencimento").value.length != 10)) {
			alert('Por favor, preencha o campo de vencimento conforme o exemplo');
			document.getElementById("dataVencimento").focus();

			return false
		} else if ((document.getElementById("dataPagamento").value.length != 10)) {
			alert('Por favor, preencha o campo de pagamento conforme o exemplo');
			document.getElementById("datPagamento").focus();

			return false
		} else if ((document.getElementById("porcentagemJuros").value == "")) {
			alert('Por favor, preencha o juros (Se n�o houver preencha com 0)');
			document.getElementById("porcentagemJuros").focus();

			return false
		} else if ((document.getElementById("apartamento").value == "")) {
			alert('Por favor, selecione um apartamento');
			document.getElementById("apartamento").focus();

			return false
		} else if ((document.getElementById("totalPagar").value == "")) {
			alert('Por favor, preencha o campo Total a pagar');
			document.getElementById("totalPagar").focus();

			return false
		}
	}
</script>

<form action="${linkTo[CondominiosController].adiciona(null)}"
	method="post" onsubmit="return valida_form(this)">
	<div class="row"></div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataReferencia">Data De Refer�ncia *</label> <input
					id="dataReferencia"
					class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataReferencia"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataReferencia}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataEmissao">Data De Emiss�o *</label> <input
					id="dataEmissao"
					class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataEmissao"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataEmissao}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataVencimento">Data De Vencimento *</label> <input
					id="dataVencimento"
					class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataVencimento"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataVencimento}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataPagamento">Data De Pagamento *</label> <input
					id="dataPagamento"
					class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataPagamento"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataPagamento}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="numParcelas">N�mero de Parcelas</label> <input
					id="numParcelas"
					class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.numParcelas"
					value="${condominio.numParcelas}" />
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="parcelasPagas">Parcelas Pagas</label> <input
					id="parcelasPagas"
					class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.parcelasPagas"
					value="${condominio.parcelasPagas}" />
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="apartamento">Apartamento *</label> <select
					class="form-control w3-input w3-border w3-round-large"
					id="apartamento" name="condominio.idApt">
					<c:forEach var="a" items="${apartamentos}">
						<option value="${a.id}">${a.numeroApt}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="porcentagemJuros">Porcentagem de Juros *</label> <input
					id="porcentagemJuros"
					class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.porcentagemJuros"
					value="${condominio.porcentagemJuros}" />
			</div>

		</div>
	</div>



	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<label for="totalPagar">Total a Pagar *</label> <input
				id="totalPagar"
				class="form-control w3-input w3-border w3-round-large" type="number"
				name="condominio.totalPagar" value="${condominio.totalPagar}" />
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo" style="width: 371px;">
			<label for="late">Atraso</label> <input id="late" class="w3-validate"
				type="checkbox" name="condominio.late" value=true />
				
				&nbsp;
				
				<label for="pagouAtual">Pago no M�s Corrente</label> <input id="pagouAtual"
				class="w3-validate" type="checkbox" name="condominio.pagouAtual"
				value=true />
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" type="submit">Salvar</button>
		</div>
	</div>
	<h1 class="w3-text-white">Correcao</h1>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />