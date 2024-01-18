<%-- 
    Document   : product_upload
    Created on : 15 Mar, 2021, 11:55:29 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : company_file_upload
    Created on : Feb 11, 2020, 1:08:24 PM
    Author     : Shalu
--%>

<%@page import="java.security.SecureRandom"%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%--<jsp:useBean id="mail" class="email.mailconnection"></jsp:useBean>--%>
<jsp:useBean class="DataBase.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <body>
        <%

            String field_name = "";
            FileItem f_item = null;
            String file_name = "";

            File savedFile = null;
            String fn = "", pf = "", logid = "";

            String field[] = new String[20];
            String value[] = new String[20];

            //checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                System.out.println("ifff");

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext()) {
                    System.out.println("ifff 1");
                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if (f_item.isFormField()) {
                        System.out.println("ifff 2");
                        //getting fieldname and value
                        field[k] = f_item.getFieldName();
                        value[k] = f_item.getString();
                        System.out.println(k + " " + value[k]);
                        k++;
                    } else {

                        //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();
                        if (field_name.equals("txtfile")) {
                            String ext = file_name.substring(file_name.lastIndexOf("."));
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\admin\\assets\\images\\web\\";
                            Random r = new Random();
                            int r_num = r.nextInt(1111) + 999;
                            System.out.println("ifff1 : " + file_path);
                            fn = "IMG_" + r_num + ext;
                            System.out.println("ifff1 : " + file_name);
                            //creating a file object
                            savedFile = new File(file_path + fn);
                            try {
                                //writing the file object
                                f_item.write(savedFile);

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }

                    }

                }

                if (value[0].equals("")) {
                    String sel = "select * from tbl_category where ct_id='" + value[0] + "' and ct_name='" + value[1] + "'";
                    ResultSet rs = obj.select(sel);
                    if (rs.next()) {
        %>
        <script>alert('items already exist');</script>
        <%
        } else {
            String ins = "insert into tbl_category (ct_name,ct_desc,ct_image) values('" + value[0] + "','" + value[1] + "','" + fn + "')";
           
        boolean a = obj.insert(ins);
            if (a) {
        %>
        <script>alert('item added');
           setTimeout(function () {
               window.location.href = 'category.jsp'
            }, 100);
        </script>
        <%
        } else {
        %>
        <script>alert('item cannot add');
            setTimeout(function () {
                window.location.href = 'category.jsp'
            }, 100);
        </script>
        <%
                }
            }
        } else {
            String upt = "update  tbl_category set ct_name='" + value[1] + "',ct_desc='" + value[2] + "',ct_image='" + fn + "' where ct_id='" + value[0] + "'";
            boolean d = obj.insert(upt);
            if (d) {
        %>
        <script>alert('item updated');window.location.href = 'category.jsp';</script>
        <%
        } else {
        %>
        <script>alert('item not updated');</script>
        <%
                    }
                }

            }

        %>

    </body>
</html>


