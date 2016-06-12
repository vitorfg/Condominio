package br.com.fatec.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.ProprietarioDao;
import br.com.fatec.model.Proprietario;

public class ProprietarioController {

	private ProprietarioDao proprietarioDao;
	private Validator validator;
	private Result result;

	public ProprietarioController() {
	}

	@Inject
	ProprietarioController(ProprietarioDao proprietarioDao, Validator validator, Result result) {
		this.proprietarioDao = proprietarioDao;
		this.validator = validator;
		this.result = result;
	}

	public void form() {
	}

	@IncludeParameters
	@Post
	public void adiciona(Proprietario proprietario) {
		validator.onErrorForwardTo(this).form();
		// apartamentoDao.adiciona(proprietario);
		// result.redirectTo(this).lista();
	}
}
