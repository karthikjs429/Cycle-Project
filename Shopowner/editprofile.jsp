
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
     String ename = "", eaddress = "", ephone = "";
    String name = request.getParameter("name");
   
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
   

    String upt = "update tbl_shopowner set so_name='" + name + "', so_address='" + address + "',so_phone='" + phone + "' where so_id='" + session.getAttribute("ownerid").toString() + "'";
    boolean u = con.insert(upt);
    if (u) {
%>
<script>alert('item updated');window.location.href = 'editprofile.jsp';</script>
<%
    }

    String sel = "select * from tbl_shopowner where so_id='" + session.getAttribute("ownerid").toString() + "'";
    ResultSet rs = con.select(sel);
    while (rs.next()) {
%>


<div id="main-wrapper">
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Form</h4>
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
                        <form  class="form-horizontal" method="post">
                            <div class="card-body">
                                <h4 class="card-title">Category </h4>
                                <input type="hidden"  name="pid" class="form-control" id="pid"  placeholder=""  autocomplete="off">
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Name</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="name" class="form-control" id="lname" value="<%=rs.getString("so_name")%>"  placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Phone Number</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="phone" class="form-control" id="desc" value="<%=rs.getString("so_phone")%>" placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Address</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="address" class="form-control" id="lname" value="<%=rs.getString("so_address")%>" placeholder="" required="" autocomplete="off">
                                    </div>
                                </div>

                            </div>
                            <div class="border-top">
                                <div class="card-body" align="center">
                                    <button type="reset" class="btn btn-danger" style='margin-right:16px'>Reset</button> &nbsp; 
                                    <button type="submit" name="submit" class="btn btn-primary" >Update</button> 
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<%
    }
%>
<%@include file="includes/footer.jsp" %>