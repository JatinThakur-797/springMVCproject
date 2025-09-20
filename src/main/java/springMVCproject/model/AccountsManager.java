package springMVCproject.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "accounts_manager")
public class AccountsManager {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private double balance = 0.0;

	public void deposite(double amount) {
		if (amount > 0) {
			this.balance += amount;
		}
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "AccountsManager [id=" + id + ", balance=" + balance + "]";
	}
}