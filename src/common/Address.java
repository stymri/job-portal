package common;

public class Address {
	private String address;
	private String city;
	private String state;
	private String pin;
	public Address(){}
	public Address(String add, String city, String state, String pin) {
		this.address = add;
		this.city = city;
		this.state = state;
		this.pin = pin;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	@Override
	public String toString(){
		String rs=address+","+city+","+state+"-"+pin;
		return rs;
	}

}
