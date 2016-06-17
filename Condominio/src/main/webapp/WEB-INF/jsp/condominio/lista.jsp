<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container">
	<h1>Condominio</h1>

	<a href="${linkTo[CondominioController].form()}"></a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Apartamentos</th>
				<th>Data De Referência</th>
				<th>Editar</th>
				<th>Remover</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${condominio}" var="c">
				<c:set var="id" value="${c.id}" scope="request"></c:set>
				<tr>
					<td>${c.id}</td>
					<td>${c.apartamento}</td>
					<td>${c.dataReferencia}</td>

					<td><a href="${linkTo[CondominioController].altera(c.id)}">
							<span class="glyphicon glyphicon-pencil"></span>
					</a></td>
					<td>
						<form action="${linkTo[CondominioController].deleta(c.id)}"
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