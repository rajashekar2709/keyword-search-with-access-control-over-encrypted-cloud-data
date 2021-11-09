/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package keywordsearch;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    //private static java.sql.Date getCurrentDate() //{
        //java.util.Date today = new java.util.Date();
        //return new java.sql.Date(today.getTime());
    //}

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
            
              String filename = "";
             String description = "";
            String department = "";
            String profession="";
            String file = "";
            String fname = "";
             
    String a = (String) request.getSession().getAttribute("username");
    try {
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
    try {
        List<FileItem> fields = upload.parseRequest(request);
        Iterator<FileItem> it = fields.iterator();
        if (!it.hasNext()) {
            return;
        }

        while (it.hasNext()) {
            FileItem fileItem = it.next();

             fname = fileItem.getName();
              if (fileItem.getFieldName().equals("filename")) {
                filename = fileItem.getString();
                System.out.println("filename" + filename);
              }

                if (fileItem.getFieldName().equals("description")) {
                description = fileItem.getString();
                System.out.println("description" + description);
                 }



            if (fileItem.getFieldName().equals("department")) {
                department = fileItem.getString();
                System.out.println("department" + department);
            }


             if (fileItem.getFieldName().equals("profession")) {
                profession = fileItem.getString();
                System.out.println("profession" + profession);
            }


            if(fileItem.getFieldName().equals("file")) {
               file = getStringFromInputStream(fileItem.getInputStream());
                System.out.println("file" + file);
            }

           }
                       
        try {
            con = Dbconnection.getConnection();
            pstm = con.prepareStatement("insert into upload (filename, cipher, owner,description,department,profession,skey,hash)values(?,?,?,?,?,?,?,?)");

           KeyGenerator keyGen = KeyGenerator.getInstance("AES");
           keyGen.init(128);
           SecretKey secretKey = keyGen.generateKey();
           byte[] be = secretKey.getEncoded();//encoding secretkey
           String skey = Base64.encode(be);
           System.out.println("converted secretkey to string:" + skey);
           String cipher = new encryption().encrypt(file, secretKey);
            int hash=description.hashCode();
            pstm.setString(1, filename);
            pstm.setString(2, cipher);
            pstm.setString(3, a);
            pstm.setString(4, description);
            pstm.setString(5, department);
            pstm.setString(6, profession);
            pstm.setString(7, skey);
            pstm.setInt(8, hash);


            /*Cloud Start*/
            File f = new File("C:\\Users\\RAJASHEKAR\\Desktop\\upload\\"+fname);
            FileWriter fw = new FileWriter(f);
            fw.write(cipher);
            fw.close();
            Ftpcon ftpcon = new Ftpcon();
            ftpcon.upload(f, filename);
            /*Cloud End*/
            int i = pstm.executeUpdate();
            if (i == 1) {
                response.sendRedirect("owner_upload.jsp?msg=success");
            } else {
                response.sendRedirect("owner_upload.jsp?msg1=failed");
            }
            con.close();
        } catch (Exception e) {
            out.println(e.toString());
        }

                    
                } catch (FileUploadException e) {
                } catch (Exception ex) {
                    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
            }
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
