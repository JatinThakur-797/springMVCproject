package springMVCproject.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVCproject.Dao.UserAccountDao;
import springMVCproject.model.AccountsManager;
import springMVCproject.model.User;
import springMVCproject.model.UserAccounts;

@Service
public class UserAccountService {

	private final UserAccountDao userAccountDao;

	@Autowired
	public UserAccountService(UserAccountDao userAccountDao) {
		this.userAccountDao = userAccountDao;
	}

	@Transactional
	public void createAccount(UserAccounts account) {
		userAccountDao.save(account);
	}

	@Transactional
	public boolean makeDeposit(AccountsManager manager, double amount) {
		if (amount > 0) {
			double newBalance = manager.getBalance() + amount;
			manager.setBalance(newBalance);
			userAccountDao.updateAccountsManager(manager);
			return true; // Withdrawal successful
		}
		return false;
	}

	@Transactional(readOnly = true)
	public UserAccounts findAccountByUser(User user) {
		return this.userAccountDao.findByUser(user);
	}

	@Transactional(readOnly = true)
	public boolean panCardExist(String panCard) {
		return this.userAccountDao.isPanCardExists(panCard);
	}

	@Transactional(readOnly = true)
	public boolean adhaarExist(String aadhaarCard) {
		return this.userAccountDao.isAdhaarExists(aadhaarCard);
	}

	@Transactional(readOnly = true)
	public boolean userAccountExist(User user) {
		return this.userAccountDao.isUserAccountExists(user);
	}

	@Transactional
	public boolean withdraw(AccountsManager manager, double amount) {
		if (amount > 0 && manager.getBalance() >= amount) {
			double newBalance = manager.getBalance() - amount;
			manager.setBalance(newBalance);
			userAccountDao.updateAccountsManager(manager);
			return true; // Withdrawal successful
		}
		return false; // Insufficient funds
	}

	@Transactional
	public boolean changePin(UserAccounts userAccounts) {
		userAccountDao.change_pin(userAccounts);
		return true;
	}
}