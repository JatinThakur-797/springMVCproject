package springMVCproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import springMVCproject.model.UserAccounts;

@Controller
public class HomeController {

	@RequestMapping(value = { "/", "/home" })
	public String home() {
		return "home";
	}

	@RequestMapping("/services")
	public String services(Model model) {
		return "services";
	}

	@GetMapping("/account-success")
	public String accountSuccess(RedirectAttributes redirectAttributes, HttpSession session) {
		UserAccounts userAccount = (UserAccounts) session.getAttribute("userAccount");
		if (userAccount == null) {
			System.out.println(userAccount);
			redirectAttributes.addFlashAttribute("accountNotFound", "Please create a account first");
			return "redirect:/create-account";
		}
		return "account_success";
	}
}