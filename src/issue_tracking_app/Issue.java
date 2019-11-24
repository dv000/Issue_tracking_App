package issue_tracking_app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import javax.servlet.http.HttpSession;
import register.Login;


public class Issue {

	private String title;
	private String description;
	private String type;
	private String assignedTo;
	private Date createDate;
	private Date editDate;
	private String lastUserEdit;
	private String userCreated;
	private String Status;
	
	
	
connection c =new connection();
	
	
	String url=c.getUrl();
	String username= c.getUsername();
	String password=c.getPassword();
	
	
	
	
	public Issue() {}
	
	
	
	
	
	
	
public Issue(String title, String description, String type, String assignedTo,String userCreated) {
		super();
		this.title = title;
		this.description = description;
		this.type = type;
		this.assignedTo = assignedTo;
		this.createDate=createDate();
		this.editDate=createDate();
		this.userCreated=userCreated;
		this.lastUserEdit=userCreated;
		this.Status="New";
	}












public boolean addIssue() {
		
		
		
		
		
		String sql="insert into issues"
				+"(title,description,type,assignedTo,createDate,editDate,lastUserEdit,userCreated,Status) "
				+"values(?,?,?,?,?,?,?,?,?)";
	
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,username,password);
			
			
			PreparedStatement st =con.prepareStatement(sql);
			st.setString(1,title);
			st.setString(2,description);
			st.setString(3,type);
			st.setString(4,assignedTo);
			st.setString(5,createDate.toString());
			st.setString(6,editDate.toString());
			st.setString(7,lastUserEdit);
			st.setString(8,userCreated);
			st.setString(9,Status);

			
		st.execute();
			
			
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		
		return true;
	}
		
		
		


public Date createDate() {
	
	Date date=new Date();
	
	return date;
	
}



public boolean editIssue(String id,String title,String description,String assignedTo,String type,String status){
	
	//int idIs= Integer.parseInt(id);
	
	
	
	String sql="update issues "//+idIs
			+"set title=?, description=?, type=?, assignedTo=?, editDate=?, lastUserEdit=?, Status=?"
			+"where idIssue=?";
	
	
	
	
	
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,username,password);
		
		
		PreparedStatement st =con.prepareStatement(sql);
		st.setString(1,title);
		st.setString(2,description);
		st.setString(3,type);
		st.setString(4,assignedTo);
	
		st.setString(5,editDate.toString());
		st.setString(6,lastUserEdit);
		st.setString(7,status);
		st.setString(8,id);
		
	st.execute();
		
		
	
	
}catch(Exception e) {
	e.printStackTrace();
}
	
	return true;

	
	
	
	
}












public void deleteIssue(String id) {
	
	
	
	String sql="delete from issues "
			+"where idIssue=?";
	
	
	
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,username,password);

		
		PreparedStatement st =con.prepareStatement(sql);

	
		st.setString(1,id);
		
		st.execute();

	}
	
	catch(Exception e) {
		e.printStackTrace();
	}
		
	
		
		
		
	}



public boolean checkUser(String assignedTo) {
	
	boolean b=false;
	String sql="SELECT * FROM issue_tracking_app.users where username=?";
			//	+"where username=?";
	
				
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,username,password);

		
		PreparedStatement st =con.prepareStatement(sql);

		st.setString(1,assignedTo);
		ResultSet rs= st.executeQuery();
	
		
	rs.first();
		


	
	}
	
	catch(Exception e) {
		e.printStackTrace();
	}
		
	
	
	return b;
	
	
	
	
}



}




		
	


































