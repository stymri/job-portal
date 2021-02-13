package common;

public class Userbreif {
	private String name;
	private String mail;
	private String maxqualification;
	private String exptype;
	private int noofyear;

	public Userbreif(String name, String mail, String maxqualification, String exptype, int noofyear) {
		super();
		this.name = name;
		this.mail = mail;
		this.maxqualification = maxqualification;
		this.exptype = exptype;
		this.noofyear = noofyear;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMaxqualification() {
		return maxqualification;
	}

	public void setMaxqualification(String maxqualification) {
		this.maxqualification = maxqualification;
	}

	public String getExptype() {
		return exptype;
	}

	public void setExptype(String exptype) {
		this.exptype = exptype;
	}

	public int getNoofyear() {
		return noofyear;
	}

	public void setNoofyear(int noofyear) {
		this.noofyear = noofyear;
	}

}
