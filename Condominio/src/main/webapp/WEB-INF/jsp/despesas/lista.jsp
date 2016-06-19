<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Despesas</h1>

<div class="w3-responsive">
	<table class="w3-table w3-striped w3-bordered w3-border">
	<thead>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Valor Da Despesa</th>
			<th>Data De Referência</th>
			<th>Editar</th>
			<th>Remover</th>
			<th></th>
		</tr>
	</thead>
	<font color = "red"> ${message}</font>
	<tbody>
		<c:forEach items="${despesas}" var="d">
			<c:set var="id" value="${d.id}" scope="request"></c:set>
			<tr>
				<td>${d.id}</td>
				<td>${d.descricao}</td>
				<td>${d.valorDespesa}</td>
				<td>${d.dataReferencia.time}</td>

				<td><a href="${linkTo[DespesasController].altera(d.id)}"> 
							<button class="w3-btn btn-link"  name="_method">
							<span class="fa fa-file-text"></span>
							</button>
				</a></td>
				<td>
					<form action="${linkTo[DespesasController].deleta(d.id)}"
						method="POST">
						<button class="w3-btn btn-link" type="submit" name="_method"
							value="DELETE">
							<span class="fa fa-trash"></span>
						</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />