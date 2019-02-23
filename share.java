

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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;
import org.apache.jasper.tagplugins.jstl.core.Out;
import getname.*;

@WebServlet("/share")
public class share extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String connectionURL = "jdbc:mysql://localhost:3306/data leakage";
        Connection connection;
        Statement st = null;
        ResultSet rs = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        System.out.println(dateFormat.format(cal.getTime())); //201 System.out.println(dateFormat.format(date)); //2014/08/06 15:59:4

        try {
            // String name = request.getParameter("name");  
            String imgid = request.getParameter("id");
            String fromid = request.getParameter("fromid");
            String toid = request.getParameter("toid");
            String sig = request.getParameter("sig");
            String tag=request.getParameter("tag");
            signature s = new signature();
            int chk = s.rsiva(toid, sig);
            if (chk == 0) {
                response.sendRedirect("invalidsignature.jsp");
            } else {
                //  if(name==null||email==null||pass==null||gender==null||country==null||state=null||add==null)
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(connectionURL, "root", "admin");
                PreparedStatement pst = connection.prepareStatement("insert into share(imgid,fromid,toid,time,tag) values(?,?,?,?,?)");//try2 is the name of the table  
                pst.setString(1, imgid);
                pst.setString(2, fromid);
                pst.setString(3, toid);
                pst.setString(4, dateFormat.format(cal.getTime()).toString());
                pst.setString(5, tag);



                int i = pst.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("UserHome.jsp");

                } else {
                }
            }
        } catch (Exception e) {
            pw.println(e);
        }
    }
}
