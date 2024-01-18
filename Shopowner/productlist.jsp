
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
      if (request.getParameter("del") != null) {

        String del = "delete from tbl_product where pd_id='" + request.getParameter("del") + "'";
        boolean c = con.insert(del);
        if (c) {
%>
<script>alert('Deleted')</script>
<%
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

            <div class="container my-5 py-3 z-depth-1 rounded">
                <section class="dark-grey-text">
                    <div class="table-responsive">

                        <table class="table product-table mb-0">
                            <thead class="mdb-color lighten-5">
                                <tr>
                                    
                                    <th class="font-weight-bold">
                                        <strong>Product image</strong>
                                    </th>
                                    <th class="font-weight-bold">
                                        <strong>Name</strong>
                                    </th>
                                    <th class="font-weight-bold">
                                        <strong>Brand</strong>
                                    </th>
                                 
                                    <th class="font-weight-bold">
                                        <strong>Price</strong>
                                    </th>
                                    <th class="font-weight-bold">
                                        <strong>Description</strong>
                                    </th>
                                    <th></th>
                                </tr>
                            <%
                                int a = 0;
                                String sel = "select * from tbl_product d inner join tbl_category a on d.ct_id=a.ct_id ";
                                
                                ResultSet rs = con.select(sel);
                                while (rs.next()) {
                                    ++a;
                            %>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <img src="../shopowner/products/<%=rs.getString("pd_image")%>" height="200px" width="250px" alt="" class="img-fluid z-depth-0">
                                </th>
                                <td>
                                    <h5 class="mt-3">
                                        <strong><%=rs.getString("pd_name")%></strong>
                                    </h5>
                                
                                </td>
                              
                                <td><%=rs.getString("pd_brand")%></td>
                                <td><%=rs.getString("pd_price")%>/-</td>
                                <td><%=rs.getString("pd_desc")%></td>
                                <td>
                                      <a href="productlist.jsp?del=<%=rs.getString("pd_id")%>" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top"
                                            title="Remove item">X <i class="icon-arrow-right3"></i></a>
                                    
                                </td>
                            </tr>

                        </tbody>
                        <%
                            }
                        %>
                    </table>
                </div>
            </section>


        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>