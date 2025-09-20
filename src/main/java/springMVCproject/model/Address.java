package springMVCproject.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_address")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; // add an ID field

	private String street;
	private String city;
	private String district;
	private String state;
	private String pincode;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public Address(Long id, String street, String city, String district, String state, String pincode) {
		super();
		this.id = id;

		this.street = street;
		this.city = city;
		this.district = district;
		this.state = state;
		this.pincode = pincode;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ",  street=" + street + ", city=" + city + ", district=" + district + ", state="
				+ state + ", pincode=" + pincode + "]";
	}

	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

}
