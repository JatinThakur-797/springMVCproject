package springMVCproject.model;

public class BankDetails {
	private String bankName;
	private String ifscCode;
	private String bankBranchName;
	private int bankBranchCode;
	private String bankBranchAddress;
	private String customerCarePhone;
	private String customerCareEmail;

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public String getBankBranchName() {
		return bankBranchName;
	}

	public void setBankBranchName(String bankBranchName) {
		this.bankBranchName = bankBranchName;
	}

	public int getBankBranchCode() {
		return bankBranchCode;
	}

	public void setBankBranchCode(int bankBranchCode) {
		this.bankBranchCode = bankBranchCode;
	}

	public String getBankBranchAddress() {
		return bankBranchAddress;
	}

	public void setBankBranchAddress(String bankBranchAddress) {
		this.bankBranchAddress = bankBranchAddress;
	}

	public String getCustomerCarePhone() {
		return customerCarePhone;
	}

	public void setCustomerCarePhone(String customerCarePhone) {
		this.customerCarePhone = customerCarePhone;
	}

	public String getCustomerCareEmail() {
		return customerCareEmail;
	}

	public void setCustomerCareEmail(String customerCareEmail) {
		this.customerCareEmail = customerCareEmail;
	}

	public BankDetails(String bankName, String ifscCode, String bankBranchName, int bankBranchCode,
			String bankBranchAddress, String customerCarePhone, String customerCareEmail) {
		super();
		this.bankName = bankName;
		this.ifscCode = ifscCode;
		this.bankBranchName = bankBranchName;
		this.bankBranchCode = bankBranchCode;
		this.bankBranchAddress = bankBranchAddress;
		this.customerCarePhone = customerCarePhone;
		this.customerCareEmail = customerCareEmail;
	}

	public BankDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BankDetails [bankName=" + bankName + ", ifscCode=" + ifscCode + ", bankBranchName=" + bankBranchName
				+ ", bankBranchCode=" + bankBranchCode + ", bankBranchAddress=" + bankBranchAddress
				+ ", customerCarePhone=" + customerCarePhone + ", customerCareEmail=" + customerCareEmail + "]";
	}

}
