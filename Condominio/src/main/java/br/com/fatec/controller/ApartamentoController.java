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
import br.com.fatec.dao.ApartamentoDao;
import br.com.fatec.dao.ProprietarioDao;
import br.com.fatec.model.Apartamento;
import br.com.fatec.model.Proprietario;

@Controller
public class ApartamentoController {

	private ApartamentoDao apartamentoDao;
	private Validator validator;
	private Result result;
	private ProprietarioDao proprietarioDao;

	

	@Inject
	public ApartamentoController(ApartamentoDao apartamentoDao, Validator validator, Result result,
			ProprietarioDao proprietarioDao) {
		this.apartamentoDao = apartamentoDao;
		this.validator = validator;
		this.result = result;
		this.proprietarioDao = proprietarioDao;
	}

	public ApartamentoController() {
	
	}
	
	/* MÉTODOS VRAPTOR */
	public void form() {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		result.include("proprietarios", proprietarios);
	}

	public void lista() {
		List<Apartamento> apartamentos = apartamentoDao.lista();
		result.include("apartamentos", apartamentos);
	}

	@IncludeParameters
	@Post
	public void adiciona(Apartamento apartamento) {
		validator.onErrorForwardTo(this).form();
		apartamentoDao.adiciona(apartamento);
		result.redirectTo(this).lista(); // mudar para .form()
	}

	@Get("apartamento/{id}")
	public void altera(long id) {
		Apartamento apartamento = apartamentoDao.busca(id);
		result.include("apartamento", apartamento);
		result.of(this).lista(); // mudar para .form()
	}

	@Delete("apartamento/{id}")
	public void deleta(long id) {
		apartamentoDao.deleta(id);
		result.redirectTo(this).lista();
	}

}
