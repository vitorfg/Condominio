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

	public CondominioController(Apartamento apartamento, Calendar dataVencimento, Condominio condominio) {
		condominio.setApartamento(apartamento);
		condominio.setDataVencimento(dataVencimento);
		condominio.setDataReferencia(getDataAtual("MM/yyyy"));
		condominio.setDataEmissao(getDataAtual("dd/MM/yyyy"));
		this.condominio = condominio;
	}
	


	private String getDataAtual(String format) {
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		Calendar calendar = new GregorianCalendar();
		Date data = new Date();
		calendar.setTime(data);

		return fmt.format(calendar.getTime());
	}

	/* NECESSITA DA CLASSE DESPESAS PARA AJUSTAR OS METODOS	
	public double getTotal() {
		condominio.setTotalPagar(condominio.getValorDespesas() + juros());
		return condominio.getTotalPagar();
	}
	
	private double calcDespesasEspecificas() {
		double total = 0;
		
		for (double desp : despesasEspecificas) {
			total += desp;
		}
		
		return total;
	}
	
		
	public void geraValorPagamento(){
		double valorDespesasEspecificas = 0, valorSemJuros = 0, valorComJuros;
		for(DespesasEspecificas de: condominio.getDesoesasEspecificas()){
			valorDespesasEspecificas += de.getValor();
		}
		valorSemJuros = condominio.getGetDespesaComum().getValor() + valorDespesasEspecificas;
		valorComJuros = valorSemJuros + valorSemJuros * condominio.getPorecentagemJuros();
		condominio.setTotalPagar(valorComJuros);
	}
	*/
	
	public boolean atrasou(){
		if(condominio.getDataVencimento().compareTo(condominio.getDataPagamento()) < 0 ){
			return true;
		} else{
			return false;
		}
	}
	
	public void defineJuros() {
		if(atrasou()){
			if (condominio.isPagouAtual()){
				condominio.setPorecentagemJuros(condominio.getPorecentagemJuros() + 0.02);
			} else {
				// instancia o condominio do mes que vem com o juros do mes passado;
			}
		} else {
			condominio.setPorecentagemJuros(condominio.getPorecentagemJuros());
		}
	
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
