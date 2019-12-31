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
@WebServlet("/UpdateTicket")
public class UpdateTicket extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String ticketid = request.getParameter("buttonVal");
		String status   = request.getParameter("status");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			
			
			//getting issuerequestid from table
			
			String issuerequestid = "";
			
			ResultSet set = null;
			set = stmt.executeQuery("SELECT * FROM tickets WHERE id = " + ticketid);
			while(set.next()) {
				issuerequestid = set.getString("issuerequestid");
			}
			
				
			
			
			
			
			
			int rows;
			int rows1;
			if (status.toLowerCase().contains("not")) {
				rows = stmt.executeUpdate("UPDATE tickets SET status = '0' WHERE id = " + ticketid);
				rows1 = stmt.executeUpdate("UPDATE issuerequests SET status = '0' WHERE request LIKE '" + issuerequestid + "'");
				status = "Not completed";
			}
			else {
				rows = stmt.executeUpdate("UPDATE tickets SET status = '1' WHERE id = " + ticketid);
				rows1 = stmt.executeUpdate("UPDATE issuerequests SET status = '1' WHERE request LIKE '" + issuerequestid + "'");
			}

			if(rows == 1) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The ticket has been updated to: " + status +"')");
				out.println("location='Assigned.jsp';");
				out.println("</script>");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The ticket could not be updated. ')");
				out.println("location='Assigned.jsp';");
				out.println("</script>");
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}