package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Condominio;

public class CondominioDao {

	private EntityManager manager;

	public CondominioDao() {

	}

	@Inject
	public CondominioDao(EntityManager manager) {
		this.manager = manager;
	}

	/* MÉTODOS VRAPTOR */
	public void adiciona(Condominio condominio) {
		if (condominio.getId() == 0) {
			manager.persist(condominio);
		} else {
			manager.merge(condominio);
		}
	}

	public void deleta(long id) {
		manager.remove(manager.getReference(Condominio.class, id));
	}

	public Condominio busca(long id) {
		return manager.find(Condominio.class, id);
	}

	public List<Condominio> lista() {
		TypedQuery<Condominio> query = manager.createQuery("select cond from Condominio cond", Condominio.class);
		return query.getResultList();
	}

}
