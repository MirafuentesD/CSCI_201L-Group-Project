

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class userRegister
 */
@WebServlet("/userRegister")
public class userRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//smiling-memory-255417 
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/Trojan_Housing?cloudSqlInstance=blissful-column-259802:us-west1:sql-db-trojanhousing&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root";
	static Connection connection = null;
	static Statement statement = null;
	static ResultSet rs = null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			PrintWriter pw = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(CREDENTIALS_STRING);
			statement = (Statement)connection.createStatement();
			HttpSession session = request.getSession();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			//check if username already exists
			rs = statement.executeQuery("SELECT * FROM Users WHERE username='" + username +"'");
			
			System.out.println("username:" + username);
			System.out.println("password:" + password);
			System.out.println("confirm password:" + confirmPassword);
			
			if(rs.next()) {
				//username is taken
				pw.println("The username: " + username + " is already in use.");
			}
			//check if passwords match
			else {
				if(password.equals(confirmPassword)) {
					String insertion = "INSERT INTO Users (username,password) VALUES(?,?)";
					PreparedStatement ps = connection.prepareStatement(insertion);
					ps.setString(1, username);
					ps.setString(2, password);
					ps.executeUpdate();
					String update = "UPDATE Users SET groupID = userID WHERE username=?";
					ps = connection.prepareStatement(update);
					ps.setString(1, username);
					ps.executeUpdate();
					//set logged in attributes
					session.setAttribute("username", username);
				}
				else {
					pw.println("Passwords do not match.");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
