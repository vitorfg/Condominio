<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container">
	<h1>Despesas</h1>

	<a href="${linkTo[DespesasController].form()}"></a>
	<table class="table table-hover">
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
		<tbody>
			<c:forEach items="${despesas}" var="d">
				<c:set var="id" value="${d.id}" scope="request"></c:set>
				<tr>
					<td>${d.id}</td>
					<td>${d.descricao}</td>
					<td>${d.valorDespesa}</td>
					<td>${d.dataReferencia}</td>

					<td><a href="${linkTo[DespesasController].altera(d.id)}">
							<span class="glyphicon glyphicon-pencil"></span>
					</a></td>
					<td>
						<form action="${linkTo[DespesasController].deleta(d.id)}"
							method="POST">
							<button class="btn btn-link" type="submit" name="_method"
								value="DELETE">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />