package register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String uname= request.getParameter("uname");
		String pass= request.getParameter("pass");
		
		
		LoginDao dao=new LoginDao();
	
		
		
		if(dao.check(uname, pass)) {
			
			
			HttpSession session= request.getSession();
			session.setAttribute("user", uname);
			
			response.sendRedirect("main.jsp");
			
		}else {
			
			
			 request.setAttribute("errormessage","Invalid username or password try again");
			  request.getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
	}

}
