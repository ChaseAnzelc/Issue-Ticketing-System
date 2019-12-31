

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

// Servlet implementation class Login
@SuppressWarnings("serial")
@WebServlet("/Login")
public class Login extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	
	private int roleID = 0;

	private static final long serialIDVersion = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");
		
		Connection con = null;
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			//System.out.println("DB connected successfully!");
			
			String query = "SELECT roleid, username, userPassword FROM users WHERE username = ? AND userpassword = ?;";
			PreparedStatement stmt = con.prepareStatement(
					query);
			stmt.setString(1, name);
			stmt.setString(2, AES.encrypt(pass, "passwordEncryption"));

	        	ResultSet rs2 = stmt.executeQuery();
			
			if(rs2.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", name);
				response.sendRedirect("WelcomeUser.jsp");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong username and password combination.');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setRoleID(int rID) {
		roleID = rID;
	}
	public int getRoleID() {
		return roleID;
	}
	
}