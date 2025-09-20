package springMVCproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import springMVCproject.Services.UserAccountService;
import springMVCproject.Services.UserService;
import springMVCproject.model.User;
import springMVCproject.model.UserAccounts;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserAccountService userAccountService;

	@GetMapping("/login")
	public String showLoginForm() {

		return "login";
	}

	@PostMapping("/login-submit")
	public String loginSubmit(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) {

		User user = userService.authenticateUser(username, password);

		if (user != null) {
			session.setAttribute("loggedInUser", user);

			UserAccounts userAccount = userAccountService.findAccountByUser(user);
			if (userAccount != null) {
				System.out.println(userAccount);
				session.setAttribute("userAccount", userAccount);
				session.setAttribute("accountsManager", userAccount.getAccountsManager());

			}

			redirectAttributes.addFlashAttribute("initiateTabSession", true);
			return "redirect:/home";
		} else {
			redirectAttributes.addFlashAttribute("loginError", "Invalid username or password.");
			return "redirect:/login?error";
		}
	}

	@GetMapping("/signup")
	public String showSignupForm(Model model) {
		model.addAttribute("user", new User());
		return "signup";
	}

	@PostMapping("/signup-submit")
	public String signupSubmit(@ModelAttribute("user") User user, BindingResult result,
			RedirectAttributes redirectAttributes) {
		// Add validation logic here (e.g., check if username/email exists)
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "error.user", "Passwords do not match. Please try again.");
		}
		if (userService.emailExist(user.getEmail())) {
			result.rejectValue("email", "error.user", "Email id is already exist use another email");
		}
		if (userService.usernameExist(user.getUsername())) {
			result.rejectValue("username", "error.user", "This username is already taken.");
		}

		if (result.hasErrors()) {

			return "signup";
		} else {
			System.out.println(user);
			userService.createUser(user);
			redirectAttributes.addFlashAttribute("signupSuccess", "Registration successful! Please login.");
			return "redirect:/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {

		session.invalidate();

		redirectAttributes.addFlashAttribute("logoutSuccess", true);

		return "redirect:/home";
	}
}