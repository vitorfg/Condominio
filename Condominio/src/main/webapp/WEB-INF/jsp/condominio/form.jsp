<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Cadastro de Condominio</h1>

<br>

<script type="text/javascript" language="javascript">
	function valida_form() {
		if (document.getElementById("dataReferencia").value.length < 5) {
			alert('Por favor, preencha o campo de Data de referencia conforme o exemplo');
			document.getElementById("dataReferencia").focus();

			return false
		} else if ((document.getElementById("apartamento").value == "")) {
			alert('Por favor, selecione um apartamento');
			document.getElementById("apartamento").focus();

			return false
		} 
	}
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

<form action="${linkTo[CondominioController].adiciona(null)}"
	method="post" onsubmit="return valida_form(this)">
	<div class="row"></div>
	<div class="row">
		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataReferencia">Data de Refer�ncia *</label>
				<input	id="dataReferencia"	class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataReferencia" placeholder="e.x 10/2006" data-toggle="tooltip" title="Data de refer�ncia do condominio"
					pattern="MM/yyyy" onkeypress="mascara(this,freferencia)" maxlength="7" 
					value="<fmt:formatDate pattern="MM/yyyy" value="${condominio.dataReferencia}"/>">
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataEmissao">Data de Emiss�o *</label>
				<input	id="dataEmissao" class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataEmissao" placeholder="e.x 10/06/2006" data-toggle="tooltip" title="Data de emiss�o do condominio"
					pattern="dd/MM/yyyy" onkeypress="mascara(this,fdata)" maxlength="10" 
					value="<fmt:formatDate pattern="dd/MM/yyyy"  value="${condominio.dataEmissao}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataVencimento">Data de Vencimento *</label> 
				<input id="dataVencimento" placeholder="e.x 10/06/2016" class="form-control w3-input w3-border w3-round-large"
					type="text"	name="condominio.dataVencimento" data-toggle="tooltip" title="Data de vencimento do condominio"
					pattern="dd/MM/yyyy" onkeypress="mascara(this,fdata)" maxlength="10" 
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataVencimento}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="dataPagamento">Data de Pagamento *</label>
				<input	id="dataPagamento"	class="form-control w3-input w3-border w3-round-large" type="text"
					name="condominio.dataPagamento" placeholder="e.x 10/06/2016" data-toggle="tooltip" title="Data de pagamento do condominio"
					pattern="dd/MM/yyyy" onkeypress="mascara(this,fdata)" maxlength="10"  
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${condominio.dataPagamento}"/>">

			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="numParcelas">N�mero de Parcelas</label>
				<input	id="numParcelas" class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.numParcelas" placeholder="e.x 12" data-toggle="tooltip" title="N�mero de parcelas do condominio"
					onkeypress="mascara(this,soNumeros)" maxlength="3"  value="${condominio.numParcelas}" />
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="parcelasPagas">Parcelas Pagas</label>
				<input	id="parcelasPagas"	class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.parcelasPagas" placeholder="e.x 12" data-toggle="tooltip" title="Parcelas pagas do condominio"
					onkeypress="mascara(this,soNumeros)" maxlength="3"  value="${condominio.parcelasPagas}" />
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="apartamento">Apartamento *</label>
				<select	class="form-control w3-input w3-border w3-round-large"
					id="apartamento" name="condominio.idApt" data-toggle="tooltip" title="Apartamento do condominio" style=" height : 39px;">
					<c:forEach var="a" items="${apartamentos}">
						<option value="${a.id}">${a.numeroApt}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-third conteudo">
				<label for="porcentagemJuros">Porcentagem de Juros *</label>
				<input	id="porcentagemJuros"	class="form-control w3-input w3-border w3-round-large"
					type="number" name="condominio.porcentagemJuros" placeholder="e.x 2" data-toggle="tooltip" title="porcentagem de juros do condominio"
					onkeypress="mascara(this,soNumeros)" maxlength="3" value="${condominio.porcentagemJuros}" />
			</div>
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<label for="totalPagar">Total a Pagar *</label>
			<input id="totalPagar" 	class="form-control w3-input w3-border w3-round-large" type="number"
				placeholder="e.x 120.00" data-toggle="tooltip" title="Total a pagar do condominio"
				name="condominio.totalPagar" onkeypress="mascara(this,soNumeros)" maxlength="40"  value="${condominio.totalPagar}" />
		</div>
	</div>
	<div class="w3-row-padding">
		<div class="w3-third conteudo" style="width: 371px;">
				<label for="pagouAtual" data-toggle="tooltip" title="Pago no m�s corrente do condominio">Pago no M�s Corrente</label>
				<input id="pagouAtual" class="w3-validate" type="checkbox"
				name="condominio.pagouAtual" value=true data-toggle="tooltip" title="Pago no m�s corrente do condominio" />
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-third conteudo">
			<button class="w3-btn w3-round w3-ripple" data-toggle="tooltip" title="Salvar registro do condominio"
			type="submit">Salvar</button>
		</div>
	</div>
	<h1 class="w3-text-white">Correcao</h1>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />