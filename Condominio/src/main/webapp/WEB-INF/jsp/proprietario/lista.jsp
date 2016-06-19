<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Proprietários</h1>

<div class="w3-responsive">
	<table class="w3-table w3-striped w3-bordered w3-border">
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
							<button class="w3-btn btn-link"  name="_method">
							<span class="fa fa-file-text"></span>
							</button>
					</a></td>
					<td>
						<form action="${linkTo[ProprietarioController].deleta(p.id)}"
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