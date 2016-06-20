package br.com.fatec.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
public class Condominio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@NotNull
	@Temporal(TemporalType.DATE)
	private Calendar dataReferencia;

	@NotNull
	@Temporal(TemporalType.DATE)
	private Calendar dataEmissao;
	
	@NotNull
	@Temporal(TemporalType.DATE)
	private Calendar dataVencimento;

	@Temporal(TemporalType.DATE)
	private Calendar dataPagamento;

	private int numParcelas;

	private int parcelasPagas;

	@ManyToOne
	private Apartamento apartamento;

	private long idApt;

	private boolean pagouAtual;

	private double porcentagemJuros;

	private double totalPagar;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Calendar getDataReferencia() {
		return dataReferencia;
	}

	public void setDataReferencia(Calendar dataReferencia) {
		this.dataReferencia = dataReferencia;
	}

	public Calendar getDataEmissao() {
		return dataEmissao;
	}

	public void setDataEmissao(Calendar dataEmissao) {
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

	public int getNumParcelas() {
		return numParcelas;
	}

	public void setNumParcelas(int numParcelas) {
		this.numParcelas = numParcelas;
	}

	public int getParcelasPagas() {
		return parcelasPagas;
	}

	public void setParcelasPagas(int parcelasPagas) {
		this.parcelasPagas = parcelasPagas;
	}

	public Apartamento getApartamento() {
		return apartamento;
	}

	public void setApartamento(Apartamento apartamento) {
		this.apartamento = apartamento;
	}

	public long getIdApt() {
		return idApt;
	}

	public void setIdApt(long idApt) {
		this.idApt = idApt;
	}

	public boolean isPagouAtual() {
		return pagouAtual;
	}

	public void setPagouAtual(boolean pagouAtual) {
		this.pagouAtual = pagouAtual;
	}

	public double getPorcentagemJuros() {
		return porcentagemJuros;
	}

	public void setPorcentagemJuros(double porcentagemJuros) {
		this.porcentagemJuros = porcentagemJuros;
	}

	public double getTotalPagar() {
		return totalPagar;
	}

	public void setTotalPagar(double totalPagar) {
		this.totalPagar = totalPagar;
	}
}
