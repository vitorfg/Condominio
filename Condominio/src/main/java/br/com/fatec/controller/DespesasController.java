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
	private ApartamentoDao apartamentoDao;

	@Inject
	public DespesasController(DespesasDao despesasDao, Validator validator, Result result, CondominioDao condominioDao,
			ApartamentoDao apartamentoDao) {
		this.despesasDao = despesasDao;
		this.validator = validator;
		this.result = result;
		this.condominioDao = condominioDao;
		this.apartamentoDao = apartamentoDao;
	}

	public DespesasController() {

	}

	private void populaCombo() {
		List<Condominio> condominios = condominioDao.lista();
		result.include("condominios", condominios);
	}

	/* MÉTODOS VRAPTOR */
	public void form() {
		populaCombo();
	}

	public void lista() {
		List<Despesas> despesas = despesasDao.lista();
		result.include("despesas", despesas);
	}

	@IncludeParameters
	@Post
	public void adiciona(Despesas despesas) {
		despesas.setCondominio(condominioDao.busca(despesas.getIdCond()));
		validator.onErrorForwardTo(this).form();
		despesas = carregaDespesas(despesas);
		despesasDao.adiciona(despesas);
		despesas.getCondominio().setTotalPagar(despesas.getCondominio().getTotalPagar() + despesas.getValorCobrado());
		condominioDao.adiciona(despesas.getCondominio());
		result.redirectTo(this).lista();
	}

	/*A Fim de manter a integridade do sistema, uma despesa lançada não poderá ser alterada
	 * Caso seja necessário, a pessoa deverá excluir a despesa e lança-la novamente
	@Get("/despesa/{id}")
	public void altera(long id) {
		populaCombo();
		Despesas despesa = despesasDao.busca(id);
		despesa = carregaDespesas(despesa);
		result.include("despesas", despesa);
		result.of(this).form();
	}*/

	@Delete("/despesa/{id}")
	public void deleta(long id) {
		Despesas despesa = despesasDao.busca(id);
		despesasDao.deleta(id);
		despesa.getCondominio().setTotalPagar(despesa.getCondominio().getTotalPagar() - despesa.getValorCobrado());
		condominioDao.adiciona(despesa.getCondominio());
		result.include("message", "Exclusão realizada com sucesso");
		result.redirectTo(this).lista();
	}

	/* MÉTODOS ESPECÍFICOS */
	private Despesas carregaDespesas(Despesas despesas) {
		despesas.setValorCobrado(geraValorCobrado(despesas));
		return despesas;
	}

	private int geraNumTotalApartamentos() {
		List<Apartamento> apts = apartamentoDao.lista();
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
