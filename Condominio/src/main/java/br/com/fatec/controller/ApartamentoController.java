package br.com.fatec.controller;

import java.util.List;

import javax.inject.Inject;

import org.jboss.weld.context.http.HttpRequestContext;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.fatec.dao.ApartamentoDao;
import br.com.fatec.dao.CondominioDao;
import br.com.fatec.dao.ProprietarioDao;
import br.com.fatec.model.Apartamento;
import br.com.fatec.model.Condominio;
import br.com.fatec.model.Proprietario;

@Controller
public class ApartamentoController {

	private ApartamentoDao apartamentoDao;
	private Validator validator;
	private Result result;
	private ProprietarioDao proprietarioDao;
	private CondominioDao condominioDao;

	@Inject
	public ApartamentoController(ApartamentoDao apartamentoDao, Validator validator, Result result,
			ProprietarioDao proprietarioDao,CondominioDao condominioDao) {
		this.apartamentoDao = apartamentoDao;
		this.validator = validator;
		this.result = result;
		this.proprietarioDao = proprietarioDao;
		this.condominioDao = condominioDao;
	}

	public ApartamentoController() {

	}

	private void populaCombo(long id) {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		for (Proprietario p : proprietarios) {
			result.include("idSelected", id);
		}
		result.include("proprietarios", proprietarios);
	}
	
	private void populaCombo() {
		List<Proprietario> proprietarios = proprietarioDao.lista();
		result.include("proprietarios", proprietarios);
	}

	/* MÉTODOS VRAPTOR */
	public void form() {
		populaCombo();
	}

	public void lista() {
		List<Apartamento> apartamentos = apartamentoDao.lista();
		result.include("apartamentos", apartamentos);
	}

	@IncludeParameters
	@Post
	public void adiciona(Apartamento apartamento) {
		apartamento.setProprietario(proprietarioDao.busca(apartamento.getIdProp()));
		validator.onErrorForwardTo(this).form();
		List<Apartamento> apartamentos = apartamentoDao.lista();
		boolean existe = false;
		for(Apartamento a: apartamentos){
			if(a.getNumeroApt() == apartamento.getNumeroApt()){
				existe = true;
			}
		}
		if(existe == true){
			result.include("message","Não é possivel inserir o apartamento porque ele já existe");
			result.redirectTo(this).form();
		} else {
			apartamentoDao.adiciona(apartamento);
			result.include("message","Apartamento cadastrado com sucesso");
			result.redirectTo(this).lista();
		}				
	}

	@Get("apartamento/{id}")
	public void altera(long id) {
		populaCombo(id);

		Apartamento apartamento = apartamentoDao.busca(id);
		result.include("apartamento", apartamento);
		result.of(this).form();
	}

	@Delete("apartamento/{id}")
	public void deleta(long id) {
		boolean existe = false;
		List<Condominio> condominios = condominioDao.lista();
		Apartamento apt = apartamentoDao.busca(id);
		try{
			for(Condominio c:condominios){
				if(c.getApartamento().equals(apt)){
					existe = true;
				}
			}
			if(existe == true){
				result.include("message", "Erro ao excluir Apartamento! Desvincule o Apartamento do Condominio");
				result.redirectTo(this).lista();
			} else {
				apartamentoDao.deleta(id);
				result.include("message", "Exclusão realizada com sucesso");
				result.redirectTo(this).lista();	
			}
		} catch(NullPointerException e ){
			apartamentoDao.deleta(id);
			result.include("message", "Exclusão realizada com sucesso");
			result.redirectTo(this).lista();	
		}
		
	}

}
