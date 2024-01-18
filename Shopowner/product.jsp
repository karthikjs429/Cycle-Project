
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String ename = "", ebrand = "", eimage = "", eprice = "", ectid = "", epdid = "", edesc = "";
    if (request.getParameter("submit") != null) {
        String ct_id = request.getParameter("ct_id");
        String pname = request.getParameter("pname");
        String bname = request.getParameter("bname");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String desc = request.getParameter("desc");

    }
    if (request.getParameter("del") != null) {

        String del = "delete from tbl_product where pd_id='" + request.getParameter("del") + "'";
        boolean c = con.insert(del);
        if (c) {
%>
<script>alert('Deleted')</script>
<%
        }
    }
    if (request.getParameter("eid") != null) {
        String sel = "select * from tbl_product where pd_id='" + request.getParameter("eid") + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
            epdid = rs.getString("pd_id");
            ectid = rs.getString("ct_id");
            ename = rs.getString("pd_name");
            ebrand = rs.getString("pd_brand");
            eimage = rs.getString("pd_image");
            eprice = rs.getString("pd_price");
            edesc = rs.getString("pd_desc");

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
                        <form action="product_upload.jsp" enctype="multipart/form-data" class="form-horizontal" method="POST">
                            <div class="card-body">
                                <h4 class="card-title">Products</h4>

                                <input type="hidden"  name="pid" class="form-control" id="pid" value="<%=epdid%>" placeholder="" required="" autocomplete="off">
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Category type</label>
                                    <div class="col-md-9">
                                        <select class="select2 form-control custom-select" name="ct_id" style="width: 100%; height:36px;">
                                            <option>Select</option>
                                            <%
                                                String sel3 = "select * from tbl_category";
                                                ResultSet rs3 = con.select(sel3);
                                                while (rs3.next()) {
                                            %>
                                            <option value="<%=rs3.getString("ct_id")%>" <%if (ectid.equals(rs3.getString("ct_id"))) { %> selected="" <% }%>><%=rs3.getString("ct_name")%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Product name</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="pname" class="form-control" id="lname" value="<%=ename%>" placeholder="Product name" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Brand name</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="bname" class="form-control" id="lname" value="<%=ebrand%>" placeholder="Brand name here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Product image</label>
                                    <div class="col-sm-9">
                                        <input type="file"  name="txtfile" class="form-control" id="lname" value="<%=eimage%>" placeholder=""  autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Product Price</label>
                                    <div class="col-sm-9">
                                        <input type="number"  name="price" class="form-control" id="lname" value="<%=eprice%>" placeholder="in RS" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Product Details</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="desc" class="form-control" id="lname" value="<%=edesc%>" placeholder="type here" required="" autocomplete="off">
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
                                    <h5 class="card-title m-b-0">List of products </h5>
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
                                                <th scope="col">Brand</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Action</th>
                                                    <%
                                                        int a = 0;
                                                        String sel = "select * from tbl_product d inner join tbl_category a on d.ct_id=a.ct_id where so_id='" + session.getAttribute("ownerid").toString() + "'";
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
                                                <td><%=rs.getString("pd_name")%></td>
                                                <td><%=rs.getString("pd_brand")%></td>
                                                <td><%=rs.getString("pd_price")%></td>
                                                <td><%=rs.getString("ct_name")%></td>

                                                <td><a href="product.jsp?del=<%=rs.getString("pd_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                        <i class="fas fa-trash-alt"></i></a>
                                                    <a href="product.jsp?eid=<%=rs.getString("pd_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
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

<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->

<%@include file="includes/footer.jsp" %>