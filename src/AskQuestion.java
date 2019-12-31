import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet("/AskQuestion")
public class AskQuestion extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String email = request.getParameter("email");
		String message  = request.getParameter("message");

		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			String query = "INSERT INTO questions (email, question) values (?,?);";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, message);

			int result = stmt.executeUpdate();
			if (result > 0) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The question was sent succesfully, you will get a response in your email!. ')");
				out.println("location='WelcomeUser.jsp';");
				out.println("</script>");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The question could not be created.')");
				out.println("location='AskQuestion.jsp';");
				out.println("</script>");
			}
	
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}