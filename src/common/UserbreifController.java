package common;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class UserbreifController {
	public Userbreif getUserbreif(String name, String mail, String category) {
		int noofyear = 0;
		String maxqualification = "-----";
		String query = "select sum(percentage) from userexp where mail=? and type=? and educational=?";
		try {
			ResultSet rs = PreparedStmt.processquery(query, mail, category, "n");
			if (rs.next()) {
				noofyear = rs.getInt("sum(percentage)");
			}
			maxqualification = maxuserexp(mail, "y");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return new Userbreif(name, mail, maxqualification, category, noofyear);
	}
	

	public int getMaxsno(String mail, String edu) {
		int sno = 0;
		String query = "select max(sno) from userexp where educational=? and mail=?";
		ResultSet rs = PreparedStmt.processquery(query, edu, mail);
		try {
			if (rs.next()) {
				sno = rs.getInt("max(sno)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return sno;
	}

	private String maxuserexp(String mail, String edu) {
		String max = null;
		int sno = getMaxsno(mail, edu);
		//System.out.println(sno);
		String query = "Select type from userexp where sno=? and educational=? and mail=? ";
		ResultSet rs = PreparedStmt.processquery(query, sno, edu, mail);
		try {
			while(rs.next()) {
				max = rs.getString("type");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}
	public Vector<Userbreif> searchUser(String mail,String name,String sortby){
		mail = "%"+mail+"%";
		name = "%"+name+"%";
		String query = "Select * from user where mail like ? and name like ?";
		ResultSet rs;
		if (sortby.equalsIgnoreCase("")) {
			rs = PreparedStmt.processquery(query, mail,name);
		}else{
			query = query + "order by ?";
			rs = PreparedStmt.processquery(query, mail,name,sortby);
		}
		Vector<Userbreif> ls = new Vector<Userbreif>();
		String sname;
		String smail;
		//String maxqualification;
		String exptype;
		//int noofyear;
		try {
			while (rs.next()) {
				sname = rs.getString("name");
				smail = rs.getString("mail");
				exptype = maxuserexp(smail, "n");
				ls.add(getUserbreif(sname, smail,exptype));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
}
