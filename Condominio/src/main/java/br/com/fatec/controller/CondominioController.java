package br.com.fatec.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.CondominioDao;
import br.com.fatec.model.Apartamento;
import br.com.fatec.model.Condominio;

@Controller
public class CondominioController {

	private CondominioDao condominioDao;
	private Validator validator;
	private Result result;
	private Condominio condominio;
	private ArrayList<Double> despesasEspecificas;

	public CondominioController(Apartamento apartamento, Calendar dataVencimento/*, Despesa despesaComum*/, ArrayList<Double> despesasEspecificas) {
		condominio.setApartamento(apartamento);
		condominio.setDataVencimento(dataVencimento);
		condominio.setDataReferencia(getDataAtual("MM/yyyy"));
		condominio.setDataEmissao(getDataAtual("dd/MM/yyyy"));
		this.despesasEspecificas = despesasEspecificas;
//		condominio.setDespesa(despesaComum.getValor() + calcDespesasEspecificas());
	}
	
	private double calcDespesasEspecificas() {
		double total = 0;
		
		for (double desp : despesasEspecificas) {
			total += desp;
		}
		
		return total;
	}

	private String getDataAtual(String format) {
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		Calendar calendar = new GregorianCalendar();
		Date data = new Date();
		calendar.setTime(data);

		return fmt.format(calendar.getTime());
	}

	public double getTotal() {
		condominio.setTotalPagar(condominio.getValorDespesas() + juros());
		return condominio.getTotalPagar();
	}

	private double juros() {

		if (condominio.getDataVencimento().get(Calendar.MONTH) == condominio.getDataPagamento().get(Calendar.MONTH)) {
			if ((condominio.getDataPagamento().get(Calendar.DAY_OF_MONTH)
					- condominio.getDataVencimento().get(Calendar.DAY_OF_MONTH)) > 0) {
//				return condominio.getDespesa() * 0.02;
			}
		} else if (condominio.getDataVencimento().get(Calendar.MONTH) < condominio.getDataPagamento()
				.get(Calendar.MONTH)) {
			if (((condominio.getDataPagamento().get(Calendar.DAY_OF_MONTH) + 30)
					- condominio.getDataVencimento().get(Calendar.DAY_OF_MONTH)) > 0) {
//				return condominio.getDespesa() * 0.05;
			}
		}

		return 0;
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
		validator.onErrorForwardTo(this).form();
		// condominioDao.adiciona(condominio);
		// result.redirectTo(this).lista();
	}

}
