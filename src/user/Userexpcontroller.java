package user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import common.Address;
import common.PreparedStmt;

public class Userexpcontroller {
	public boolean addexperience(Userexp ue) {
		Address add = ue.getAdd();
		String query = "insert into userexp values (?,?,?,?,?,?,?,?,?)";
		int x = PreparedStmt.processupdate(query, ue.getMail(), ue.getEducational(), ue.getType(), ue.getWhere(),
				ue.getPercentage(), add.getAddress(), add.getCity(), add.getState(), add.getPin());
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}

	public Vector<Userexp> getUserexp(String mail, String edu) {
		Vector<Userexp> ls = new Vector<Userexp>();
		int sno;
		String type;
		String where;
		String percentage;
		String address;
		String city;
		String state;
		String pin;
		String query = "select * from userexp where mail=? and educational=?";
		ResultSet rs = PreparedStmt.processquery(query, mail, edu);
		try {
			while (rs.next()) {
				// ue.setMail(rs.getString("mail"));
				// ue.setEducational(rs.getString("educational"));
				type = rs.getString("type");
				where = rs.getString("expname");
				percentage = rs.getString("percentage");
				address = rs.getString("address");
				city = rs.getString("city");
				state = rs.getString("state");
				pin = rs.getString("pin");
				sno = rs.getInt("sno");
				// ue.setAdd(add);
				ls.add(new Userexp(mail, edu, sno, type, where, percentage, new Address(address, city, state, pin)));
			}
			return ls;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return null;
	}

	public Userexp getexp(String mail, String type, String expname) {
		Userexp ue = new Userexp();
		Address add = new Address();
		String query = "select * from userexp where mail=? and type=? and expname=?";
		ResultSet rs = PreparedStmt.processquery(query, mail, type, expname);
		try {
			if (rs.next()) {
				ue.setMail(rs.getString("mail"));
				ue.setEducational(rs.getString("educational"));
				ue.setType(rs.getString("type"));
				ue.setWhere(rs.getString("expname"));
				ue.setPercentage(rs.getString("percentage"));
				add.setAddress(rs.getString("address"));
				add.setCity(rs.getString("city"));
				add.setState(rs.getString("state"));
				add.setPin(rs.getString("pin"));
				ue.setAdd(add);
				return ue;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean setexp(Userexp ue, String ptype, String expname) {
		Address add = ue.getAdd();
		String query = "update userexp set type=?,expname=?,percentage=?,address=?,city=?,state=?,pin=? where mail=? and type=? and expname=?";
		int x = PreparedStmt.processupdate(query, ue.getType(), ue.getWhere(), ue.getPercentage(), add.getAddress(),
				add.getCity(), add.getState(), add.getPin(), ue.getMail(), ptype, expname);
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}
}
