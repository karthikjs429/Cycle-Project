
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String ename = "", edesc = "", eimage = "", ectid = "";
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String image = request.getParameter("image");

    }
    if (request.getParameter("del") != null) {

        String del = "delete from tbl_category where ct_id='" + request.getParameter("del") + "'";
        boolean c = con.insert(del);
        if (c) {
%>
<script>alert('Deleted')</script>
<%
        }
    }
    if (request.getParameter("eid") != null) {
        String sel = "select * from tbl_category where ct_id='" + request.getParameter("eid") + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
            ename = rs.getString("ct_name");
            edesc = rs.getString("ct_desc");
            eimage = rs.getString("ct_image");

        }
    }
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
                        <form action="cat_upload.jsp" enctype="multipart/form-data" class="form-horizontal" method="post">
                            <div class="card-body">
                                <h4 class="card-title">Category </h4>
                                <input type="hidden"  name="pid" class="form-control" id="pid" value="<%=ectid%>" placeholder=""  autocomplete="off">
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Category Name</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="name" class="form-control" id="lname" value="<%=ename%>" placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="desc" class="form-control" id="desc" value="<%=edesc%>" placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Image</label>
                                    <div class="col-sm-9">
                                        <input type="file"  name="txtfile" class="form-control" id="lname" value="<%=eimage%>" placeholder="" required="" autocomplete="off">
                                    </div>
                                </div>

                            </div>
                            <div class="border-top">
                                <div class="card-body" align="center">
                                    <button type="reset" class="btn btn-danger" style='margin-right:16px'>Reset</button> &nbsp; 
                                    <button type="submit" name="submit" class="btn btn-primary" >Submit</button> 
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title m-b-0">List Category types </h5>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox m-b-20">
                                                        <input type="checkbox" id="mainCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <th scope="col">No</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Action</th>
                                                    <%
                                                        int a = 0;
                                                        String sel = "select * from tbl_category";
                                                        ResultSet rs = con.select(sel);
                                                        while (rs.next()) {
                                                            ++a;
                                                    %>

                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td><%=+a%></td>
                                                <td><%=rs.getString("ct_name")%></td>
                                                <td><%=rs.getString("ct_desc")%></td>
                                                <td><%=rs.getString("ct_image")%></td>


                                                <td><a href="category.jsp?del=<%=rs.getString("ct_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                        <i class="fas fa-trash-alt"></i></a>
                                                    <a href="category.jsp?eid=<%=rs.getString("ct_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
                                                        <i class=" fas fa-pencil-alt"></i></a></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>