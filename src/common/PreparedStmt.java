package common;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedStmt {
	public static Connection con;

	public static ResultSet processquery(String query, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 1, param[i]);
				}
			}
			return ps.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ResultSet processquery(String query, int id, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 2, param[i]);
				}
			}
			return ps.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int processupdate(String query, String param, int id) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, param);
			;
			ps.setInt(2, id);
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * public static ResultSet processquery(String query,int id,Date date,String
	 * ...param) { Connection con; try { con = Dbconnection.getdbcon();
	 * PreparedStatement ps=con.prepareStatement(query); ps.setInt(1, id);
	 * ps.setDate(2,date); if (param!=null) { for (int i = 0; i < param.length;
	 * i++) { ps.setString(i+3, param[i]); } } return ps.executeQuery(); } catch
	 * (ClassNotFoundException | SQLException e) { e.printStackTrace(); } return
	 * null; }
	 */

	public static int processupdate(String query, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 1, param[i]);
				}
			}
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int processupdate(String query, int id, Date date, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setDate(2, date);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 3, param[i]);
				}
			}
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int processupdate(String query, int id, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 2, param[i]);
				}
			}
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int processupdate(String query, Date date, String... param) {
		try {
			con = Dbconnection.getdbcon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setDate(1, date);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setString(i + 2, param[i]);
				}
			}
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void delete() {
		Dbconnection.deletecon(con);
	}
}
