<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Condominio</h1>

<div class="w3-responsive">
	<table class="w3-table w3-striped w3-bordered w3-border">
	<thead>
		<tr>
			<th>Id</th>
			<th>Apartamentos</th>
			<th>Data De Referência</th>
			<th>Total a Pagar</th>
			<th>Editar</th>
			<th>Remover</th>
			<th></th>
		</tr>
	</thead>
	<font color = "red"> ${message}</font>
	<tbody>
		<c:forEach items="${condominios}" var="c">
			<c:set var="id" value="${c.id}" scope="request"></c:set>
			<tr>
				<td>${c.id}</td>
				<td>${c.apartamento.numeroApt}</td>
				<td>${c.totalPagar}</td>
				<td>${c.dataReferencia.time}</td>

				<td><a href="${linkTo[CondominioController].altera(c.id)}">
							<button class="w3-btn btn-link"  name="_method">
							<span class="fa fa-file-text"></span>
							</button>
				</a></td>
				<td>
					<form action="${linkTo[CondominioController].deleta(c.id)}"
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

<c:import url="/WEB-INF/jsp/footer.jsp" />