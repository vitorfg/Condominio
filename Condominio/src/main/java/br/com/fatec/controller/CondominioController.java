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

	@Inject
	public CondominioController(CondominioDao condominioDao, Validator validator, Result result,
			ApartamentoDao apartamentoDao) {
		this.condominioDao = condominioDao;
		this.validator = validator;
		this.result = result;
		this.apartamentoDao = apartamentoDao;
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
		condominio = carregaCondominio(condominio);
		condominioDao.adiciona(condominio);
		result.redirectTo(this).lista();
	}

	@Get("/condominio/{id}")
	public void altera(long id) {
		populaCombo();

		Condominio condominio = condominioDao.busca(id);
		result.include("condominio", condominio);
		result.of(this).lista();
	}

	@Delete("/condominio/{id}")
	public void deleta(long id) {
		condominioDao.deleta(id);
		result.redirectTo(this).lista();
	}

	/* MÉTODOS ESPECÍFICOS */
	private Condominio carregaCondominio(Condominio condominio) {
		condominio.setLate(atrasou(condominio));
		condominio.setPorcentagemJuros(defineJuros(condominio));
		condominio.setTotalPagar(geraValorPagamentoComJuros(condominio));

		return condominio;
	}

	private double geraValorPagamentoSemJuros(Condominio condominio) {
		DespesasDao despesasDao = new DespesasDao();
		List<Despesas> despesas = despesasDao.lista();
		double valorDespesas = 0;

		for (Despesas d : despesas) {
			if (condominio.getDataReferencia().equals(d.getDataReferencia())) {
				valorDespesas += d.getValorCobrado();
			}
		}
		return valorDespesas;
	}

	private double geraValorPagamentoComJuros(Condominio condominio) {
		double valorSemJuros = geraValorPagamentoSemJuros(condominio), valorComJuros = 0;
		valorComJuros = valorSemJuros + valorSemJuros * condominio.getPorcentagemJuros();

		return valorComJuros;
	}

	private boolean atrasou(Condominio condominio) {
		if (condominio.getDataVencimento().compareTo(condominio.getDataPagamento()) < 0) {
			return true;
		} else {
			return false;
		}
	}

	private double defineJuros(Condominio condominio) {
		if (atrasou(condominio)) {
			if (condominio.isPagouAtual()) {
				return 0.02;
			} else {
				despesas.adiciona(carregaDespesas(condominio));
			}
		}
		return 0;

	}

	private Calendar geraDataMesSeg() {
		Calendar dataCobranca = new GregorianCalendar();
		dataCobranca.setTime(new Date());
		dataCobranca.add(Calendar.MONTH, 1);

		return dataCobranca;
	}

	private Despesas carregaDespesas(Condominio condominio) {
		Despesas desp = new Despesas();
		desp.setDescricao("Multa de 5% referente ao mês anterior");
		desp.setValorCobrado(geraValorPagamentoSemJuros(condominio) * 0.05);
		desp.setValorDespesa(desp.getValorCobrado());
		desp.setEspecifico(true);
		desp.setDataReferencia(geraDataMesSeg());
		desp.setCondominio(geraCondominioMesSeguinte(condominio));

		return desp;
	}

	private Condominio geraCondominioMesSeguinte(Condominio condominioMesPassado) {
		Condominio condominioMesSeguinte = new Condominio();
		condominioMesSeguinte.setApartamento(condominioMesPassado.getApartamento());
		condominioMesSeguinte.setDataReferencia(geraDataMesSeg());
		new CondominioDao().adiciona(condominioMesSeguinte);

		return condominioMesSeguinte;
	}

	private double gerarValorParcela(Condominio condominio) {
		return condominio.getTotalPagar() / condominio.getNumParcelas();
	}

}
