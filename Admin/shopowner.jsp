
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String regdate = request.getParameter("regdate");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if (password.equals(cpassword)) {
            String sel = "select * from tbl_login where login_email='" + email + "'";
            ResultSet rs = con.select(sel);
            if (rs.next()) {
%>
<script>alert('This user already Exist');</script>
<%
    } else {
        String ins = "insert into tbl_login (login_email,login_password,login_role,login_status) values('" + email + "','" + password + "','shopowner','active')";
        boolean r = con.insert(ins);
        if (r) {
            String seld = "select * from tbl_login order by login_id desc limit 1";
            ResultSet rsd = con.select(seld);
            if (rsd.next()) {
                String shopownerid = rsd.getString("login_id");
                String insr = "insert into tbl_shopowner (so_name,so_address,so_regdate,so_phone,login_id,so_status) values('" + name + "','" + address + "','" + regdate + "','" + phone + "','" + shopownerid + "','active')";
                boolean i = con.insert(insr);
                if (i) {
                    %>
<script>alert('Registered Successfully')</script>
<%
                }
            }
        }
    }
    //response.sendRedirect("../admin/login.jsp");
} else {
%>
<script>alert('Confirm password is incorrect')</script>
<%
        }
    }
%>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Dashboard</h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Library</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form class="form-horizontal" method="post">
                        <div class="card-body">
                            <h4 class="card-title">Add admin here</h4>
                            <div class="form-group row">
                                <label for="fname" class="col-sm-2 text-right control-label col-form-label">First Name</label>
                                <div class="col-sm-9">
                                    <input type="text" name="name" class="form-control" id="fname" placeholder=" Name Here" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">E-mail</label>
                                <div class="col-sm-9">
                                    <input type="email" name="email" class="form-control" id="lname" placeholder="E-mail" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Password</label>
                                <div class="col-sm-9">
                                    <input type="password" name="password" class="form-control" id="lname" placeholder="Password Here" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Confirm Password</label>
                                <div class="col-sm-9">
                                    <input type="password" name="cpassword" class="form-control" id="lname" placeholder="Confirm Password Here" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email1" class="col-sm-2 text-right control-label col-form-label">Registration Date </label>
                                <div class="col-sm-9">
                                    <input type="date" name="regdate" class="form-control" id="email1" placeholder="Company Name Here">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cono1" class="col-sm-2 text-right control-label col-form-label">Contact No</label>
                                <div class="col-sm-9">
                                    <input type="number" name="phone" class="form-control" id="cono1" placeholder="+91 999 999 9999" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cono1" class="col-sm-2 text-right control-label col-form-label">Address</label>
                                <div class="col-sm-9">
                                    <input type="text" name="address" class="form-control" id="cono1"  required="">
                                </div>
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">
                                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    
</div>

<%@include file="includes/footer.jsp" %>