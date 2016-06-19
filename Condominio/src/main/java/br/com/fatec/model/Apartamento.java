package br.com.fatec.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Apartamento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@NotNull
	private Integer numeroApt;

	@NotNull
	private Integer qtdQuartos;

	@NotNull
	private String tipoOcupacao;

	@ManyToOne
	private Proprietario proprietario;

	private long idProp;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getNumeroApt() {
		return numeroApt.intValue();
	}

	public void setNumeroApt(Integer numeroApt) {
		this.numeroApt = numeroApt;
	}

	public int getQtdQuartos() {
		return qtdQuartos.intValue();
	}

	public void setQtdQuartos(Integer qtdQuartos) {
		this.qtdQuartos = qtdQuartos;
	}

	public String getTipoOcupacao() {
		return tipoOcupacao;
	}

	public void setTipoOcupacao(String tipoOcupacao) {
		this.tipoOcupacao = tipoOcupacao;
	}

	public Proprietario getProprietario() {
		return proprietario;
	}

	public void setProprietario(Proprietario proprietario) {
		this.proprietario = proprietario;
	}

	public long getIdProp() {
		return idProp;
	}

	public void setIdProp(long idProp) {
		this.idProp = idProp;
	}

}
