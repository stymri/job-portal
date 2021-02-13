package company;

import common.Address;

public class CompanyBean {
	private String mail;
	private String name;
	private String password;
	private String phno;
	private String link;
	private String info;
	private Address add;

	public CompanyBean(String mail, String name, String password, String phno, String link, String info, Address add) {
		this.mail = mail;
		this.name = name;
		this.password = password;
		this.phno = phno;
		this.link = link;
		this.info = info;
		this.add = add;
	}

	public CompanyBean() {
	}

	public Address getAdd() {
		return add;
	}

	public void setAdd(Address add) {
		this.add = add;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
