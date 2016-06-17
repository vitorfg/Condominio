package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Despesas;

public class DespesasDao {

	private EntityManager manager;

	public DespesasDao() {
	}

	@Inject
	public DespesasDao(EntityManager manager) {
		this.manager = manager;
	}

	/* MÉTODOS VRAPTOR */
	public void adiciona(Despesas despesas) {
		if (despesas.getId() == 0) {
			manager.persist(despesas);
		} else {
			manager.merge(despesas);
		}
	}

	public void deleta(long id) {
		manager.remove(manager.getReference(Despesas.class, id));
	}

	public Despesas busca(long id) {
		return manager.find(Despesas.class, id);
	}

	public List<Despesas> lista() {
		TypedQuery<Despesas> query = manager.createQuery("select desp from Despesas desp", Despesas.class);
		return query.getResultList();
	}

}