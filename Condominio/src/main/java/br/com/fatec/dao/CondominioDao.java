package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Condominio;

public class CondominioDao {

	private EntityManager manager;

	@Inject
	public CondominioDao(EntityManager manager) {
		this.manager = manager;
	}
	
	public CondominioDao() {

	}
	
	/* MÉTODOS VRAPTOR */
	public List<Condominio> lista() {
		TypedQuery<Condominio> query = manager.createQuery("select cond from Condominio cond", Condominio.class);
		return query.getResultList();
	}
	
	public void adiciona(Condominio condominio) {
		if (condominio.getId() == 0) {
			manager.persist(condominio);
		} else {
			manager.merge(condominio);
		}
	}

	public Condominio busca(long id) {
		return manager.find(Condominio.class, id);
	}
	
	public void deleta(long id) {
		manager.remove(manager.getReference(Condominio.class, id));
	}

	

	

}
