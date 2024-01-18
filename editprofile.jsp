<%@page import="java.sql.ResultSet"%>
<%@include file="includes/sidebar.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String weight = request.getParameter("weight");
    String height = request.getParameter("height");
    String age = request.getParameter("age");

    String upt = "update tbl_user_reg set user_name='" + name + "', user_phone='" + phone + "', user_weight='" + weight + "', user_height='" + height + "', user_age='" + age + "' where user_id='" + session.getAttribute("userid").toString() + "'";
    boolean u = con.insert(upt);
    if (u) {
%>
<script>alert('item updated');window.location.href = 'editprofile.jsp';</script>
<%
    }

    String sel = "select * from tbl_user_reg where user_id='" + session.getAttribute("userid").toString() + "'";
    ResultSet rs = con.select(sel);
    while (rs.next()) {
%>
<div id="colorlib-main">
    <div class="col-lg-12 ftco-animate">


        <div class="pt-5 mt-5">
            <h3 class="mb-5 font-weight-bold">Edit Profile</h3>
            <div class="comment-form-wrap pt-10">

                <form action="#" method="POST" class="p-3 p-md-5 bg-light">
                    <div class="form-group">
                        <label for="name"><b>Name *</b></label>
                        <input type="text" name="name" value="<%=rs.getString("user_name")%>" class="form-control" id="name">
                    </div>

                    <div class="form-group">
                        <label for="phone"><b>Phone</b></label>
                        <input type="text" name="phone" value="<%=rs.getString("user_phone")%>" class="form-control" id="website">
                    </div>
                    <div class="form-group">
                        <label for="Weight"><b>Weight</b>(kg)</label>
                        <input type="text" name="weight" value="<%=rs.getString("user_weight")%>" class="form-control" id="website">
                    </div>
                    <div class="form-group">
                        <label for="Height"><b>Height</b>(cm)</label>
                        <input type="text" name="height" value="<%=rs.getString("user_height")%>"  class="form-control" id="website">
                    </div>
                    <div class="form-group">
                        <label for="Age"><b>Age</b></label>
                        <input type="text" name="age" value="<%=rs.getString("user_age")%>"  class="form-control" id="website">
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Update" class="btn py-3 px-4 btn-primary">
                    </div>

                </form>
            </div>
        </div>
    </div>

</div>
<%
    }
%>
<%@include file="includes/scripts.jsp" %>