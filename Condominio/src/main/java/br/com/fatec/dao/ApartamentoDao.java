package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Apartamento;

public class ApartamentoDao {

	private EntityManager manager;

	public ApartamentoDao() {
	}

	@Inject
	public ApartamentoDao(EntityManager manager) {
		this.manager = manager;
	}

	/* MÉTODOS VRAPTOR */
	public void adiciona(Apartamento apartamento) {
		if (apartamento.getId() == 0) {
			manager.persist(apartamento);
		} else {
			manager.merge(apartamento);
		}
	}

	public void deleta(long id) {
		manager.remove(manager.getReference(Apartamento.class, id));
	}

	public Apartamento busca(long id) {
		return manager.find(Apartamento.class, id);
	}

	public List<Apartamento> lista() {
		TypedQuery<Apartamento> query = manager.createQuery("select apto from Apartamento apto", Apartamento.class);
		return query.getResultList();
	}

}
