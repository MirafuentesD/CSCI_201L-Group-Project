

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class userDataBase
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
			statement = (Statement) connection.createStatement();
			HttpSession session = request.getSession();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			rs = statement.executeQuery("SELECT * FROM Users WHERE username='"+username+"' AND password='" +password+"'");
			boolean loggedIn = rs.next();
			if(loggedIn) {
				session.setAttribute("username", username);
			}
			else {
				//display warning to user that the user they entered does not exist
				String error = "Username and password do not match any user in this database.";
				pw.println(error);
			}
			pw.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
