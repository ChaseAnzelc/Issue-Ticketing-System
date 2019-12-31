import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Servlet implementation class SignUp
@SuppressWarnings("serial")
@WebServlet("/CreateTicket")
public class CreateTicket extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String TicketName   = request.getParameter("ticketname");
		String Department   = request.getParameter("department");
		String AssignedTo   = request.getParameter("user");
		String Priority     = request.getParameter("priority");
		String Date         = request.getParameter("date");
		String Description  = request.getParameter("description");
		String CreatedBy    = request.getParameter("uname");
		String Status       = request.getParameter("status");
		String IssueRequest = request.getParameter("issuerequestid");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			String query = "INSERT INTO tickets(Name, Department, AssignedTo, Priority, scheduledcompletiondate, description, createdby, status, issuerequestid) VALUES (?,?,?,?,?,?,?,'0',?);";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, TicketName);
			stmt.setString(2, Department);
			stmt.setString(3, AssignedTo);
			stmt.setString(4, Priority);
			stmt.setString(5, Date);
			stmt.setString(6, Description);
			stmt.setString(7, CreatedBy);
			stmt.setString(8, IssueRequest);
			
			int rows = stmt.executeUpdate();
			
			if(rows == 1) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The ticket was recorded.')");
				out.println("location='WelcomeUser.jsp';");
				out.println("</script>");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The ticket could not be created. ')");
				out.println("location='TicketForm.jsp';");
				out.println("</script>");
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
;	}
}
