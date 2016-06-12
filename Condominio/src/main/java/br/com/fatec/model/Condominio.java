package br.com.fatec.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Condominio {

	private Apartamento apartamento;

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

	public double getValorDespesas() {
		return valorDespesas;
	}

	public void setValorDespesas(double valorDespesas) {
		this.valorDespesas = valorDespesas;
	}

	@NotEmpty
	private double valorDespesas; //Linha a descomentar quando criada a classe Despesa | Criar get/set

	@NotEmpty
	private double jurosAtraso;

	@NotEmpty
	private double totalPagar;

	@NotNull
	private Apartamento apt;

	public Apartamento getApartamento() {
		return apartamento;
	}

	public void setApartamento(Apartamento apartamento) {
		this.apartamento = apartamento;
	}

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

	public double getJurosAtraso() {
		return jurosAtraso;
	}

	public void setJurosAtraso(double jurosAtraso) {
		this.jurosAtraso = jurosAtraso;
	}

	public double getTotalPagar() {
		return totalPagar;
	}

	public void setTotalPagar(double totalPagar) {
		this.totalPagar = totalPagar;
	}

	public Apartamento getApt() {
		return apt;
	}

	public void setApt(Apartamento apt) {
		this.apt = apt;
	}

}
