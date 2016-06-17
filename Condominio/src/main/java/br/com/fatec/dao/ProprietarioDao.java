package br.com.fatec.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.fatec.model.Proprietario;

public class ProprietarioDao {

	private EntityManager manager;

	public ProprietarioDao() {
	}

	@Inject
	public ProprietarioDao(EntityManager manager) {
		this.manager = manager;
	}

	/* MÉTODOS VRAPTOR */
	public void adiciona(Proprietario proprietario) {
		if (proprietario.getId() == 0) {
			manager.persist(proprietario);
		} else {
			manager.merge(proprietario);
		}
	}

	public void deleta(long id) {
		manager.remove(manager.getReference(Proprietario.class, id));
	}

	public Proprietario busca(long id) {
		return manager.find(Proprietario.class, id);
	}

	public List<Proprietario> lista() {
		TypedQuery<Proprietario> query = manager.createQuery("select prop from Proprietario prop", Proprietario.class);
		return query.getResultList();
	}

}
