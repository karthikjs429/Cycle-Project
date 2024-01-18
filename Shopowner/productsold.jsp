
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>

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

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title m-b-0">List of products Bought</h5>
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
                                                    <th scope="col">Name of product</th>
                                                    <th scope="col">Total Amount</th>
                                                    <th scope="col">Unit Price</th>
                                                    <th scope="col">User name</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Action</th>
                                                    <%
                                                        int a = 0;
                                                        String sel = "select * from tbl_order_details od inner join tbl_orderhead oh on od.od_id=oh.od_id inner join tbl_user_reg ur on oh.user_id=ur.user_id inner join tbl_product p on od.pd_id=p.pd_id where so_id='"+session.getAttribute("ownerid")+"' ";
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
                                                <td><%=rs.getString("od_headtotal")%></td>
                                                <td><%=rs.getString("odt_unit_price")%></td>
                                                <td><%=rs.getString("user_name")%></td>
                                                <td><%=rs.getString("odt_quantity")%></td>


                                                <td><a href="productsold.jsp?del=<%=rs.getString("ct_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Delete">
                                                        <i class="fas fa-trash-alt"></i></a>
                                                        <a href="productsold.jsp?eid=<%=rs.getString("pd_id")%>" class="col-sm-6 col-md-4 col-lg-3 f-icon" data-toggle="tooltip" data-placement="top" title data-original-title="Edit">
                                                        <i class=" fas fa-pencil-alt"></i></a></td>
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
    </div>
</div>
<%@include file="includes/footer.jsp" %>