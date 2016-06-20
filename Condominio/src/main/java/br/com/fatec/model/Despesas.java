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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Despesas {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@NotNull
	private String descricao;

	private double valorDespesa;

	private double valorCobrado;

	@NotNull
	@Temporal(TemporalType.DATE)
	private Calendar dataReferencia;

	
	private boolean especifico;

	@ManyToOne
	private Condominio condominio;

	private long idCond;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public double getValorDespesa() {
		return valorDespesa;
	}

	public void setValorDespesa(double valorDespesa) {
		this.valorDespesa = valorDespesa;
	}

	public double getValorCobrado() {
		return valorCobrado;
	}

	public void setValorCobrado(double valorCobrado) {
		this.valorCobrado = valorCobrado;
	}

	public Calendar getDataReferencia() {
		return dataReferencia;
	}

	public void setDataReferencia(Calendar dataReferencia) {
		this.dataReferencia = dataReferencia;
	}

	public boolean isEspecifico() {
		return especifico;
	}

	public void setEspecifico(boolean especifico) {
		this.especifico = especifico;
	}

	public Condominio getCondominio() {
		return condominio;
	}

	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
	}

	public long getIdCond() {
		return idCond;
	}

	public void setIdCond(long idCond) {
		this.idCond = idCond;
	}

}
