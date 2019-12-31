import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class RecordSet implements SetConnection{
	
	public static void main(String[] args) throws SQLException {
		ResultSet rs  = GetUserTickets("bdahal0402");
		while(rs.next())
		{
		    System.out.println(rs.getString("request")); 
		}
	}
	
	public static ResultSet GetUserTickets(String user)
	    {
	        Statement st = null;
			Connection con = null;
			
			
	        try {
				Class.forName("org.postgresql.Driver");
			} catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			try {
				con = DriverManager.getConnection(url, username, password);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        try {
	            st = con.createStatement();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        }
	
	        ResultSet rs = null;
	        try {
	            rs = st.executeQuery("SELECT * from issuerequests where username = '" + user + "'");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        }
	
	        return rs;

	    }
	
	
	public static ResultSet GetDepartmentTickets(String department)
    {
        Statement st = null;
		Connection con = null;
		
		
        try {
			Class.forName("org.postgresql.Driver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        try {
            st = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        ResultSet rs = null;
        try {
            rs = st.executeQuery("SELECT * from issuerequests where department = '" + department + "'");
            //st.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return rs;

    }
	
	public static ResultSet GetAllTickets()
    {
        Statement st = null;
		Connection con = null;
		
		
        try {
			Class.forName("org.postgresql.Driver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        try {
            st = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        ResultSet rs = null;
        try {
            rs = st.executeQuery("SELECT * from issuerequests");
            //st.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return rs;

    }
}