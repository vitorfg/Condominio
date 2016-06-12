package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.fatec.model.Apartamento;

public class ApartamentoDao {

	private EntityManager manager;

	public ApartamentoDao() {

	}

	@Inject
	public ApartamentoDao(EntityManager manager) {
		this.manager = manager;
	}
	
	public List<Apartamento> lista(){
		//terminar metodo
		return null;
	}
	
	public void adiciona(Apartamento apartamento){ // se não possuir id insere  no banco, se possuir id altera
		if(apartamento.getId() == 0){
			manager.persist(apartamento);
		} else {
			manager.merge(apartamento);
		}
	}
	
	public Apartamento busca(long id){ // busca pelo id
		return manager.find(Apartamento.class, id);
	}
	
	public void deleta (long id){ // deleta pelo id
		manager.remove(manager.getReference(Apartamento.class, id));
	}
	
}
