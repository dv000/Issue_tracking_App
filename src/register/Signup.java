package register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }


    boolean userExist;
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String uname= request.getParameter("uname");
		String pass= request.getParameter("pass");
		String pass2=request.getParameter("pass2");
		
		
		if(pass.equals(pass2)){
		
		
		
		SignupDao dao=new SignupDao();
		
		if(dao.addUser(uname, pass)) {
			
			
			HttpSession session= request.getSession();
			session.setAttribute("user", uname);
			
			response.sendRedirect("main.jsp");
			
		}else {
			
			
			 request.setAttribute("errormessage","User already exists");
			  request.getRequestDispatcher("/signup.jsp").forward(request,response);
		}
			
			
			
		}else {request.setAttribute("errormessage","Passwords dont match");
		  request.getRequestDispatcher("/signup.jsp").forward(request,response);}
			
	
			
//		if(dao.check(uname, pass)) {
//			
//			
//			HttpSession session= request.getSession();
//			session.setAttribute("username", uname);
//			
//			response.sendRedirect("main.jsp");
//			
//		}else {
//			
//			
//			 request.setAttribute("errormessage","Invalid login and password try again");
//			  request.getRequestDispatcher("/login.jsp").forward(request,response);
//		}
//		
//		
		
		
	}
}


