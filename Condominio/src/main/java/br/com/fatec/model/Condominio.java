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

	@Temporal(TemporalType.DATE)
	private Calendar dataEmissao;

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

	private Calendar strToCal(String strDate, String format) throws ParseException {
		Date date = (Date) new SimpleDateFormat(format).parse(strDate);
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
			dataReferencia = strToCal(strDataReferencia, "dd/MM/yyyy");
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
			dataEmissao = strToCal(strDataEmissao, "MM/yyyy");
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Calendar getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(String strDataVencimento) {
		try {
			dataVencimento = strToCal(strDataVencimento, "dd/MM/yyyy");
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
