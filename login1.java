
import com.sun.net.httpserver.spi.HttpServerProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/login1")
public class login1 extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Connection con = null;
        try {
            String userid = request.getParameter("user");
            String pwd = request.getParameter("pass");
            String recover = request.getParameter("recover");
            Class.forName("com.mysql.jdbc.Driver");
           
                if (recover == null) {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select * from consumer where mail='" + userid + "' and password='" + pwd + "'");
                    if (rs.next()) {
                        session.setAttribute("owner", userid);
                        session.setAttribute("name", rs.getString("name"));

                        if (rs.getString("mail").equals(userid) && (rs.getString("password").equals(pwd))) {
                            response.sendRedirect("ConsumerHome.jsp");
                        } else {
                            response.sendRedirect("invalid.jsp?id=1");
                        }
                        //out.println("welcome " + userid);
                        //out.println("<a href='logout.jsp'>Log out</a>");

                    } else {
                        response.sendRedirect("invalid.jsp?id=1");
                    }
                }
            
        } catch (Exception e) {
            response.sendRedirect("invalid.jsp?id=1");
        }
    }
}