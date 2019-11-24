package issue_tracking_app;

public class connection {

	
	String url="jdbc:mysql://localhost:3306/issue_tracking_app";
	String username= "root";
	String password="lonis2511";
	
	
	public String getUrl() {
		return url;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
