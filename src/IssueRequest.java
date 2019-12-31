package TicketPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

//Servlet implementation class SignUp
@SuppressWarnings("serial")
@WebServlet("/IssueRequest")
public class IssueRequest extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String requestForm     = request.getParameter("request");
		String departmentForm  = request.getParameter("department");
		String descriptionForm = request.getParameter("description");
		String userName        = request.getParameter("uname");
		String Status          = request.getParameter("status");
		
		String changedRequest     = requestForm.replace("'", "");
		String changedDescription = descriptionForm.replace("'", "");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			String query = "INSERT INTO issuerequests(username, request, department, description, status) VALUES (?, ?, ?, ?, '0');";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, userName);
			stmt.setString(2, changedRequest);
			stmt.setString(3, departmentForm);
			stmt.setString(4, changedDescription);
			
			try {
				int rows = stmt.executeUpdate();
				
				if(rows == 1) {
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('The issue request was recorded.')");
					out.println("location='WelcomeUser.jsp';");
					out.println("</script>");
				} else {
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('The issue request could not be recorded. ')");
					out.println("location='IssueRequest.jsp';");
					out.println("</script>");
				}
			} catch (org.postgresql.util.PSQLException e) {
				e.printStackTrace();
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
