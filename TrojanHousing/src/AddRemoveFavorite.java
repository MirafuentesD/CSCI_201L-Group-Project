import java.sql.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class AddFavorite
 */
@WebServlet("/AddRemoveFavorite")
public class AddRemoveFavorite extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    public static final String CREDENTIALS_STRING = "jdbc:mysql://google/Trojan_Housing?cloudSqlInstance=blissful-column-259802:us-west1:sql-db-trojanhousing&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root";
    static Connection connection = null;
   
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //String groupid = request.getParameter("groupid");
        
        //pass in username and type and propertyID from Detail.jsp
        String username = request.getParameter("username");
        if(username.compareTo("null") != 0) { // if there is a user logged in
            String type = request.getParameter("type");
            String propertyID = request.getParameter("propertyID");
            int propertyid = Integer.parseInt(propertyID);
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            String timeAdded = dtf.format(now);
           
            Connection connection = null;
            
            PreparedStatement ps2 = null;
            PreparedStatement ps3 = null;
            //ResultSet was here
 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(CREDENTIALS_STRING);
                
                String Query = "SELECT FROM Users WHERE username=?";
                PreparedStatement ps1 = null;
                ps1 = connection.prepareStatement(Query);
                ps1.setString(1, username);
                ResultSet rs = null;
                rs = ps1.executeQuery();
                int groupid = 0;
                while(rs.next())
                {
                	groupid = rs.getInt("groupID");
                }
                
                if(type.compareTo("add") == 0) { // add to favorites
                    String sql3 = "SELECT COUNT(*) as numFound FROM Favorites WHERE propertyID=? AND groupID=?;";
                    ps3 = connection.prepareStatement(sql3);
                    ps3.setString(1, propertyID);
                    ps3.setInt(2, groupid);
                    rs = ps3.executeQuery();
                    int numFound = 0;
                    while(rs.next()) {
                        numFound = rs.getInt("numFound");
                    }
                   
                    if(numFound == 0) { // if property is not already in books table, add to it
                        String sql2 = "INSERT INTO Favorites VALUES (?, ?, );";
                        ps2 = connection.prepareStatement(sql2);
                        ps2.setInt(1, propertyid);
                        ps2.setInt(2, groupid);
                        ps2.setString(3, timeAdded);
                        ps2.executeUpdate();
                    }
 
                } else { // remove from favorites
                    String sql1 = "DELETE FROM Favorites WHERE propertyID=? AND groupID=?;";
                    ps1 = connection.prepareStatement(sql1);
                    ps1.setInt(1, propertyid);
                    ps1.setInt(2, groupid);
                    ps1.executeUpdate();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
//                    if(rs != null) {
//                        rs.close();
//                    }
                    if(ps2 != null) {
                        ps2.close();
                    }
                    if(ps3 != null) {
                        ps3.close();
                    }
                    if(connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else { // no user is logged in
            out.println("Login to add to favorites.");
        }
       
        out.flush();
        out.close();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRemoveFavorite() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
 
}