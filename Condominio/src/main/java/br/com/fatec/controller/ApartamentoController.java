package br.com.fatec.controller;

import java.util.List;

import javax.inject.Inject;

import org.jboss.weld.context.http.HttpRequestContext;

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

	private void populaCombo(long id) {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		for (Proprietario p : proprietarios) {
			result.include("idSelected", id);
		}
		result.include("proprietarios", proprietarios);
	}
	
	private void populaCombo() {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		result.include("proprietarios", proprietarios);
	}

	/* MÉTODOS VRAPTOR */
	public void form() {
		populaCombo();
	}

	public void lista() {
		List<Apartamento> apartamentos = apartamentoDao.lista();
		result.include("apartamentos", apartamentos);
	}

	@IncludeParameters
	@Post
	public void adiciona(Apartamento apartamento) {
		apartamento.setProprietario(proprietarioDao.busca(apartamento.getIdProp()));

		validator.onErrorForwardTo(this).form();
		apartamentoDao.adiciona(apartamento);
		result.redirectTo(this).lista();
	}

	@Get("apartamento/{id}")
	public void altera(long id) {
		populaCombo(id);

		Apartamento apartamento = apartamentoDao.busca(id);
		result.include("apartamento", apartamento);
		result.of(this).form();
	}

	@Delete("apartamento/{id}")
	public void deleta(long id) {
		apartamentoDao.deleta(id);
		result.redirectTo(this).lista();
	}

}
