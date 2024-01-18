
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String password = "";
    String selP = "select * from tbl_login where login_id='" + session.getAttribute("adminid").toString() + "'";

    ResultSet rs = con.select(selP);
    if (rs.next()) {
        password = rs.getString("login_password");
    }

    if (request.getParameter("resetpass") != null) {

    }
    if (request.getParameter("resetpass") != null) {
        if (password.equals(request.getParameter("currentpass"))) {
            if (request.getParameter("newpass").equals(request.getParameter("confirmpass"))) {
                String upt = "update tbl_login set login_password='" + request.getParameter("newpass") + "' where login_id='" + session.getAttribute("adminid") + "'";

                boolean b = con.insert(upt);
                if (b) {
%>
<script>alert('Successfully Updated')</script>
<%
} else {
%>
<script>alert('Updation Failed!!!!')</script>
<%
    }
} else {
%>
<script>alert('new and old  password doesnot match')</script>
<%
    }
} else {
%>
<script>alert('wrong password')</script>
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
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">Old Password</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="currentpass"  class="form-control" id="lname"  required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">New Password</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="newpass"  class="form-control" id="lname"  required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 text-right control-label col-form-label">Confirm Password</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="confirmpass"  class="form-control" id="lname"  required="">
                                </div>
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">

                                <button type="resetpass" class="btn btn-primary" name="resetpass">Update</button> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>