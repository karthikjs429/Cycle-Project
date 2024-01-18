
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("submit") != null) {
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String sel = "select * from tbl_challangetype where ct_type='" + type + "' and ct_description='" + description + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
%>
<script>alert('items already exist');</script>
<%
} else {
    String ins = "insert into tbl_challangetype (ct_type,ct_description) values('" + type + "','" + description + "')";
    boolean a = con.insert(ins);
    if (a) {
%>
<script>alert('item added');</script>
<%
} else {
%>
<script>alert('item cannot add');</script>
<%
            }
        }
    }
%>


<div id="main-wrapper">

    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
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
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <form class="form-horizontal" method="POST">
                            <div class="card-body">
                                <h4 class="card-title">Challange type</h4>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Cycling type</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="type" class="form-control" id="lname" placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="description" class="form-control" id="lname" placeholder="description here" required="" autocomplete="off">
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
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title m-b-0">List Challange types </h5>
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
                                                <th scope="col">Type</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Action</th>
    <%
                                                  String sel="select* from tbl_challangetype";
                                                  ResultSet rs=con.select(sel);
                                                  while(rs.next())
                                                  {
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
                                                <td><%=rs.getString("ct_id")%></td>
                                                <td><%=rs.getString("ct_type")%></td>
                                                <td><%=rs.getString("ct_description")%></td>
                                          
                                                <td><a class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                        <i class="fas fa-trash-alt"></i></a>
                                                    <a class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
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
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->

<%@include file="includes/footer.jsp" %>