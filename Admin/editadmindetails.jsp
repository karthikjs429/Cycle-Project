
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    String upt = "update tbl_admin set ad_fname='" + fname + "',ad_lname='" + lname + "', ad_phone='" + phone + "', ad_address='" + address + "' where ad_id='" + session.getAttribute("adminid").toString() + "'";
    boolean u = con.insert(upt);
    if (u) {
%>
<script>alert('updated');window.location.href = 'editadmindetails.jsp';</script>
<%
    }

    String sel = "select * from tbl_admin where ad_id='" + session.getAttribute("adminid").toString() + "'";
    ResultSet rs = con.select(sel);
    while (rs.next()) {
%>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Dashboard</h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dash.jsp">Home</a></li>
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
                    <form class="form-horizontal" method="POST">
                        <div class="card-body">
                            <h4 class="card-title">Edit Password</h4>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">First Namae</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="fname" value="<%=rs.getString("ad_fname")%>" class="form-control" id="lname"  required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">Last Name</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="lname" value="<%=rs.getString("ad_lname")%>" class="form-control" id="lname"  required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">Phone number</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="phone" value="<%=rs.getString("ad_phone")%>" class="form-control" id="lname"  required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">Address</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="address" value="<%=rs.getString("ad_address")%>" class="form-control" id="lname"  required="">
                                </div>
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">
                                <button type="reset" class="btn btn-danger" style='margin-right:16px'>Reset</button> &nbsp; 
                                <button type="resetpass" class="btn btn-primary" name="submit">Update</button> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
%>

<%@include file="includes/footer.jsp" %>