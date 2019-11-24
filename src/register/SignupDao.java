package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import issue_tracking_app.User;
import issue_tracking_app.connection;




public class SignupDao {

	connection c =new connection();
	
	
	String url=c.getUrl();
	String username= c.getUsername();
	String password=c.getPassword();
	

	
	
	
	public boolean addUser(String uname,String pass) {
		
		User user=new User(uname,pass);
		
		

		
		String sql="insert into users "
				+"(username,password) "
				+"values(?,?)";
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,username,password);
		
		
		PreparedStatement st =con.prepareStatement(sql);
		st.setString(1,uname);
		st.setString(2,pass);
		
		
		if(checkIfExists(uname)) {
			
			return false;
			
		}else {
			
			st.execute();
			return true;
		}
		
		
	
	
}catch(Exception e) {
	e.printStackTrace();
}
	
	return true;
}
	
	
	


	
	
	
	public boolean checkIfExists(String uname) {
		
		String sql="select * from users where username=? ";
		ResultSet rs;
		
		try {
		Class.forName("com.mysql.jdbc.Driver");

		Connection con= DriverManager.getConnection(url,username,password);
		
		
		PreparedStatement st =con.prepareStatement(sql);
		st.setString(1,uname);
		
		rs=st.executeQuery();
		
		if(rs.next()) {
			
			return true;
			
		}
	
		
		}catch(Exception e) 
		{e.printStackTrace();}
		
		
		return false;
	}
	
	
	
	
	
	
}