package springMVCproject.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVCproject.Dao.UserDao;
import springMVCproject.model.User;

@Service
public class UserService {

	private final UserDao userDao;

	@Autowired
	public UserService(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional
	public void createUser(User user) {

		this.userDao.saveUser(user);
	}

	@Transactional(readOnly = true)
	public User authenticateUser(String username, String plainTextPassword) {
		User user = userDao.findByUsername(username);

		if (user != null && user.getPassword().equals(plainTextPassword)) {
			return user;
		}

		return null;
	}

	@Transactional(readOnly = true)
	public boolean usernameExist(String username) {
		return this.userDao.isUsernameExists(username);
	}

	@Transactional(readOnly = true)
	public boolean emailExist(String email) {
		return this.userDao.isEmailExists(email);
	}
}