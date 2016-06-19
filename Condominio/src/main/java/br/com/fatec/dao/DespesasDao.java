package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Despesas;

public class DespesasDao {

	private EntityManager manager;

	@Inject
	public DespesasDao(EntityManager manager) {
		this.manager = manager;
	}

	public DespesasDao() {

	}

	/* MÉTODOS VRAPTOR */
	public List<Despesas> lista() {
		TypedQuery<Despesas> query = manager.createQuery("select desp from Despesas desp", Despesas.class);
		return query.getResultList();
	}
	
	public void adiciona(Despesas despesas) {
		if (despesas.getId() == 0) {
			manager.persist(despesas);
		} else {
			manager.merge(despesas);
		}
	}

	public Despesas busca(long id) {
		return manager.find(Despesas.class, id);
	}
	
	public void deleta(long id) {
		manager.getTransaction().begin();
		manager.remove(manager.getReference(Despesas.class, id));
		manager.getTransaction().commit();
	}

	

	

}