<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("login") != null) {
        String em = request.getParameter("email");
        String ps = request.getParameter("password");
        String sel = "select * from tbl_login where login_email='" + em + "' and login_password='" + ps + "' and login_status='active'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
            String role = rs.getString("login_role");
            session.setAttribute("role", role);
            session.setAttribute("loginid", rs.getString("login_id"));
            if (role.equals("admin")) {
                String selA = "select * from tbl_admin where login_id='" + rs.getString("login_id") + "' ";
                ResultSet rsA = con.select(selA);
                if (rsA.next()) {
                    session.setAttribute("adminid", rsA.getString("ad_id"));
                    response.sendRedirect("../admin/dash.jsp");
                } else {
%>
<script>alert('Invalid');</script>
<%
    }
} else if (role.equals("user")) {

    String selA = "select * from tbl_user_reg where login_id='" + rs.getString("login_id") + "' ";
    ResultSet rsA = con.select(selA);
    if (rsA.next()) {
        session.setAttribute("userid", rsA.getString("user_id"));
        response.sendRedirect("../shop/home.jsp");
    } else {
%>
<script>alert('Invalid');</script>
<%
    }
} else if (role.equals("shopowner")) {
    String selA = "select * from tbl_shopowner where login_id='" + rs.getString("login_id") + "' ";
    ResultSet rsA = con.select(selA);
    if (rsA.next()) {
        session.setAttribute("ownerid", rsA.getString("so_id"));
        response.sendRedirect("../shopowner/product.jsp");
    } else {
%>
<script>alert('Invalid');</script>
<%
    }
} else if (role.equals("deliveryboy")) {

    String selA = "select * from tbl_deliveryboy where login_id='" + rs.getString("login_id") + "' ";
    ResultSet rsA = con.select(selA);
    if (rsA.next()) {
        session.setAttribute("deliveryboyid", rsA.getString("d_id"));
        response.sendRedirect("../delivery/pendinglist.jsp");
    } else {
%>
<script>alert('Invalid');</script>
<%
        }
    }

} else {
%>
<script>alert('Invalid Credentials');</script>
<%
        }
    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="logreg/css/logstyle.css">
    </head>
    <body>

        <form class="box"  method="post">
            <h1>Login</h1>
            <input type="email" autocomplete="off" name="email" placeholder="email">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" name="login" value="Login"  data-toggle="modal" data-target="#ModalWarning">


            <a href="register.jsp">Don't have an account,Create here</a>
        </form>



    </body>
</html>
