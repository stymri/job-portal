package user;

import java.sql.ResultSet;
import java.sql.SQLException;

import common.Address;
import common.PreparedStmt;

public class Usercontroller {
	public boolean register(UserBean ub) {
		Address ad = ub.getAdd();
		String query = "insert into user (dateofbirth,mail,password,name,phno,sex,address,city,state,pin) values (?,?,?,?,?,?,?,?,?,?)";
		int x = PreparedStmt.processupdate(query,ub.getDob(), ub.getEmail(), ub.getPass(), ub.getName(), ub.getPhno(), ub.getSex(),
				ad.getAddress(), ad.getCity(), ad.getState(), ad.getPin());
		//PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}

	public int check(UserBean ub) {
		String query = "select * from user where mail=? and password=?";
		ResultSet rs = PreparedStmt.processquery(query, ub.getEmail(), ub.getPass());
		try {
			if (rs.next()) {
				PreparedStmt.delete();
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return 0;
	}

	public UserBean getuser(String mail) {
		UserBean ub = new UserBean();
		Address add = new Address();
		String query = "select * from user where mail=?";
		ResultSet rs = PreparedStmt.processquery(query, mail);
		try {
			if (rs.next()) {
				ub.setEmail(rs.getString("mail"));
				ub.setPass(rs.getString("password"));
				ub.setName(rs.getString("name"));
				ub.setPhno(rs.getString("phno"));
				ub.setSex(rs.getString("sex"));
				ub.setDob(rs.getDate("dateofbirth"));
				add.setAddress(rs.getString("address"));
				add.setCity(rs.getString("city"));
				add.setState(rs.getString("state"));
				add.setPin(rs.getString("pin"));
				ub.setAdd(add);
			}
			PreparedStmt.delete();
			return ub;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean update(UserBean ub) {
		Address ad = ub.getAdd();
		String query = "Update user set name=?, phno=?,address=?,city=?,state=?,pin=? where mail=?";
		int x = PreparedStmt.processupdate(query, ub.getName(), ub.getPhno(), ad.getAddress(), ad.getCity(),
				ad.getState(), ad.getPin(), ub.getEmail());
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}
	public boolean change(UserBean ub) {
		String query = "Update user set password=? where mail=?";
		int x = PreparedStmt.processupdate(query, ub.getPass(), ub.getEmail());
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}
	public int delete(String mail){
		String query = "delete from deletedapp where umail=?";
		int x = PreparedStmt.processupdate(query, mail);
		System.out.println(x);
		query = "delete from shortlistapp where umail=?";
		x = PreparedStmt.processupdate(query, mail);
		System.out.println(x);
		query = "delete from applyjob where umail=?";
		x = PreparedStmt.processupdate(query, mail);
		System.out.println(x);
		query = "delete from userexp where mail=?";
		x = PreparedStmt.processupdate(query, mail);
		System.out.println(x);
		query = "delete from user where mail=?";
		x = PreparedStmt.processupdate(query, mail);
		System.out.println(x);
		return x;
	}
}
