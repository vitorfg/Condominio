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
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private long id;
	
	@NotNull
	private Calendar dataEmissão;
	
	@NotNull
	private Calendar dataVencimento;
	
	@NotNull
	private Calendar dataPagamento;
	
	@NotEmpty
	private double valorDespesas;
	
	@NotEmpty
	private double jurosAtraso;
	
	@NotEmpty
	private double totalPagar;
	
	@NotNull
	private Apartamento apt;
	
	
	
}
