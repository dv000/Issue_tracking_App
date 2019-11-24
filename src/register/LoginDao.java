package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import issue_tracking_app.connection;

public class LoginDao {
	
connection c =new connection();
	
	
	String url=c.getUrl();
	String username= c.getUsername();
	String password=c.getPassword();
	String sql="select * from users where username=? and password=?";
	

	public boolean check(String uname,String pass) {
	
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection(url,username,password);
	PreparedStatement st =con.prepareStatement(sql);
	st.setString(1, uname);
	st.setString(2,pass);
	ResultSet rs =st.executeQuery();
	
	if(rs.next()) {
		
		return true;
		
	}
	
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return false;
	}
	
}
