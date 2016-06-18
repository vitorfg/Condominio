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
import br.com.fatec.dao.CondominioDao;
import br.com.fatec.dao.DespesasDao;
import br.com.fatec.model.Apartamento;
import br.com.fatec.model.Condominio;
import br.com.fatec.model.Despesas;

@Controller
public class DespesasController {

	private DespesasDao despesasDao;
	private Validator validator;
	private Result result;
	private CondominioDao condominioDao;

	@Inject
	public DespesasController(DespesasDao despesasDao, Validator validator, Result result,CondominioDao condominioDao) {
		this.despesasDao = despesasDao;
		this.validator = validator;
		this.result = result;
		this.condominioDao = condominioDao;
	}
	
	public DespesasController() {
	
	}

	/* MÉTODOS VRAPTOR */
	public void form() {
		List<Condominio> condominios = condominioDao.lista();
		result.include("condominios", condominios);
	}

	public void lista() {
		List<Despesas> despesas = despesasDao.lista();
		result.include("despesas", despesas);
	}
	
	@IncludeParameters
	@Post
	public void adiciona(Despesas despesas) {
		validator.onErrorForwardTo(this).form();
		despesas = carregaDespesas(despesas);
		despesasDao.adiciona(despesas);
		result.redirectTo(this).lista();
	}

	@Get("/despesa/{id}")
	public void altera(long id) {
		Despesas despesa = despesasDao.busca(id);
		result.include("despesa", despesa);
		result.of(this).lista();
	}

	@Delete("/despesa/{id}")
	public void deleta(long id) {
		despesasDao.deleta(id);
		result.redirectTo(this).lista();
	}

	/* MÉTODOS ESPECÍFICOS */
	private Despesas carregaDespesas(Despesas despesas) {
		despesas.setValorCobrado(geraValorCobrado(despesas));

		return despesas;
	}

	private int geraNumTotalApartamentos() {
		ApartamentoDao aptDao = new ApartamentoDao();
		List<Apartamento> apts = aptDao.lista();
		int totalQuartos = 0;

		for (Apartamento apt : apts) {
			totalQuartos += apt.getQtdQuartos();
		}

		return totalQuartos;
	}

	private double geraValorCobrado(Despesas despesas) {
		if (despesas.isEspecifico() == true) {
			return despesas.getValorDespesa();
		}
		return (despesas.getValorDespesa() / geraNumTotalApartamentos())
				* despesas.getCondominio().getApartamento().getQtdQuartos();
	}

}
