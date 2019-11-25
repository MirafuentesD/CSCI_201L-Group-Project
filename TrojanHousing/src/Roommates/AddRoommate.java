package Roommates;

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


/**
 * Servlet implementation class AddRoommate
 */
@WebServlet("/AddRoommate")
public class AddRoommate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/Trojan_Housing?cloudSqlInstance=blissful-column-259802:us-west1:sql-db-trojanhousing&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root";
	static Connection connection = null;
	
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoommate() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String usernameToAdd = request.getParameter("username");
		String loggedInUser = (String) session.getAttribute("loggedIn");
		Boolean error = false;
		if(usernameToAdd == "") {
			out.println("Username cannot be empty");
			error = true;
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(CREDENTIALS_STRING);
			PreparedStatement insertUser = connection.prepareStatement("INSERT into RoommateTracker (username, roommate) VALUES(?, ?)");
			PreparedStatement getUsernames = connection.prepareStatement("Select username from Users WHERE username = ?");
			getUsernames.setString(1, usernameToAdd);
			ResultSet usernameSet = getUsernames.executeQuery();
			if(usernameSet.next() && error == false) {
				insertUser.setString(1, loggedInUser);
				insertUser.setString(2, usernameToAdd);
				insertUser.execute();
				out.println("Request submitted successfully");
			}else {
				out.println("User does not exist");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		out.close();
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
