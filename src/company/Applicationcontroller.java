package company;

import common.PreparedStmt;

public class Applicationcontroller {
	public String shortlist(String mail,int jobid){
		String msg = "you have being shortlisted for the job";
		String query = "insert into shortlistapp values(?,?,?)";
		int x = PreparedStmt.processupdate(query, jobid, mail,msg);
		if (x==0) {
			return "Application not shortlisted";
		}else {
			query = "DELETE FROM applyjob WHERE jobid =? AND umail=?";
			int y = PreparedStmt.processupdate(query, jobid, mail);
			if (y==0) {
				return "Application Shortlisted but not deleted from application";
			}
		}	
		return "Application Shortlisted";
	}
	public String deleted(String mail,int jobid){
		String msg = "you application is being rejected by the company";
		String query = "insert into deletedapp values(?,?,?)";
		int x = PreparedStmt.processupdate(query, jobid, mail,msg);
		if (x==0) {
			return "Application not deleted";
		}else {
			query = "DELETE FROM applyjob WHERE jobid =? AND umail=?";
			int y = PreparedStmt.processupdate(query, jobid, mail);
			if (y==0) {
				return "Application not deleted from application";
			}
		}	
		return "Application Deleted";
	}
	public int messageto(int jobid,String msg){
		String query = "UPDATE shortlistapp SET msg=? WHERE jobid=?";
		int x = PreparedStmt.processupdate(query, msg,jobid);
		return x;
	}
	

}
