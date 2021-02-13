package user;

import java.sql.Date;

import common.Address;

public class UserBean {

	// private int id;
	private String email;
	private Date dob;
	private String pass;
	private String name;
	private String phno;
	private String sex;
	private Address add;

	public UserBean() {
	}

	/*public UserBean(String email, String dob, String pass, String name, String phno, String sex, Address add) {
		super();
		this.email = email;
		this.dob = dob;
		this.pass = pass;
		this.name = name;
		this.phno = phno;
		this.sex = sex;
		this.add = add;
	}
*/
	public UserBean(String email, Date dob, String pass, String name, String phno, String sex, Address add) {
		super();
		this.email = email;
		this.dob = dob;
		this.pass = pass;
		this.name = name;
		this.phno = phno;
		this.sex = sex;
		this.add = add;
	}

	/*public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}*/
	

	public String getEmail() {
		return email;
	}

	public Date getDob() {
		return dob;
	}
	public String getSDob(){
		return dob.toString();
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getAdd() {
		return add;
	}

	public void setAdd(Address add) {
		this.add = add;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}
