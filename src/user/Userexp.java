package user;

import common.Address;

public class Userexp {
	private String mail;
	private String educational;
	private int sno;
	private String type;
	private String where;
	private String percentage;
	private Address add;
	

	public Userexp(String mail, String educational, int sno, String type, String where, String percentage,
			Address add) {
		super();
		this.mail = mail;
		this.educational = educational;
		this.sno = sno;
		this.type = type;
		this.where = where;
		this.percentage = percentage;
		this.add = add;
	}

	public Userexp() {
	}

	/*public Userexp(String mail, String educational, String type, String where, String percentage, Address add) {
		super();
		this.mail = mail;
		this.educational = educational;
		this.type = type;
		this.where = where;
		this.percentage = percentage;
		this.add = add;
		
	}*/
	

	public String getWhere() {
		return where;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getEducational() {
		return educational;
	}

	public void setEducational(String educational) {
		this.educational = educational;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Address getAdd() {
		return add;
	}

	public void setAdd(Address add) {
		this.add = add;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

}
