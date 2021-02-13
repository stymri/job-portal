package admin;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import common.PreparedStmt;

public class Jobcontroller {
	public boolean addjob(Jobean jb) {
		String query = "insert into job (lastdate,cmail,name,category,criteria,salary,info,state) values (?,?,?,?,?,?,?,?)";
		int x = PreparedStmt.processupdate(query, jb.getLastdate(), jb.getCmail(), jb.getName(), jb.getCategory(),
				jb.getCriteria(), jb.getSalary(), jb.getInfo(), jb.getState());
		PreparedStmt.delete();
		if (x != 0) {
			return true;
		}
		return false;
	}

	public boolean deletejob(int id) {
		String query = "delete from deletedapp where jobid=?";
		int x = PreparedStmt.processupdate(query, id);
		// PreparedStmt.delete();
		// System.out.println(x);
		// if (x != 0) {}
		query = "delete from shortlistapp where jobid=?";
		x = PreparedStmt.processupdate(query, id);
		// System.out.println(y);
		// if (y != 0) {}
		query = "delete from job where id=?";
		x = PreparedStmt.processupdate(query, id);
		// System.out.println(z);
		if (x != 0) {
			return true;
		}
		return false;
	}

	public Vector<Jobean> getjob(String keyword, String sortby, String state) {
		Vector<Jobean> ls = new Vector<Jobean>();
		int jid;
		String cmail, name, category, criteria, salary, info;
		Date lastdate;
		keyword = "%" + keyword + "%";
		ResultSet rs, rs1;
		String query = "Select * from job where name like ? ";
		if (state.equalsIgnoreCase("")) {
			if (sortby.equalsIgnoreCase("")) {
				rs = PreparedStmt.processquery(query, keyword);
			} else {
				query = query + "order by ?";
				rs = PreparedStmt.processquery(query, keyword, sortby);
			}
		} else {
			query = query + " and state=?";
			if (sortby.equalsIgnoreCase("")) {
				rs = PreparedStmt.processquery(query, keyword, state);
			} else {
				query = query + " order by ?";
				rs = PreparedStmt.processquery(query, keyword, state, sortby);
			}
		}
		try {
			while (rs.next()) {
				jid = rs.getInt(1);
				lastdate = rs.getDate("lastdate");
				cmail = rs.getString("cmail");
				category = rs.getString("category");
				name = rs.getString("name");
				criteria = rs.getString("criteria");
				salary = rs.getString("salary");
				info = rs.getString("info");
				state = rs.getString("state");
				ls.add(new Jobean(jid, cmail, name, category, criteria, lastdate, salary, info, state));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!(keyword.equalsIgnoreCase("%%") || keyword.equalsIgnoreCase("% %"))) {
			query = "Select * from job where category like ? ";
			if (state.equalsIgnoreCase("")) {
				if (sortby.equalsIgnoreCase("")) {
					rs1 = PreparedStmt.processquery(query, keyword);
				} else {
					query = query + "order by ?";
					rs1 = PreparedStmt.processquery(query, keyword, sortby);
				}
			} else {
				query = query + " and state=?";
				if (sortby.equalsIgnoreCase("")) {
					rs1 = PreparedStmt.processquery(query, keyword, state);
				} else {
					query = query + " order by ?";
					rs1 = PreparedStmt.processquery(query, keyword, state, sortby);
				}
			}
			try {
				while (rs1.next()) {
					jid = rs1.getInt(1);
					lastdate = rs1.getDate("lastdate");
					cmail = rs1.getString("cmail");
					category = rs1.getString("category");
					name = rs1.getString("name");
					criteria = rs1.getString("criteria");
					salary = rs1.getString("salary");
					info = rs1.getString("info");
					state = rs1.getString("state");
					ls.add(new Jobean(jid, cmail, name, category, criteria, lastdate, salary, info, state));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		PreparedStmt.delete();
		return ls;
	}

	public Vector<Jobean> getjob(String cmail) {
		Vector<Jobean> ls = new Vector<Jobean>();
		int jid;
		String name, category, criteria, salary, info, state;
		Date lastdate;

		String query = "Select * from job where cmail=?";
		ResultSet rs = PreparedStmt.processquery(query, cmail);
		try {
			while (rs.next()) {
				jid = rs.getInt(1);
				lastdate = rs.getDate("lastdate");
				// System.out.println(lastdate);
				// cmail=rs.getString("cmail");
				category = rs.getString("category");
				name = rs.getString("name");
				criteria = rs.getString("criteria");
				salary = rs.getString("salary");
				info = rs.getString("info");
				state = rs.getString("state");
				ls.add(new Jobean(jid, cmail, name, category, criteria, lastdate, salary, info, state));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStmt.delete();
		return ls;
	}

	public Jobean getjobean(int id) {
		Jobean jb = new Jobean();
		String query = "Select * from job where id=?";
		ResultSet rs = PreparedStmt.processquery(query, id);
		try {
			if (rs.next()) {
				jb.setId(rs.getInt(1));
				jb.setLastdate(rs.getDate("lastdate"));
				jb.setCmail(rs.getString("cmail"));
				jb.setCategory(rs.getString("category"));
				jb.setName(rs.getString("name"));
				jb.setCriteria(rs.getString("criteria"));
				jb.setSalary(rs.getString("salary"));
				jb.setInfo(rs.getString("info"));
				jb.setState(rs.getString("state"));
				return jb;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStmt.delete();
		return null;
	}
}
