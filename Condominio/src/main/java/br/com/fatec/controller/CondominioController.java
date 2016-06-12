package br.com.fatec.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.CondominioDao;
import br.com.fatec.model.Condominio;

@Controller
public class CondominioController {

	private CondominioDao condominioDao;
	private Validator validator;
	private Result result;

	public CondominioController() {
	}

	@Inject
	public CondominioController(CondominioDao condominioDao, Validator validator, Result result) {
		this.condominioDao = condominioDao;
		this.validator = validator;
		this.result = result;
	}

	public void form() {
	}

	@IncludeParameters
	@Post
	public void adiciona(Condominio condominio) {
		validator.onErrorForwardTo(this).form(); // caso der erro fica na tela
													// que está
		// condominioDao.adiciona(condominio); // adiciona
		// result.redirectTo(this).lista(); // redireciona para a lista
	}

}
