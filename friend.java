

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

@WebServlet("/friend")
public class friend extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String connectionURL = "jdbc:mysql://localhost:3306/data leakage";
        Connection connection;
        Statement st = null;
        ResultSet rs = null;

        try {
            // String name = request.getParameter("name");  
            String fromid = request.getParameter("fromid");
            String toid = request.getParameter("toid");
            String name=request.getParameter("name");
            String search=request.getParameter("search");

            //  if(name==null||email==null||pass==null||gender==null||country==null||state=null||add==null)
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "root", "admin");

            PreparedStatement pst = connection.prepareStatement("insert into friend(fromid,toid,chk,name) values(?,?,?,?)");//try2 is the name of the table  
            pst.setString(1, fromid);
            pst.setString(2, toid);
            pst.setString(3, "0");
            pst.setString(4, name);
            int i = pst.executeUpdate();
            if (i != 0) {
                response.sendRedirect("Search.jsp?search="+search);

            } else {
            }
        } catch (Exception e)
        {
           
            pw. println(e);
        }
    }
}
