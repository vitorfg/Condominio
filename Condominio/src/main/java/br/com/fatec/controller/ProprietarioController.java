package br.com.fatec.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.ProprietarioDao;
import br.com.fatec.model.Proprietario;

@Controller
public class ProprietarioController {

	private ProprietarioDao proprietarioDao;
	private Validator validator;
	private Result result;

	@Inject
	ProprietarioController(ProprietarioDao proprietarioDao, Result result, Validator validator) {
		this.proprietarioDao = proprietarioDao;
		this.result = result;
		this.validator = validator;
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
		proprietarioDao.deleta(id);
		result.redirectTo(this).lista();
	}
}
