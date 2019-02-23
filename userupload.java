/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.Iterator;

/**
 *
 * @author vinoth
 */
@WebServlet(urlPatterns = {"/userupload"})
public class userupload extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String tag = request.getParameter("tag");
            String mail = request.getParameter("userid");
            String file = request.getParameter("file");
            String date = request.getParameter("date");

            int size = 0;
            int p = 0;
            int n = 0;

//////////////////////////////////
            String saveFile = "";
            String contentType = request.getContentType();
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

// Set factory constraints
            factory.setSizeThreshold(4012);
//factory.setRepository("c:");0

// Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

// Set overall request size constraint
            //upload.setSizeMax(10024);

// Parse the request
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            byte[] data = null;
            String fileName = null;
// Process the uploaded items
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    //processFormField(item);

                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equalsIgnoreCase("tag")) {
                        tag = value;
                        out.print("From value is : " + tag);
                    } else if (name.equalsIgnoreCase("userid")) {
                        mail = value;
                        out.print("From value is : " + mail);
                    } else {
                        System.out.println("ERROR");
                    }
                } else {
                    data = item.get();
                    fileName = item.getName();
                }
            }
            saveFile = fileName;

            String path = request.getSession().getServletContext().getRealPath("/");
            String patt = path.replace("\\build", "");

            //String strPath = patt + "\\bio\\" + mail + "\\";
            File internalpath = new File(patt);

            if (!internalpath.exists()) {
                internalpath.mkdir();
            }
            File ff = new File(internalpath + "\\" + saveFile);


            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(data, 0, data.length);
            fileOut.flush();
            fileOut.close();
            int fsize = (int) ff.length();
            out.println(saveFile);
            /////////////////////////////////////////////////////////
            FileInputStream fis = null;
            File image = null;
            FileInputStream fis1 = null;
            File image1 = null;
            Connection con = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;

            fis = new FileInputStream(ff);
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            System.out.println(dateFormat.format(cal.getTime())); //201 System.out.println(dateFormat.format(date)); //2014/08/06 15:59:4

            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");

                st = con.prepareStatement("insert into userupload(fname,file,userid,time,tag) values (?,?,?,?,?)");
                st.setString(1, saveFile);
                if (file != "") {
                    st.setBinaryStream(2, (InputStream) fis, (int) (ff.length()));
                } else {
                    st.setBinaryStream(2, null);
                }
                st.setString(3, mail);
                st.setString(4, dateFormat.format(cal.getTime()).toString());
                st.setString(5, tag);
                int i = st.executeUpdate();
                response.sendRedirect("UserHome.jsp");
            } catch (Exception e) {
                out.println(e);
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(File_Upload.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (FileUploadException ex) {
            Logger.getLogger(File_Upload.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
