package springMVCproject.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import springMVCproject.Services.UserAccountService;
import springMVCproject.model.AccountsManager;
import springMVCproject.model.User;
import springMVCproject.model.UserAccounts;

@Controller
public class AccountController {

	private final UserAccountService userAccountService;

	@Autowired
	public AccountController(UserAccountService userAccountService) {
		this.userAccountService = userAccountService;
	}

	@GetMapping("/create-account")
	public String showCreateAccountForm(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			return "redirect:/login";
		}

		if (userAccountService.userAccountExist(loggedInUser)) {
			redirectAttributes.addFlashAttribute("accountExistsError",
					"You already have an account with us. You cannot create another one.");
			return "redirect:/services?error";
		}

		model.addAttribute("newAccount", new UserAccounts());
		return "create_account";
	}

	@PostMapping("/create-account-submit")
	public String createAccountSubmit(@ModelAttribute("newAccount") UserAccounts account, BindingResult result,
			HttpSession session, Model model) {

		User loggedInUser = (User) session.getAttribute("loggedInUser");
		MultipartFile profileFile = account.getProfileImage();
		MultipartFile signatureFile = account.getSignatureImage();

		if (loggedInUser == null) {
			return "redirect:/login";
		}

		if (userAccountService.adhaarExist(account.getAadhaarCard())) {
			result.rejectValue("aadhaarCard", "error.userAccounts", "Aadhaar number already exists.");
		}
		if (userAccountService.panCardExist(account.getPanCard())) {
			result.rejectValue("panCard", "error.userAccounts", "PAN Card number already exists.");
		}
		if (!profileFile.getContentType().equals("image/png") || !signatureFile.getContentType().equals("image/png")) {
			result.rejectValue("profileImage", "error.userAccounts", "File must be .png ");
		}
		if (profileFile.getSize() > 1024000 || signatureFile.getSize() > 1024000) {
			result.rejectValue("profileImage", "error.userAccounts", "File size must be less than 100Kb");

		}

		if (!profileFile.isEmpty() && !signatureFile.isEmpty()) {
			try {
				// profile image upload
				String profileFilename = profileFile.getOriginalFilename();
				String profileSavePath = session.getServletContext().getRealPath("/resources/images/");
				File profieDest = new File(profileSavePath + File.separator + profileFilename);
				profieDest.getParentFile().mkdirs();
				profileFile.transferTo(profieDest);
				account.setProfileImageName(profileFilename);

				// signature upload
				String signatureFilename = signatureFile.getOriginalFilename();
				String signatureSavePath = session.getServletContext().getRealPath("/resources/images/");
				File signatureDest = new File(signatureSavePath + File.separator + signatureFilename);
				signatureDest.getParentFile().mkdirs();
				signatureFile.transferTo(signatureDest);
				account.setSignatureImageName(signatureFilename);

				System.out.println("File saved successfully at: " + profieDest.getAbsolutePath());
				model.addAttribute("uploadedProfileImageName", profileFilename);
				System.out.println("File saved successfully at: " + signatureDest.getAbsolutePath());
				model.addAttribute("uploadedSignatureImageName", signatureFilename);

			} catch (Exception e) {
				System.out.println("Error saving file: " + e.getMessage());
				return "create_account";
			}
		} else {
			result.rejectValue("profileImage", "error.userAccounts", "Please Upload Image ");
		}
		if (result.hasErrors()) {
			return "create_account";
		}
		AccountsManager accountsManager = new AccountsManager();
		account.setUser(loggedInUser);
		account.setAccountsManager(accountsManager);
		System.out.println(accountsManager);
		System.out.println(account);
		session.setAttribute("tempUserAccount", account);
		return "redirect:/deposite";
	}

	@GetMapping("/change-pin")
	public String changePin(RedirectAttributes redirectAttributes, Model session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}

		// Your correct check: Ensure the user has a bank account
		UserAccounts userAccount = (UserAccounts) session.getAttribute("userAccount");
		if (userAccount == null) {
			redirectAttributes.addFlashAttribute("error",
					"You must create a bank account before you can change a PIN.");
			return "redirect:/create-account";
		}
		return "change_pin";
	}

	@PostMapping("/change-pin-submit")
	public String changePinSubmit(@RequestParam("oldPin") String oldPin, @RequestParam("newPin") String newPin,
			RedirectAttributes redirectAttributes, HttpSession session) {

		UserAccounts userAccounts = (UserAccounts) session.getAttribute("userAccount");
		System.out.println(session.toString());
		if (!userAccounts.getSecurityPin().equals(oldPin)) {
			redirectAttributes.addFlashAttribute("error", "Your privious pin is incorrect! try again ");
			return "redirect:/change-pin?error";
		}
		if (newPin.equals(oldPin)) {
			redirectAttributes.addFlashAttribute("error", "Previous pin and new pin are same Please Create new");
			return "redirect:/change-pin?error";
		}

		try {
			userAccounts.setSecurityPin(newPin);
			boolean success = userAccountService.changePin(userAccounts);
			if (success) {
				redirectAttributes.addFlashAttribute("changePinSuccess", true);
				return "redirect:/services";
			} else {
				redirectAttributes.addFlashAttribute("error", "Something went wrong");
				return "redirect:/change-pin?error";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("error", "Something went wrong");

			return "redirect:/change-pin?error";
		}
	}

}
