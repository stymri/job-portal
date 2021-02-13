package user;

public class MessageBean {
	private int jobid;
	private String umail;
	private String msg;
	private boolean deleted;
	public MessageBean(int jobid, String umail, String msg, boolean deleted) {
		this.jobid = jobid;
		this.umail = umail;
		this.msg = msg;
		this.deleted = deleted;
	}
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
}
