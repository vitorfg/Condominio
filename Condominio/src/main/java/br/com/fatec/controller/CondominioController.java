package br.com.fatec.controller;

import java.text.SimpleDateFormat;
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
	private Apartamento apartamento;
	private String dataReferencia, dataEmissao;
	private Calendar dataVencimento, dataPagamento;
	private double juros, totalAPagar, valorPago;
	//private DespesasComuns despesa;

	public CondominioController(Apartamento apartamento, Calendar dataVencimento) {
		this.apartamento = apartamento;
		this.dataVencimento = dataVencimento;
		
		dataReferencia = getDataAtual("MM/yyyy");
		dataEmissao = getDataAtual("dd/MM/yyyy");
		//despesa = new DespesaComum();
	}
	
	private String getDataAtual(String format) {
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		Calendar calendar = new GregorianCalendar();
		Date data = new Date();
		calendar.setTime(data);
		
		return fmt.format(calendar.getTime());
	}
	
	/*
	public double getTotal() {
		return despesas.getValor() + juros();
	}
	*/

	/* VERIFICAR!!
	private double juros() {

		if (dataVencimento.get(Calendar.MONTH) == dataPagamento.get(Calendar.MONTH)) {
			if ((dataPagamento.get(Calendar.DAY_OF_MONTH) - dataVencimento.get(Calendar.DAY_OF_MONTH)) > 0) {
				return despesa.getValor() * 0.02;
			}
		} else if (dataVencimento.get(Calendar.MONTH) < dataPagamento.get(Calendar.MONTH)) {
			if (((dataPagamento.get(Calendar.DAY_OF_MONTH) + 30) - dataVencimento.get(Calendar.DAY_OF_MONTH)) > 0) {
				return despesa.getValor() * 0.05;
			}
		} else {
			return 0;
		}

	}
	*/

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
