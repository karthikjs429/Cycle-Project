<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String etype = "", edesc = "", ebid = "";
    if (request.getParameter("submit") != null) {
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        if (request.getParameter("txtbid").equals("")) {
            String sel = "select * from tbl_bodytype where b_type='" + type + "'";
            ResultSet rs = con.select(sel);
            if (rs.next()) {
%>
<script>alert('item already exist');</script>
<%
} else {
    String ins = "insert into  tbl_bodytype (b_type,b_description) values('" + type + "','" + description + "')";
    boolean d = con.insert(ins);
    if (d) {
%>
<script>alert('item inserted');</script>
<%
} else {
%>
<script>alert('item not inserted');</script>
<%
        }
    }
} else {
    String ins = "update  tbl_bodytype set b_type='" + type + "',b_description='" + description + "' where b_id='"+request.getParameter("txtbid")+"'";
    boolean d = con.insert(ins);
    if (d) {
%>
<script>alert('item updated');</script>
<%
} else {
%>
<script>alert('item not updated');</script>
<%
            }
        }

    }
    if (request.getParameter("del") != null) {
        String del = "delete from tbl_bodytype where b_id='" + request.getParameter("del") + "'";
        boolean d = con.insert(del);
        if (d) {
%>
<script>alert('item  deleted');</script>
<%
        }
    }

    if (request.getParameter("editid") != null) {
        String sel = "select * from tbl_bodytype where b_id='" + request.getParameter("editid") + "'";
        ResultSet rs = con.select(sel);
        if (rs.next()) {
            etype = rs.getString("b_type");
            edesc = rs.getString("b_description");
            ebid = rs.getString("b_id");
        }
    }
%>


<div id="main-wrapper">
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Form </h4>
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
                                <h4 class="card-title">Body type</h4>
                                <input type="hidden"  name="txtbid" class="form-control" id="txtbid" value="<%=ebid%>" placeholder="type here" required="" autocomplete="off">
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Body type</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="type" class="form-control" id="lname" value="<%=etype%>" placeholder="type here" required="" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-2 text-right control-label col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text"  name="description" class="form-control" id="lname" value="<%=edesc%>" placeholder="description here" required="" autocomplete="off">
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
                                    <h5 class="card-title m-b-0">List Body types </h5>
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
                                            </tr>
                                        </thead>                                                                     

                                        <tbody class="customtable">
                                            <%
                                                int a = 0;
                                                String sel = "select * from tbl_bodytype";
                                                ResultSet rs = con.select(sel);
                                                while (rs.next()) {
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
                                                <td><%=rs.getString("b_type")%></td>
                                                <td><%=rs.getString("b_description")%></td>

                                                <td><a href="bodytype.jsp?del=<%=rs.getString("b_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                        <i class="fas fa-trash-alt"></i></a>
                                                    <a href="bodytype.jsp?editid=<%=rs.getString("b_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
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