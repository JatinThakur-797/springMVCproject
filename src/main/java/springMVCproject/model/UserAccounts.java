package springMVCproject.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist; // Import PrePersist
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "user_accounts")
public class UserAccounts {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "account_number")
	private Long accountNumber;

	private String firstName;
	private String lastName;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dob;
	private String gender;
	private String phone;
	private String securityPin;
	private String fatherName;
	private String motherName;
	private String accountType;
	private String aadhaarCard;
	private String panCard;
	@Transient
	private MultipartFile profileImage;
	@Transient
	private MultipartFile signatureImage;

	private String profileImageName;
	private String signatureImageName;
	// This field will now be set automatically by the @PrePersist method below
	private LocalDateTime accountCreationDateTime;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id", referencedColumnName = "id")
	private Address address;

	@OneToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "accounts_manager_id")
	private AccountsManager accountsManager;

	@PrePersist
	protected void onCreate() {
		this.accountCreationDateTime = LocalDateTime.now();
	}

	// --- Getters, Setters, Constructors, and toString() remain the same ---

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSecurityPin() {
		return securityPin;
	}

	public void setSecurityPin(String securityPin) {
		this.securityPin = securityPin;
	}

	public LocalDateTime getAccountCreationDateTime() {
		return accountCreationDateTime;
	}

	public void setAccountCreationDateTime(LocalDateTime accountCreationDateTime) {
		this.accountCreationDateTime = accountCreationDateTime;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAadhaarCard() {
		return aadhaarCard;
	}

	public void setAadhaarCard(String aadhaarCard) {
		this.aadhaarCard = aadhaarCard;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AccountsManager getAccountsManager() {
		return accountsManager;
	}

	public void setAccountsManager(AccountsManager accountsManager) {
		this.accountsManager = accountsManager;
	}

	@Override
	public String toString() {
		return "UserAccounts [accountNumber=" + accountNumber + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", dob=" + dob + ", gender=" + gender + ", phone=" + phone + ", securityPin=" + securityPin
				+ ", fatherName=" + fatherName + ", motherName=" + motherName + ", accountType=" + accountType
				+ ", aadhaarCard=" + aadhaarCard + ", panCard=" + panCard + ", profileImage=" + profileImage
				+ ", signatureImage=" + signatureImage + ", profileImageName=" + profileImageName
				+ ", signatureImageName=" + signatureImageName + ", accountCreationDateTime=" + accountCreationDateTime
				+ ", address=" + address + ", user=" + user + ", accountsManager=" + accountsManager + "]";
	}

	public MultipartFile getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(MultipartFile profileImage) {
		this.profileImage = profileImage;
	}

	public MultipartFile getSignatureImage() {
		return signatureImage;
	}

	public void setSignatureImage(MultipartFile signatureImage) {
		this.signatureImage = signatureImage;
	}

	public String getProfileImageName() {
		return profileImageName;
	}

	public void setProfileImageName(String profileImageName) {
		this.profileImageName = profileImageName;
	}

	public String getSignatureImageName() {
		return signatureImageName;
	}

	public void setSignatureImageName(String signatureImageName) {
		this.signatureImageName = signatureImageName;
	}

	public Date getAccountCreationDateTimeAsDate() {
		if (this.accountCreationDateTime == null) {
			return null;
		}
		// Converts LocalDateTime -> ZonedDateTime -> Instant -> java.util.Date
		return Date.from(this.accountCreationDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}
}