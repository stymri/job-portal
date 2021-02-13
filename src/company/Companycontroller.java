package company;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import admin.Jobcontroller;
import common.Address;
import common.PreparedStmt;
import common.Userbreif;

public class Companycontroller {
	public boolean addcompany(CompanyBean cb) {
		Address add = cb.getAdd();
		String query = "insert into company values(?,?,?,?,?,?,?,?,?,?)";
		int x = PreparedStmt.processupdate(query, cb.getMail(), cb.getName(), cb.getPassword(), cb.getPhno(),
				cb.getInfo(), cb.getLink(), add.getAddress(), add.getCity(), add.getState(), add.getPin());
		if (x != 0) {
			return true;
		}
		return false;
	}

	public String checkcompany(String mail, String password) {
		String query = "Select * from company where mail=?";
		ResultSet rs = PreparedStmt.processquery(query, mail);
		try {
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					return "true";
				} else {
					return "wrong password";
				}
			} else {
				return "mail not registered";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "an error occurs";
	}

	public CompanyBean getcompanyunsure(String cmail) {
		CompanyBean cb = new CompanyBean();
		Address add = new Address();
		String query = "Select * from company where mail=?";
		ResultSet rs = PreparedStmt.processquery(query, cmail);
		try {
			if (rs.next()) {
				cb.setMail(rs.getString("mail"));
				cb.setName(rs.getString("name"));
				cb.setInfo(rs.getString("info"));
				cb.setLink(rs.getString("link"));
				cb.setPhno(rs.getString("phno"));
				add.setAddress(rs.getString("address"));
				add.setCity(rs.getString("city"));
				add.setState(rs.getString("state"));
				add.setPin(rs.getString("pin"));
				cb.setAdd(add);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cb;
	}

	public boolean change(String mail, String password) {
		String query = "Update company set password=? where mail=?";
		int x = PreparedStmt.processupdate(query, password, mail);
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}

	public boolean update(CompanyBean ub) {
		Address ad = ub.getAdd();
		String query = "Update company set name=?, phno=?,info=?,link=?,address=?,city=?,state=?,pin=? where mail=?";
		int x = PreparedStmt.processupdate(query, ub.getName(), ub.getPhno(), ub.getInfo(), ub.getLink(),
				ad.getAddress(), ad.getCity(), ad.getState(), ad.getPin(), ub.getMail());
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}

	public Vector<CompanyBean> searchCompany(String mail, String name, String sortby) {
		mail = "%" + mail + "%";
		name = "%" + name + "%";
		String query = "Select * from company where mail like ? and name like ?";
		ResultSet rs;
		if (sortby.equalsIgnoreCase("")) {
			rs = PreparedStmt.processquery(query, mail, name);
		} else {
			query = query + "order by ?";
			rs = PreparedStmt.processquery(query, mail, name, sortby);
		}
		Vector<CompanyBean> ls = new Vector<CompanyBean>();
		String mail1, name1, password, phno, link, info, address, city, state, pin;
		try {
			while (rs.next()) {
				name1 = rs.getString("name");
				mail1 = rs.getString("mail");
				password = rs.getString("password");
				info = rs.getString("info");
				link = rs.getString("link");
				phno = rs.getString("phno");
				address = rs.getString("address");
				city = rs.getString("city");
				state = rs.getString("state");
				pin = rs.getString("pin");
				ls.add(new CompanyBean(mail1, name1, password, phno, link, info,
						new Address(address, city, state, pin)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public String deletecompany(String mail){
		int id;
		boolean job;
		Jobcontroller jbc = new Jobcontroller();
		String msg;
		String query = "Select id from job where cmail=?";
		ResultSet rs = PreparedStmt.processquery(query, mail);
		try {
			while(rs.next()){
				id = rs.getInt("id");
			    job = jbc.deletejob(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "delete from company where mail=?";
		int x = PreparedStmt.processupdate(query, mail);
		if (x ==0) {
			msg = "Company not deleted";
		} else {
            msg = "Company deleted";
		}
		return msg;
	}
}