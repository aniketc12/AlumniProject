<%@page import="com.ImgFile"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="getConnection.jsp"%> <!-- to connect a database-->

<%     try {
   
         
    String type=session.getAttribute("type").toString();
    if(type.equals("student"))
    {
    
   
        String email=session.getAttribute("username").toString();
        String ImageFile = "";
        String id="";
        int id1;
        String itemName = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.getMessage();
            }

            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equals("ImageFile")) {
                        ImageFile = value;
                    }
//                    if(name.equals("idInModal")){
//                        id=value;
//                    }

                } else {
                    try {
                        
                        itemName = item.getName();
                        itemName = FilenameUtils.getName(itemName);
                        System.out.println(itemName);
                        ImgFile a=new ImgFile();
                        itemName=a.change(itemName, email);
                       //File savedFile = new File("D:\\Aniket\\apache-tomcat-7.0.55\\webapps\\AlumniProject\\img\\"+itemName);
                       File savedFile = new File("C:\\Users\\Aniket C\\Documents\\NetBeansProjects\\AlumniProject\\web\\img\\"+itemName);
                        
                       // File savedFile = new File("AlumniProject\\web\\img\\"+itemName);
                        item.write(savedFile);
                    } catch (Exception e) {
                        out.println(config.getServletContext().getRealPath("/"));
                        out.println("Error" + e.getMessage());
                        request.getRequestDispatcher("profile.jsp").include(request,response);
                    }
                }
            }
            
                try{
                    
                    
                    System.out.println(email);
                    System.out.println(itemName);
                    String sql="update student set image='"+itemName+"' where "
                            + "email='"+email+"'";
                st.executeUpdate(sql);
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Image uploaded');");
   out.println("location='profile.jsp';");
   out.println("</script>");
            } catch (Exception el) {
              
               out.println("Inserting error" + el.getMessage());
               request.getRequestDispatcher("profile.jsp").include(request,response);
            }
        }
    }
    
    else if(type.equals("alumni"))
    {
        try {
        String email=session.getAttribute("username").toString();
        String ImageFile = "";
        String id="";
        int id1;
        String itemName = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.getMessage();
            }

            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equals("ImageFile")) {
                        ImageFile = value;
                    }
//                    if(name.equals("idInModal")){
//                        id=value;
//                    }

                } else {
                    try {
                        
                        itemName = item.getName();
                        itemName = FilenameUtils.getName(itemName);
                        System.out.println(itemName);
                        ImgFile a=new ImgFile();
                        itemName=a.change(itemName, email);
                        File savedFile = new File("C:\\Users\\Aniket C\\Documents\\NetBeansProjects\\AlumniProject\\web\\img\\"+itemName);
                        item.write(savedFile);
                    } catch (Exception e) {
                        out.println(config.getServletContext().getRealPath("/"));
                        out.println("Error" + e.getMessage());
                        request.getRequestDispatcher("profile.jsp").include(request,response);
                    }
                }
            }
            
                try{
                    
                    
                    System.out.println(email);
                    System.out.println(itemName);
                    String sql="update alumni set image='"+itemName+"' where "
                            + "email='"+email+"'";
                st.executeUpdate(sql);
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Image uploaded');");
   out.println("location='profile.jsp';");
   out.println("</script>");
            } catch (Exception el) {
              
               out.println("Inserting error" + el.getMessage());
               request.getRequestDispatcher("profile.jsp").include(request,response);
            }
        }
    } catch (Exception e) {
        out.println(e.getMessage());
        request.getRequestDispatcher("login.jsp").include(request,response);
   }
    }} catch (Exception e) {
        out.println(e.getMessage());
        request.getRequestDispatcher("login.jsp").include(request,response);
   }
%>





