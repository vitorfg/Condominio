package br.com.fatec.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.ApartamentoDao;
import br.com.fatec.model.Apartamento;

@Controller
public class ApartamentoController {

	private ApartamentoDao apartamentoDao;
	private Validator validator;
	private Result result;
	
	
	
	public ApartamentoController() {
	}


	@Inject
	public ApartamentoController(ApartamentoDao apartamentoDao, Validator validator, Result result) {
		this.apartamentoDao = apartamentoDao;
		this.validator = validator;
		this.result = result;
	}



	public void form (){}
	
	
	@IncludeParameters
	@Post
	public void adiciona(Apartamento apartamento){
		validator.onErrorForwardTo(this).form(); //caso der erro fica na tela que está
		apartamentoDao.adiciona(apartamento); // adiciona
		//result.redirectTo(this).lista(); // redireciona para a lista
	}
	
	
}
