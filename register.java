

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author sivakumar
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;
import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("/register")
public class register extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String connectionURL = "jdbc:mysql://localhost:33006/data leakage";
        Connection connection;
        Statement st = null;
        ResultSet rs = null;

        try {
            // String name = request.getParameter("name");  
            String Name = request.getParameter("name");
            String Email = request.getParameter("email");
            String Pass = request.getParameter("pass");
            String Mobile = request.getParameter("mobile");
            String Country = request.getParameter("country");
            String Address = request.getParameter("address");
            //  if(name==null||email==null||pass==null||gender==null||country==null||state=null||add==null)
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "root", "admin");
            String sql = "select * from register where Email='"+Email+"'";
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                response.sendRedirect("invalid.jsp?id=0");
            } else {
                PreparedStatement pst = connection.prepareStatement("insert into register(UserName,Email,password,mobile,country,address) values(?,?,?,?,?,?)");//try2 is the name of the table  
                pst.setString(1, Name);
                pst.setString(2, Email);
                pst.setString(3, Pass);
                pst.setString(4, Mobile);
                pst.setString(5, Country);
                pst.setString(6, Address);


                int i = pst.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("Home.jsp");

                } else {
                }
            }
        } catch (Exception e) {
            response.sendRedirect("Already.jsp");
        }
    }
}
