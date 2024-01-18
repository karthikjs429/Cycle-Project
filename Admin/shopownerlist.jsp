<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String eid="";
    if (request.getParameter("deactive") != null) {
        String upt = "update tbl_shopowner set so_status='deactive' where so_id='" + request.getParameter("deactive") + "'";
        boolean u = con.insert(upt);
        if (u) {
%>
<script>alert('Restricted');window.location.href = 'shopownerlist.jsp';</script>
<%
        }
}
else if(request.getParameter("active")!= null){
  String upt2 = "update tbl_shopowner set so_status='active' where so_id='" + request.getParameter("active") + "'";
        boolean u2 = con.insert(upt2);
        if (u2) {
%>
<script>alert('Activated');window.location.href = 'shopownerlist.jsp';</script>
<%
        }
}
    

%>
<div id="main-wrapper">
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Tables</h4>
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
                <div class="col-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title m-b-0">Static Table With Checkboxes</h5>
                        </div>
                        <input type="hidden"  name="eid" class="form-control" id="pid" value="<%=eid%>" placeholder=""  autocomplete="off">
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
                                        <th scope="col">Shop Owner Name</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Phone Number</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <%                                    int a = 0;
                                    String sel = "select * from tbl_shopowner";
                                    ResultSet rs = con.select(sel);
                                    while (rs.next()) {
                                        ++a;
                                %>

                                <tbody class="customtable">
                                    <tr>
                                        <th>
                                            <label class="customcheckbox">
                                                <input type="checkbox" class="listCheckbox" />
                                                <span class="checkmark"></span>
                                            </label>
                                        </th>
                                        <td><%=rs.getString("so_name")%></td>
                                        <td><%=rs.getString("so_address")%></td>
                                        <td><%=rs.getString("so_phone")%></td>
                                        <td><%=rs.getString("so_status")%></td>
                                        <td>
                                            <a href="shopownerlist.jsp?deactive=<%=rs.getString("so_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Restrict User">
                                                <i class="fas fa-ban"></i></a>
                                            <a href="shopownerlist.jsp?active=<%=rs.getString("so_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Activate User">
                                                <i class="fas fa-undo-alt"></i></a></td>
                                    </tr>                                  
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>