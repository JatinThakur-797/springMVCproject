package springMVCproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import springMVCproject.Services.UserAccountService;
import springMVCproject.model.AccountsManager;
import springMVCproject.model.User;
import springMVCproject.model.UserAccounts;

@Controller
public class TransactionController {

	private final UserAccountService userAccountService;

	@Autowired
	public TransactionController(UserAccountService userAccountService) {
		this.userAccountService = userAccountService;
	}

	@GetMapping("/deposite")
	public String showDepositForm(HttpSession session, RedirectAttributes redirectAttributes) {
		// A user can be on this page in two valid scenarios:
		// 1. They are creating a new account (tempUserAccount exists)
		// 2. They have an existing account (userAccount exists)
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		if (session.getAttribute("userAccount") == null && session.getAttribute("tempUserAccount") == null) {
			redirectAttributes.addFlashAttribute("error", "You must create a bank account first.");
			return "redirect:/create-account";
		}
		return "deposite";
	}

	@PostMapping("/deposite-submit")
	public String depositeSubmit(@RequestParam("amount") double amount, @RequestParam("securityPin") String securityPin,
			HttpSession session, RedirectAttributes redirectAttributes) {

		UserAccounts tempAccount = (UserAccounts) session.getAttribute("tempUserAccount");
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (tempAccount != null && loggedInUser != null) {
			// This is an INITIAL deposit
			if (amount <= 0) {
				redirectAttributes.addFlashAttribute("error", "Initial deposit must be greater than 0.");
				return "redirect:/deposite";
			}
			if (!securityPin.equals(tempAccount.getSecurityPin())) {
				redirectAttributes.addFlashAttribute("error", "Incorrect Security PIN.");
				return "redirect:/deposite";
			}

			tempAccount.getAccountsManager().deposite(amount);

			try {
				userAccountService.createAccount(tempAccount);
				UserAccounts finalAccount = userAccountService.findAccountByUser(loggedInUser);
				session.setAttribute("userAccount", finalAccount);
				session.setAttribute("accountsManager", finalAccount.getAccountsManager());
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "Error creating account.");
				return "redirect:/create-account";
			}

			session.removeAttribute("tempUserAccount");
			return "redirect:/account-success";

		} else {
			// This is a REGULAR deposit
			UserAccounts userAccount = (UserAccounts) session.getAttribute("userAccount");
			AccountsManager accountsManager = (AccountsManager) session.getAttribute("accountsManager");

			if (userAccount == null || accountsManager == null || loggedInUser == null) {
				return "redirect:/login";
			}
			if (amount <= 0) {
				redirectAttributes.addFlashAttribute("error", "Deposit amount must be greater than zero.");
				return "redirect:/deposite";
			}
			if (!userAccount.getSecurityPin().equals(securityPin)) {
				redirectAttributes.addFlashAttribute("error", "Incorrect Security PIN.");
				return "redirect:/deposite";
			}

			try {
				userAccountService.makeDeposit(accountsManager, amount);
				UserAccounts updatedAccount = userAccountService.findAccountByUser(loggedInUser);
				session.setAttribute("userAccount", updatedAccount);
				session.setAttribute("accountsManager", updatedAccount.getAccountsManager());

				redirectAttributes.addFlashAttribute("showDepositSuccessPopup", true);
				redirectAttributes.addFlashAttribute("depositAmount", amount);
				return "redirect:/deposite";
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "An error occurred during the transaction.");
				return "redirect:/deposite";
			}
		}
	}

	@GetMapping("/check-balance")
	public String showCheckBalanceForm(HttpSession session, RedirectAttributes redirectAttributes) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		if (session.getAttribute("userAccount") == null) {
			redirectAttributes.addFlashAttribute("error", "You must create a bank account to check a balance.");
			return "redirect:/create-account";
		}
		return "check_balance";
	}

	@PostMapping("/check-balance-submit")
	public String checkBalanceSubmit(@RequestParam("securityPin") String securityPin, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserAccounts userAccount = (UserAccounts) session.getAttribute("userAccount");
		if (userAccount == null) {
			return "redirect:/login";
		}
		if (!userAccount.getSecurityPin().equals(securityPin)) {
			redirectAttributes.addFlashAttribute("error", "Incorrect Security PIN.");
			return "redirect:/check-balance";
		}
		AccountsManager accountsManager = (AccountsManager) session.getAttribute("accountsManager");
		redirectAttributes.addFlashAttribute("showPopup", true);
		redirectAttributes.addFlashAttribute("currentBalance", accountsManager.getBalance());
		return "redirect:/check-balance";
	}

	@GetMapping("/withdraw")
	public String showWithdrawForm(HttpSession session, RedirectAttributes redirectAttributes) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		if (session.getAttribute("userAccount") == null) {
			redirectAttributes.addFlashAttribute("error", "You must create a bank account to withdraw funds.");
			return "redirect:/create-account";
		}
		return "withdraw";
	}

	@PostMapping("/withdraw-submit")
	public String withdrawSubmit(@RequestParam("amount") double amount, @RequestParam("securityPin") String securityPin,
			HttpSession session, RedirectAttributes redirectAttributes) {
		UserAccounts userAccount = (UserAccounts) session.getAttribute("userAccount");
		AccountsManager accountsManager = (AccountsManager) session.getAttribute("accountsManager");
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (userAccount == null || accountsManager == null || loggedInUser == null) {
			return "redirect:/login";
		}
		if (!userAccount.getSecurityPin().equals(securityPin)) {
			redirectAttributes.addFlashAttribute("error", "Incorrect Security PIN.");
			return "redirect:/withdraw";
		}
		if (amount <= 0) {
			redirectAttributes.addFlashAttribute("error", "Withdrawal amount must be greater than zero.");
			return "redirect:/withdraw";
		}
		if (accountsManager.getBalance() < amount) {
			redirectAttributes.addFlashAttribute("error", "Insufficient balance.");
			return "redirect:/withdraw";
		}
		boolean success = userAccountService.withdraw(accountsManager, amount);
		if (success) {
			UserAccounts updatedAccount = userAccountService.findAccountByUser(loggedInUser);
			session.setAttribute("userAccount", updatedAccount);
			session.setAttribute("accountsManager", updatedAccount.getAccountsManager());

			redirectAttributes.addFlashAttribute("showWithdrawSuccessPopup", true);
			redirectAttributes.addFlashAttribute("withdrawnAmount", amount);
			return "redirect:/withdraw";
		} else {
			redirectAttributes.addFlashAttribute("error", "Withdrawal failed. Please try again.");
			return "redirect:/withdraw";
		}
	}
}