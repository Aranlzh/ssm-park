package ssm.exceptionhandler;

/**
 * @description 异常信息类
 * @author lixujia
 *
 */
@SuppressWarnings("serial")
public class MyException extends Exception {

	private String message;//异常信息
	
	public MyException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
