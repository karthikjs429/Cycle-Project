<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String edate = "", edistance = "", ectid = "", ecalories = "", ec1id = "";
    if (request.getParameter("submit") != null) {

        String date = request.getParameter("date");
        String distance = request.getParameter("distance");
        String ct_id = request.getParameter("ct_id");
        String calories = request.getParameter("calories");
        if (request.getParameter("txtbid").equals("")) {
            String sel = "select * from tbl_challange1 where c1_date='" + date + "' and c1_distance='" + distance + "' and c1_calories='" + calories + "'";
            ResultSet rs = con.select(sel);
            if (rs.next()) {
%>
<script>alert('Item already Exist')</script>
<%
} else {
    String ins = "insert into tbl_challange1 (c1_date,c1_distance,ct_id,c1_calories) values('" + date + "','" + distance + "','" + ct_id + "','" + calories + "')";

    boolean b = con.insert(ins);
    if (b) {
%>
<script>alert('inserted')</script>
<%
} else {
%>
<script>alert('could not insert')</script>
<%
        }
    }
} else {
    String upt = "update  tbl_challange1 set c1_date='" + date + "',c1_distance='" + distance + "',ct_id='"+ct_id+"',c1_calories='" + calories + "' where c1_id='" + request.getParameter("txtbid") + "'";
    boolean d = con.insert(upt);
    if (d) {
%>
<script>alert('item updated');window.location.href='challange1.jsp';</script>
<%
} else {
%>
<script>alert('item not updated');</script>
<%
            }
        }
    }
    if (request.getParameter("del") != null) {

        String del = "delete from tbl_challange1 where c1_id='" + request.getParameter("del") + "'";
        boolean c = con.insert(del);
        if (c) {
%>
<script>alert('Deleted')</script>
<%
        }
    }
    if (request.getParameter("editid") != null) {
        String sel = "select * from tbl_challange1 where c1_id='" + request.getParameter("editid") + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
            edate = rs.getString("c1_date");
            edistance = rs.getString("c1_distance");
            ec1id = rs.getString("c1_id");
            ectid = rs.getString("ct_id");
            ecalories = rs.getString("c1_calories");
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
                            <h4 class="card-title">Challenges 1</h4>
                            <input type="hidden"  name="txtbid" class="form-control" id="txtbid" value="<%=ec1id%>" placeholder="type here" required="" autocomplete="off">
                            <div class="form-group row">
                                <label for="fname" class="col-sm-2 text-right control-label col-form-label">Date</label>
                                <div class="col-sm-4">
                                    <input type="Date" class="form-control" id="fname" name="date" value="<%=edate%>" placeholder="Place Name Here" required="">
                                </div>

                            </div>


                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Distance</label>
                                <div class="col-sm-9">
                                    <input type="number" min="2" max="100"  name="distance" value="<%=edistance%>"  class="form-control" id="lname" placeholder="in KM" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Callange type</label>
                                <div class="col-md-9">
                                    <select class="select2 form-control custom-select" name="ct_id" style="width: 100%; height:36px;">
                                        <option>Select</option>
                                        <%
                                            String sel3 = "select* from tbl_challangetype";
                                            ResultSet rs3 = con.select(sel3);
                                            while (rs3.next()) {
                                        %>
                                        <option value="<%=rs3.getString("ct_id")%>" <%if(ectid.equals(rs3.getString("ct_id"))){ %> selected="" <% }%>><%=rs3.getString("ct_type")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Calories can be burned</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control"  id="lname" name="calories" value="<%=ecalories%>" placeholder="calories Here" required="">
                                </div>
                            </div>


                            <div class="card-body">

                                <button type="reset" class="btn btn-danger" style='margin-right:16px'>Reset</button> &nbsp; 
                                <button type="submit" name="submit" class="btn btn-primary">Submit</button> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title m-b-0">List of challange 1  </h5>
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
                                        <th scope="col">Date</th>
                                        <th scope="col">Distance</th>
                                        <th scope="col">Type</th>
                                        <th scope="col">Calories</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="customtable">
                                    <%
                                        int a = 0;
                                        String se2 = "select * from tbl_challange1 d inner join tbl_challangetype c on d.ct_id=c.ct_id ";
                                        ResultSet rs2 = con.select(se2);
                                        while (rs2.next()) {
                                            ++a;
                                    %>
                                    <tr>
                                        <th>
                                            <label class="customcheckbox">
                                                <input type="checkbox" class="listCheckbox" />
                                                <span class="checkmark"></span>
                                            </label>
                                        </th>
                                        <td><%=+a%></td>
                                        <td><%=rs2.getString("c1_date")%></td>
                                        <td><%=rs2.getString("c1_distance")%> &nbsp; km</td>
                                        <td><%=rs2.getString("ct_type")%></td>
                                        <td><%=rs2.getString("c1_calories")%> &nbsp; kacl</td>


                                        <td><a href="challange1.jsp?del=<%=rs2.getString("c1_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                <i class="fas fa-trash-alt"></i></a>
                                            <a href="challange1.jsp?editid=<%=rs2.getString("c1_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
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
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->

<%@include file="includes/footer.jsp" %>