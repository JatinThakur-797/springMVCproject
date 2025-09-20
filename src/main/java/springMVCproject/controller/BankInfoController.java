package springMVCproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springMVCproject.model.BankDetails;

@Controller
public class BankInfoController {

	@GetMapping("/bank-details")
	public String showBankDetails(Model model) {
		BankDetails bankInfo = new BankDetails();
		bankInfo.setBankName("NexusBank");
		bankInfo.setIfscCode("NEXB0001234");
		bankInfo.setBankBranchCode(9801);
		bankInfo.setBankBranchName("Mumbai Main Branch");
		bankInfo.setBankBranchAddress("123 Financial Street, Fort, Mumbai, Maharashtra, 400001");
		bankInfo.setCustomerCarePhone("+91 22 5555 1234");
		bankInfo.setCustomerCareEmail("support@nexusbank.demo");
		model.addAttribute("bankInfo", bankInfo);

		return "bank_details";
	}

}
