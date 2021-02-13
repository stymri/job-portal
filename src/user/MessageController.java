package user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import common.PreparedStmt;

public class MessageController {
	public Vector<MessageBean> veiwmessages(String umail) {
		String msg;
		int jobid;
		Vector<MessageBean> ls = new Vector<MessageBean>();
		try {
			String query = "SELECT jobid, msg FROM shortlistapp WHERE umail=?";
			ResultSet rs = PreparedStmt.processquery(query, umail);
			while (rs.next()) {
				jobid = rs.getInt("jobid");
				msg = rs.getString("msg");
				if (!msg.equalsIgnoreCase("")) {
					ls.add(new MessageBean(jobid, umail, msg, false));
				}
			}
			query = "SELECT jobid, msg FROM deletedapp WHERE umail=?";
			rs = PreparedStmt.processquery(query, umail);
			while (rs.next()) {
				jobid = rs.getInt("jobid");
				msg = rs.getString("msg");
				if (!msg.equalsIgnoreCase("")) {
					ls.add(new MessageBean(jobid, umail, msg, true));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public int delete(String umail,String deleted,int id){
		String query;
		if (deleted.equalsIgnoreCase("true")) {
			query = "DELETE FROM deletedapp WHERE jobid=? AND umail=?";
		} else {
			query="UPDATE shortlistapp SET msg='' WHERE jobid=? AND umail=?";
		}
		int x = PreparedStmt.processupdate(query, id, umail);
		return x;
	}

}
