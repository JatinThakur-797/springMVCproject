package springMVCproject.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "user_details")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "username", length = 255, nullable = false, unique = true)
	private String username;
	@Column(name = "email", length = 255, nullable = false, unique = true)
	private String email;
	private String password;

	// one-to-one link to UserAccounts
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private UserAccounts userAccount;

	public int getId() {
		return id;
	}

	public UserAccounts getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccounts userAccount) {
		this.userAccount = userAccount;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Transient
	private String confirmPassword;

	@Transient
	private boolean isLogin;

	public String getUsername() {
		return username;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", createPassword=" + password + ", email=" + email + ", confirmPassword="
				+ confirmPassword + ", isLogin=" + isLogin + "]";
	}

	public User(String username, String password, String email, String confirmPassword, boolean isLogin) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.confirmPassword = confirmPassword;
		this.isLogin = isLogin;
	}

	public User() {
		super();
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

}
