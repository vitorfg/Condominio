package br.com.fatec.controller;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.RollbackException;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.ApartamentoDao;
import br.com.fatec.dao.ProprietarioDao;
import br.com.fatec.model.Apartamento;
import br.com.fatec.model.Proprietario;

@Controller
public class ProprietarioController {

	private ProprietarioDao proprietarioDao;
	private Validator validator;
	private Result result;
	private ApartamentoDao apartamentoDao;

	@Inject
	ProprietarioController(ProprietarioDao proprietarioDao, Result result, Validator validator,
			ApartamentoDao apartamentoDao) {
		this.proprietarioDao = proprietarioDao;
		this.result = result;
		this.validator = validator;
		this.apartamentoDao = apartamentoDao;
	}

	public ProprietarioController() {

	}

	/* MÉTODOS VRAPTOR */
	public void form() {

	}

	public void lista() {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		result.include("proprietarios", proprietarios);
	}

	@IncludeParameters
	@Post
	public void adiciona(Proprietario proprietario) {
		validator.onErrorForwardTo(this).form();
		proprietarioDao.adiciona(proprietario);
		result.redirectTo(this).lista();
	}

	@Get("/proprietario/{id}")
	public void altera(long id) {
		Proprietario proprietario = proprietarioDao.busca(id);
		result.include("proprietario", proprietario);
		result.of(this).form();
	}

	@Delete("/proprietario/{id}")
	public void deleta(long id) {
		boolean existe = false;
		List<Apartamento> apartamentos = apartamentoDao.lista();
		Proprietario prop = proprietarioDao.busca(id);
		try {
			for (Apartamento a : apartamentos) {
				if (a.getProprietario().equals(prop)) {
					existe = true;
				}
			}
			if (existe == true) {
				result.include("message", "Erro ao excluir Proprietário! Desvincule o Proprietário do Apartamento");
				result.redirectTo(this).lista();
			} else {
				proprietarioDao.deleta(id);
				result.include("message", "Exclusão realizada com sucesso");
				result.redirectTo(this).lista();
			}
		} catch (NullPointerException e) {
			proprietarioDao.deleta(id);
			result.include("message", "Exclusão realizada com sucesso");
			result.redirectTo(this).lista();
		}
	}

}