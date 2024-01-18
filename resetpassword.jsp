<%@page import="java.sql.ResultSet"%>
<%@include file="includes/sidebar.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con" ></jsp:useBean>
<%
    String password = "";
    String selP = "select * from tbl_login where login_id='" + session.getAttribute("userid").toString() + "'";

    ResultSet rs = con.select(selP);
    if (rs.next()) {
        password = rs.getString("login_password");
    }

    if (request.getParameter("resetpass") != null) {

    }
    if (request.getParameter("resetpass") != null) {
        if (password.equals(request.getParameter("currentpass"))) {
            if (request.getParameter("newpass").equals(request.getParameter("confirmpass"))) {
                String upt = "update tbl_login set login_password='" + request.getParameter("newpass") + "' where login_id='" + session.getAttribute("userid") + "'";

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


<div id="colorlib-main">
    <div class="col-lg-12 ftco-animate">


        <div class="pt-5 mt-5">
            <h3 class="mb-5 font-weight-bold">Edit Profile</h3>

            <!-- END comment-list -->

            <div class="comment-form-wrap pt-10">

                <form action="#" method="POST" class="p-4 p-md-9 bg-light">
                    <div class="form-group">
                        <label for="cpass">Current Password *</label>
                        <input type="text" name="currentpass" class="form-control" id="name">
                    </div>

                    <div class="form-group">
                        <label for="npass">New Password</label>
                        <input type="text" name="newpass" class="form-control" id="website">
                    </div>
                    <div class="form-group">
                        <label for="npass">Confirm Password</label>
                        <input type="text" name="confirmpass" class="form-control" id="website">
                    </div>
                    <div align="right">
                        <button type="submit" name="resetpass" class="btn btn-outline-success btn-rounded waves-effect">Reset Password</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

</div>
<%@include file="includes/scripts.jsp" %>