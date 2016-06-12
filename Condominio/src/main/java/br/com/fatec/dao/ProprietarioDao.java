package br.com.fatec.dao;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.fatec.model.Proprietario;

public class ProprietarioDao {

	private EntityManager manager;

	public ProprietarioDao() {

	}

	@Inject
	public ProprietarioDao(EntityManager manager) {
		this.manager = manager;
	}

	public void adiciona(Proprietario proprietario) {
		if (proprietario.getId() == 0) {
			manager.persist(proprietario);
		} else {
			manager.merge(proprietario);
		}
	}

	public Proprietario busca(long id) {
		return manager.find(Proprietario.class, id);
	}

	public void deleta(long id) {
		manager.remove(manager.getReference(Proprietario.class, id));
	}
}
