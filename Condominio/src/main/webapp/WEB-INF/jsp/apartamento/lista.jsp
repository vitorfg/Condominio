<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Apartamentos</h1>

<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Número</th>
			<th>Proprietário</th>
			<th>Editar</th>
			<th>Remover</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${apartamentos}" var="a">
			<c:set var="id" value="${a.id}" scope="request"></c:set>
			<tr>
				<td>${a.id}</td>
				<td>${a.numeroApt}</td>
				<td>${a.proprietario.nomeProprietario}</td>

				<td><a href="${linkTo[ApartamentoController].altera(a.id)}">
						<span class="glyphicon glyphicon-pencil"></span>
				</a></td>
				<td>
					<form action="${linkTo[ApartamentoController].deleta(a.id)}"
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

<c:import url="/WEB-INF/jsp/footer.jsp" />