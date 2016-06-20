package br.com.fatec.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
public class CondominioController {

	private CondominioDao condominioDao;
	private Validator validator;
	private Result result;
	private DespesasController despesas;
	private ApartamentoDao apartamentoDao;
	private DespesasDao despesasDao;
	private Condominio cond;
	private Despesas desp;

	@Inject
	public CondominioController(CondominioDao condominioDao, Validator validator, Result result,
			ApartamentoDao apartamentoDao, DespesasDao despesasDao, Condominio cond, Despesas desp) {
		this.condominioDao = condominioDao;
		this.validator = validator;
		this.result = result;
		this.apartamentoDao = apartamentoDao;
		this.despesasDao = despesasDao;
		this.cond = cond;
		this.desp = desp;
	}

	public CondominioController() {

	}

	private void populaCombo() {
		List<Apartamento> apartamentos = apartamentoDao.lista();
		result.include("apartamentos", apartamentos);
	}

	/* MÉTODOS VRAPTOR */
	public void form() {
		populaCombo();
	}

	public void lista() {
		List<Condominio> condominios = condominioDao.lista();
		result.include("condominios", condominios);
	}

	@IncludeParameters
	@Post
	public void adiciona(Condominio condominio) {
		condominio.setApartamento(apartamentoDao.busca(condominio.getIdApt()));
		validator.onErrorForwardTo(this).form();
		try{
			condominio = carregaCondominio(condominio);
		} catch(NullPointerException e){}
		condominioDao.adiciona(condominio);
		result.redirectTo(this).lista();
	}

	@Get("/condominio/{id}")
	public void altera(long id) {
		populaCombo();
		Condominio condominio = condominioDao.busca(id);
		result.include("condominio", condominio);
		result.of(this).form();
	}

	@Delete("/condominio/{id}")
	public void deleta(long id) {
		boolean existe = false;
		List<Despesas> despesas = despesasDao.lista();
		Condominio cond = condominioDao.busca(id);
		try {
			for (Despesas d : despesas) {
				if (d.getCondominio().equals(cond)) {
					existe = true;
				}
			}
			if (existe == true) {
				result.include("message", "Erro ao excluir Condominio! Condominio possui Despesas");
				result.redirectTo(this).lista();
			} else {
				condominioDao.deleta(id);
				result.include("message", "Exclusão realizada com sucesso");
				result.redirectTo(this).lista();
			}
		} catch (NullPointerException e) {
			condominioDao.deleta(id);
			result.include("message", "Exclusão realizada com sucesso");
			result.redirectTo(this).lista();
		}

	}

	/* MÉTODOS ESPECÍFICOS */
	private double geraTotalPagar() {
		double taxa = 1;

		if ((cond.getDataVencimento().compareTo(cond.getDataPagamento()) < 0)) {
			if (cond.isPagouAtual()) {
				taxa = 1.02;
			} else {
				despesas.adiciona(carregaDespesas(cond));
			}
		}

		return (cond.getTotalPagar() * taxa);
	}

	private double geraJuros() {
		Condominio cond = new Condominio();
		double taxa = 1;
		
		if ((cond.getDataVencimento().compareTo(cond.getDataPagamento()) < 0)) {
			if (cond.isPagouAtual()) {
				taxa = 0.02;
			} else {
				taxa = 0.05;
			}

		}
		return taxa;
	}

	private Despesas carregaDespesas(Condominio condominio) {

		desp.setDescricao("Multa de 5% referente ao mês anterior");
		desp.setValorCobrado(geraTotalPagar());
		desp.setValorDespesa(desp.getValorCobrado());
		desp.setEspecifico(true);
		desp.setDataReferencia(geraDataMesSeg());
		desp.setCondominio(geraCondominioMesSeguinte(condominio));

		return desp;
	}

	private Calendar geraDataMesSeg() {
		Calendar dataCobranca = new GregorianCalendar();
		dataCobranca.setTime(new Date());
		dataCobranca.add(Calendar.MONTH, 1);

		return dataCobranca;
	}

	private Condominio geraCondominioMesSeguinte(Condominio condominioMesPassado) {
		Condominio condominioMesSeguinte = new Condominio();

		condominioMesSeguinte.setApartamento(condominioMesPassado.getApartamento());
		condominioMesSeguinte.setDataReferencia(geraDataMesSeg());
		new CondominioDao().adiciona(condominioMesSeguinte);

		return condominioMesSeguinte;
	}

	private Condominio carregaCondominio(Condominio condominio) {
		condominio.setPorcentagemJuros(geraJuros());
		condominio.setTotalPagar(geraTotalPagar());

		return condominio;
	}
}
