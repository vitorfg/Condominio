<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Apartamentos</h1>

<div class="w3-responsive">
	<table class="w3-table w3-striped w3-bordered w3-border">
	<thead>
		<tr>
			<th>Id</th>
			<th>Número</th>
			<th>Proprietário</th>
			<th>Editar</th>
			<th>Remover</th>
		</tr>
	</thead>
	<font color = "red"> ${message}</font>
	<tbody>
		<c:forEach items="${apartamentos}" var="a">
			<c:set var="id" value="${a.id}" scope="request"></c:set>
			<tr>
				<td>${a.id}</td>
				<td>${a.numeroApt}</td>
				<td>${a.proprietario.nomeProprietario}</td>

				<td><a href="${linkTo[ApartamentoController].altera(a.id)}">
							<button class="w3-btn btn-link"  name="_method">
							<span class="fa fa-file-text"></span>
							</button>
				</a></td>
				<td>
					<form action="${linkTo[ApartamentoController].deleta(a.id)}"
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