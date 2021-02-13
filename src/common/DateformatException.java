package common;

@SuppressWarnings("serial")
public class DateformatException extends Exception {
	private String msg;
	public DateformatException() {
	}
	public DateformatException(String msg) {
		super();
		this.msg = msg;
	}
	@Override
	public String toString(){
		//super.printStackTrace();
		return "MyDateFormatException"+msg; 
	}

}
