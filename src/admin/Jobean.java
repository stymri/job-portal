package admin;

import java.sql.Date;

public class Jobean {
	private int id;
	private String cmail;
	private String name;
	private String category;
	private String criteria;
	private Date lastdate;
	private String salary;
	private String info;
	private String state;
	
	public Jobean(String cmail, String name, String category, String criteria, Date lastdate, String salary,
			String info, String state) {
		this.cmail = cmail;
		this.name = name;
		this.category = category;
		this.criteria = criteria;
		this.lastdate = lastdate;
		this.salary = salary;
		this.info = info;
		this.state = state;
	}

	public Jobean(int id, String cmail, String name, String category, String criteria, Date lastdate, String salary,
			String info, String state) {
		this.id = id;
		this.cmail = cmail;
		this.name = name;
		this.category = category;
		this.criteria = criteria;
		this.lastdate = lastdate;
		this.salary = salary;
		this.info = info;
		this.state = state;
	}

	public Jobean() {
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCmail() {
		return cmail;
	}
	public void setCmail(String cmail) {
		this.cmail = cmail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
