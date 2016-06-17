<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container">
	<h1>Proprietários</h1>

	<a href="${linkTo[ProprietarioController].form()}"></a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>CPF</th>
				<th>Telefone</th>
				<th>Editar</th>
				<th>Remover</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${proprietarios}" var="p">
				<c:set var="id" value="${p.id}" scope="request"></c:set>
				<tr>
					<td>${p.id}</td>
					<td>${p.nomeProprietario}</td>
					<td>${p.cpf}</td>
					<td>${p.fone1}</td>

					<td><a href="${linkTo[ProprietarioController].altera(p.id)}">
							<span class="glyphicon glyphicon-pencil"></span>
					</a></td>
					<td>
						<form action="${linkTo[ProprietarioController].deleta(p.id)}"
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