package admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import common.PreparedStmt;
import user.UserBean;

public class Admincontroller {
	public String login(String mail,String password){
		String query = "Select * from admin where mail=?";
		ResultSet rs = PreparedStmt.processquery(query, mail);
		try {
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					return "Login";
				} else {
                    return "wrong password";
				}
			}else{
				return "Wrong Admin name";
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}return "login falied";
	}
	public boolean change(String mail,String password) {
		String query = "Update admin set password=? where mail=?";
		int x = PreparedStmt.processupdate(query, password, mail);
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}
}
