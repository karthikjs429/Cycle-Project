<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("submit") != null) {
        String distance = request.getParameter("distance");
        String calories = request.getParameter("calories");
        String sel = "select * from tbl_caloriedata where cl_distance='" + distance + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
%>
<script>alert('items already exist');</script>
<%    
} else {
    String ins = "insert into tbl_caloriedata(cl_distance,cl_calories) values ('" + distance + "','" + calories + "')";
    boolean b = con.insert(ins);
    if (b) {
%>
<script>alert('item Inserted');</script>
<%    
} else {
%>
<script>alert('items cannot be inserted');</script>
<%                
            }
        }
    }
    if (request.getParameter("del") != null) {
        String del = "delete from tbl_caloriedata where cl_id='" + request.getParameter("del") + "'";
boolean b=con.insert(del);
if(b){
%>
<script>alert('items deleted');</script>
<% 
}
    }
%>





<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Calories Data</h4>
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
                    <form class="form-horizontal" method="POST">
                        <div class="card-body">
                            <h4 class="card-title">Calories Data</h4>



                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Distance</label>
                                <div class="col-sm-9">
                                    <input type="number" min="2" max="100" class="form-control" name="distance" id="lname" placeholder="in KM" required="">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Calories can be burned</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="lname" name="calories" placeholder="in kacl" required="">
                                </div>
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">
                                <button type="reset" class="btn btn-danger" name="reset" style='margin-right:16px'>Reset</button> &nbsp;
                                <button type="submit" class="btn btn-primary" name="submit">Submit</button> 
                            </div>
                        </div>
                    </form>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title m-b-0">Calorie data  list </h5>
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
                                                <th scope="col">Distance</th>
                                                <th scope="col">Calories</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <%                                                
                                                int a = 0;
                                                String se3 = "select * from tbl_caloriedata";
                                                ResultSet rs3 = con.select(se3);
                                                while (rs3.next()) {
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
                                                <td><%=rs3.getString("cl_distance")%> &nbsp;Km</td>
                                                <td><%=rs3.getString("cl_calories")%> &nbsp; kacl</td>


                                                <td><a href="caloriesdata.jsp?del=<%=rs3.getString("cl_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
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
                </div>
            </div>

        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>