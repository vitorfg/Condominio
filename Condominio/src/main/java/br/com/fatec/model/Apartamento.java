package br.com.fatec.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

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

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getNumeroApt() {
		return numeroApt;
	}

	public void setNumeroApt(int numeroApt) {
		this.numeroApt = numeroApt;
	}

	public int getQtdQuartos() {
		return qtdQuartos;
	}

	public void setQtdQuartos(int qtdQuartos) {
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

}
