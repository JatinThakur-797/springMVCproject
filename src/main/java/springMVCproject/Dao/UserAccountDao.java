package springMVCproject.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVCproject.model.AccountsManager;
import springMVCproject.model.User;
import springMVCproject.model.UserAccounts;

@Repository
public class UserAccountDao {

	private final SessionFactory sessionFactory;

	@Autowired
	public UserAccountDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(UserAccounts account) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(account);
	}

	public void updateAccountsManager(AccountsManager accountsManager) {
		Session session = this.sessionFactory.getCurrentSession();

		session.merge(accountsManager);
	}

	public UserAccounts findByUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<UserAccounts> query = session.createQuery("FROM UserAccounts WHERE user.id = :userId",
				UserAccounts.class);
		query.setParameter("userId", user.getId());
		return query.uniqueResultOptional().orElse(null);
	}

	public boolean isPanCardExists(String panCard) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(ua) FROM UserAccounts ua WHERE ua.panCard = :pan",
				Long.class);
		query.setParameter("pan", panCard);
		return query.getSingleResult() > 0;
	}

	public boolean isAdhaarExists(String aadhaarCard) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(ua) FROM UserAccounts ua WHERE ua.aadhaarCard = :aadhaar",
				Long.class);
		query.setParameter("aadhaar", aadhaarCard);
		return query.getSingleResult() > 0;
	}

	public boolean isUserAccountExists(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(ua) FROM UserAccounts ua WHERE ua.user.id = :userId",
				Long.class);
		query.setParameter("userId", user.getId());
		return query.getSingleResult() > 0;
	}

	public void change_pin(UserAccounts accounts) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(accounts);
	}
}