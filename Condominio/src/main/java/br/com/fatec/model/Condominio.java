package br.com.fatec.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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

	@NotNull
	@Temporal(TemporalType.DATE)
	private Calendar dataPagamento;

	private int numParcelas;

	private int parcelasPagas;

	@ManyToOne
	private Apartamento apartamento;

	private long idApt;

	@NotEmpty
	private boolean late;

	@NotEmpty
	private boolean pagouAtual;

	@NotEmpty
	private double porcentagemJuros;

	@NotEmpty
	private double totalPagar;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	private Calendar strToCal(String strDate) throws ParseException {
		Date date = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(strDate);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);

		return cal;
	}

	public Calendar getDataReferencia() {
		Calendar dataReferencia = new GregorianCalendar();
		dataReferencia.setTime(new Date());
		dataReferencia.add(Calendar.MONTH, -1);

		return dataReferencia;
	}

	public void setDataReferencia(String strDataReferencia) {
		try {
			dataReferencia = strToCal(strDataReferencia);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public void setDataReferencia(Calendar dataReferencia) {
		this.dataReferencia = dataReferencia;
	}

	public Calendar getDataEmissao() {
		return new GregorianCalendar();
	}

	public void setDataEmissao(String strDataEmissao) {
		try {
			dataEmissao = strToCal(strDataEmissao);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Calendar getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(String strDataVencimento) {
		try {
			dataVencimento = strToCal(strDataVencimento);
		} catch (ParseException e) {
			e.printStackTrace();
		}
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

	public long getIdApt() {
		return idApt;
	}

	public void setIdApt(long idApt) {
		this.idApt = idApt;
	}

}
