package issue_tracking_app;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import register.Login;

/**
 * Servlet implementation class IssueServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		
		
		String delete=request.getParameter("delete");
		
		
		
		if(delete!=null) {
			
			Issue issue=new Issue();
			
			issue.deleteIssue(delete);
			  request.getRequestDispatcher("/main.jsp").forward(request,response);
		
		}
		
		
		String idIssue =request.getParameter("id");
		String title= request.getParameter("title");
		String description= request.getParameter("description");
		String assignedTo=request.getParameter("assignedTo");
		String type=request.getParameter("type");
		String status=request.getParameter("status");
		
		HttpSession session= request.getSession();
	    session.getAttribute("user");
		String userCreated=(String)session.getAttribute("user");
		
		Issue issue=new Issue(title,description,type,assignedTo,userCreated);
		
		

		//if(!issue.checkUser(assignedTo) ) response.sendRedirect("/main.jsp");


		
		
		
		if(idIssue!=null) {
		
		issue.editIssue(idIssue,title,description,assignedTo,type,status);
		//request.setAttribute("id",idIssue);
		idIssue=null;
		}
		
		else {
		
		issue.addIssue();
		}
	
		
		
		
	 
		  request.getRequestDispatcher("/main.jsp").forward(request,response);
		
	}
	
	
}
	
	


