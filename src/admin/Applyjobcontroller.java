package admin;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import common.PreparedStmt;
import common.Userbreif;
import common.UserbreifController;


public class Applyjobcontroller {
	public boolean applyjob(int id, String mail) {
		String query = "insert into applyjob values(?,?)";
		int x = PreparedStmt.processupdate(query, id, mail);
		PreparedStmt.delete();
		if (x == 0) {
			return false;
		} else {
			return true;
		}
	}

	public Vector<Jobean> veiwjobs(String mail) {
		Vector<Jobean> ls = new Vector<Jobean>();
		int id;
		String cmail, name, category, criteria, salary, info, state;
		Date lastdate;
		String query = "select id,lastdate,cmail,name,category,criteria,salary,info,state from job,applyjob where id=jobid and umail=?";
		ResultSet rs = PreparedStmt.processquery(query, mail);
		try {
			while (rs.next()) {
				id = rs.getInt("id");
				lastdate = rs.getDate("lastdate");
				cmail = rs.getString("cmail");
				category = rs.getString("category");
				name = rs.getString("name");
				criteria = rs.getString("criteria");
				salary = rs.getString("salary");
				info = rs.getString("info");
				state = rs.getString("state");
				ls.add(new Jobean(id, cmail, name, category, criteria, lastdate, salary, info, state));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return ls;
	}

	public Vector<Userbreif> getapplications(int jobid, int index,String selected) {
		String table;
		if (selected.equalsIgnoreCase("true")) {
			table = "shortlistapp";
		} else {
			table = "applyjob";
		}
		Vector<Userbreif> ls = new Vector<Userbreif>();
		UserbreifController uec = new UserbreifController();
		int i = -1;
		String name, mail,category;
		String query = "select user.name, mail,category from "+table+",user,job where mail = umail and jobid=id and jobid=?";
		ResultSet rs = PreparedStmt.processquery(query, jobid);
		try {
			while (rs.next()) {
				i++;
				if (i < index) {
				} else if (i < index + 20) {
					name = rs.getString("name");
					mail = rs.getString("mail");
					category = rs.getString("category");
					ls.add(uec.getUserbreif(name, mail, category));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public int noofapplications(int jobid,String selected) {
		int i = 0;
		String table;
		if (selected.equalsIgnoreCase("true")) {
			table = "shortlistapp";
		} else {
			table = "applyjob";
		}
		String query = "select count(umail) from "+table+" where jobid=?";
		ResultSet rs = PreparedStmt.processquery(query, jobid);
		try {
			if (rs.next()) {
				i = rs.getInt("count(umail)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

}
