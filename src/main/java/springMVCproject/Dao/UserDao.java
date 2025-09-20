package springMVCproject.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVCproject.model.User;

@Repository
public class UserDao {

	private final SessionFactory sessionFactory;

	@Autowired
	public UserDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void saveUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(user);
	}

	public User findByUsername(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("FROM User WHERE username = :uname", User.class);
		query.setParameter("uname", username);
		return query.uniqueResultOptional().orElse(null);
	}

	public boolean isUsernameExists(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(u) FROM User u WHERE u.username = :uname", Long.class);
		query.setParameter("uname", username);
		return query.getSingleResult() > 0;
	}

	public boolean isEmailExists(String email) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class);
		query.setParameter("email", email);
		return query.getSingleResult() > 0;
	}

}