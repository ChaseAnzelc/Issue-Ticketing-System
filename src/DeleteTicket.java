import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/DeleteTicket")

public class DeleteTicket extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String ticketid = request.getParameter("deleteButton");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			
			String ticketname = "";
			String requestName = "";
			
			ResultSet set = null;
			set = stmt.executeQuery("SELECT * FROM tickets WHERE id = " + ticketid);
			while(set.next()) {
				ticketname = set.getString("name");
				requestName = set.getString("issuerequestid");
			}
			
			//deleting ticket
			System.out.println("deleting tickets row");
			stmt.executeUpdate("DELETE from tickets WHERE id = " + ticketid);
			
			//deleting associated request
			stmt.executeUpdate("DELETE from issuerequests WHERE request LIKE '" + requestName + "'");
			
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Ticket named: [" + ticketname + "] has been deleted')");
			out.println("location='ViewAllIssueRequests.jsp';");
			out.println("</script>");
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
