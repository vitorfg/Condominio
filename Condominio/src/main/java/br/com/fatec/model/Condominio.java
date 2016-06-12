package br.com.fatec.model;

import java.util.ArrayList;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Condominio {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@NotNull
	private String dataReferencia;

	@NotNull
	private String dataEmissao;

	@NotNull
	private Calendar dataVencimento;

	@NotNull
	private Calendar dataPagamento;
	
	@NotNull
	private Apartamento apartamento;
	
//	@NotNull
//	private DespesaComum despesaComum;
//	
//	@NotNull
//	private ArrayList<DespesasEspecificas> despesasEspecificas;
	
	@NotEmpty
	private boolean late;
	
	@NotEmpty
	private boolean pagouAtual;

	@NotEmpty
	private double porecentagemJuros;

	@NotEmpty
	private double totalPagar;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDataReferencia() {
		return dataReferencia;
	}

	public void setDataReferencia(String dataReferencia) {
		this.dataReferencia = dataReferencia;
	}

	public String getDataEmissao() {
		return dataEmissao;
	}

	public void setDataEmissao(String dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

	public Calendar getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Calendar dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public Calendar getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Calendar dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Apartamento getApartamento() {
		return apartamento;
	}

	public void setApartamento(Apartamento apartamento) {
		this.apartamento = apartamento;
	}

//	public DespesaComum getDespesaComum() {
//		return despesaComum;
//	}
//
//	public void setDespesaComum(DespesaComum despesaComum) {
//		this.despesaComum = despesaComum;
//	}
//
//	public ArrayList<DespesasEspecificas> getDespesasEspecificas() {
//		return despesasEspecificas;
//	}
//
//	public void setDespesasEspecificas(ArrayList<DespesasEspecificas> despesasEspecificas) {
//		this.despesasEspecificas = despesasEspecificas;
//	}

	public boolean isLate() {
		return late;
	}

	public void setLate(boolean late) {
		this.late = late;
	}
	

	public boolean isPagouAtual() {
		return pagouAtual;
	}

	public void setPagouAtual(boolean pagouAtual) {
		this.pagouAtual = pagouAtual;
	}

	public double getPorecentagemJuros() {
		return porecentagemJuros;
	}

	public void setPorecentagemJuros(double porecentagemJuros) {
		this.porecentagemJuros = porecentagemJuros;
	}

	public double getTotalPagar() {
		return totalPagar;
	}

	public void setTotalPagar(double totalPagar) {
		this.totalPagar = totalPagar;
	}
	
}
