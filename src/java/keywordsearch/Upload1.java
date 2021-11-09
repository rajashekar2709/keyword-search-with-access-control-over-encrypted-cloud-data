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
public class Upload1 extends HttpServlet {

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
            
              String filename1 = "";
              String filename2 = "";
              String filename3 = "";
             String description = "";
            String skey = "";
            String file1 = "";
            String file2 = "";
            String file3 = "";
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
                          if (fileItem.getFieldName().equals("description")) {
                            description = fileItem.getString();
                            System.out.println("description" + description);
                        
                        }
                          
                            if (fileItem.getFieldName().equals("skey")) {
                            skey = fileItem.getString();
                            System.out.println("skey" + skey);
                        
                        }
                            
                   
                        
                        if (fileItem.getFieldName().equals("filename1")) {
                            filename1 = fileItem.getString();
                            System.out.println("File Name1" + filename1);
                        }
                         if (fileItem.getFieldName().equals("filename2")) {
                            filename2 = fileItem.getString();
                            System.out.println("File Name2" + filename2);
                        }
                          if (fileItem.getFieldName().equals("filename3")) {
                            filename3 = fileItem.getString();
                            System.out.println("File Name3" + filename3);
                        }
                     
                        if(fileItem.getFieldName().equals("file1")) {
                           file1 = getStringFromInputStream(fileItem.getInputStream());
                            System.out.println("file1" + file1);
                        }
                        if(fileItem.getFieldName().equals("file2")) {
                           file2 = getStringFromInputStream(fileItem.getInputStream());
                            System.out.println("file2" + file2);
                        }
                        if(fileItem.getFieldName().equals("file3")) {
                           file3 = getStringFromInputStream(fileItem.getInputStream());
                            System.out.println("file3" + file3);
                        }
                        
                       }
                       
                            try {
                                con = Dbconnection.getConnection();
                                pstm = con.prepareStatement("insert into upload1 (filename1,filename2,filename3,data1,data2,data3,owner,description,skey)values(?,?,?,?,?,?,?,?,?)");
                               
                               
                               byte[] bs = Base64.decode(skey);
                               SecretKey secretKey = new SecretKeySpec(bs, "AES");
                                System.out.println(secretKey);
                               
                                String cipher1 = new encryption().encrypt(file1, secretKey);
                                String cipher2 = new encryption().encrypt(file2, secretKey);
                                String cipher3 = new encryption().encrypt(file3, secretKey);
                                
                               
                                pstm.setString(1, filename1);
                                pstm.setString(2, filename2);
                                pstm.setString(3, filename3);
                                pstm.setString(4, cipher1);
                                pstm.setString(5, cipher2);
                                pstm.setString(6, cipher3);
                                pstm.setString(7, a);
                                pstm.setString(8, description);
                                pstm.setString(9, skey);
                               
                              
                                /*Cloud Start*/
                                File f1 = new File("C:\\Users\\RAJASHEKAR\\Desktop\\upload\\"+filename1);
                                FileWriter fw1 = new FileWriter(f1);
                                File f2 = new File("C:\\Users\\RAJASHEKAR\\Desktop\\upload\\"+filename2);
                                FileWriter fw2 = new FileWriter(f2);
                                File f3 = new File("C:\\Users\\RAJASHEKAR\\Desktop\\upload\\"+filename3);
                                FileWriter fw3 = new FileWriter(f3);
                                fw1.write(cipher1);
                                fw1.close();
                                fw2.write(cipher2);
                                fw2.close();
                                fw3.write(cipher3);
                                fw3.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f1, filename1);
                                ftpcon.upload(f2, filename2);
                                ftpcon.upload(f3, filename3);
                                /*Cloud End*/
                                int i = pstm.executeUpdate();
                                if (i == 1) {
                                    response.sendRedirect("ownerfileupload.jsp?msg1=success");
                                } else {
                                    response.sendRedirect("ownerfileupload.jsp?msgg=failed");
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                    
                    
                } catch (FileUploadException e) {
                } catch (Exception ex) {
                    Logger.getLogger(Upload1.class.getName()).log(Level.SEVERE, null, ex);
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
