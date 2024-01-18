
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("submit") != null) {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if (password.equals(cpassword)) {
            String sel = "select * from tbl_login where login_email='" + email + "'";
            ResultSet rs = con.select(sel);
            if (rs.next()) {
%>
<script>alert('This user already Exist');</script>
<%
} else {
    String ins = "insert into tbl_login (login_email,login_password,login_role,login_status) values('" + email + "','" + password + "','admin','active')";
    boolean r = con.insert(ins);
    if (r) {
        String seld = "select * from tbl_login order by login_id desc limit 1";
        ResultSet rsd = con.select(seld);
        if (rsd.next()) {
            String adminid = rsd.getString("login_id");
            String insr = "insert into tbl_admin (ad_fname,ad_lname,ad_dob,ad_phone,ad_address,login_id) values('" + fname + "','" + lname + "','" + dob + "','" + phone + "','" + address + "','" + adminid + "')";
            boolean i = con.insert(insr);
            if (i) {
%>
<script>alert('Registered Successfully')</script>
<%
                }
            }
        }
    }
    //response.sendRedirect("../admin/login.jsp");
} else {
%>
<script>alert('Confirm password is incorrect')</script>
<%
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
                    <form class="form-horizontal" method="post">
                        <div class="card-body">
                            <h4 class="card-title">Add admin here</h4>
                            <div class="form-group row">
                                <label for="fname" class="col-sm-2 text-right control-label col-form-label">First Name</label>
                                <div class="col-sm-4">
                                    <input type="text" name="fname" class="form-control" id="fname" placeholder="First Name Here" required="">
                                </div>
                                <label for="lname" class="col-sm-1 text-right control-label col-form-label">Last Name</label>
                                <div class="col-sm-4">
                                    <input type="text" name="lname" class="form-control" id="lname" placeholder="Last Name Here" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">E-mail</label>
                                <div class="col-sm-9">
                                    <input type="email" name="email" class="form-control" id="lname" placeholder="E-mail" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Password</label>
                                <div class="col-sm-9">
                                    <input type="password" name="password" class="form-control" id="lname" placeholder="Password Here" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Confirm Password</label>
                                <div class="col-sm-9">
                                    <input type="password" name="cpassword" class="form-control" id="lname" placeholder="Confirm Password Here" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email1" class="col-sm-2 text-right control-label col-form-label">date of birth</label>
                                <div class="col-sm-9">
                                    <input type="date" name="dob" class="form-control" id="email1" placeholder="Company Name Here">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cono1" class="col-sm-2 text-right control-label col-form-label">Contact No</label>
                                <div class="col-sm-9">
                                    <input type="number" name="phone" class="form-control" id="cono1" placeholder="+91 999 999 9999" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cono1" class="col-sm-2 text-right control-label col-form-label">Address</label>
                                <div class="col-sm-9">
                                    <input type="text" name="address" class="form-control" id="cono1"  required="">
                                </div>
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">
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
                            <h5 class="card-title m-b-0">Lists of Admin </h5>
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
                                        <th scope="col">DoB</th>
                                        <th scope="col" >Address </th>
                                        <th scope="col">Contact</th>
                                        <th scope="col">E-mail</th>
                                        <th scope="col">Operation</th>
                                            <%
                                                int a = 0;
                                                String select = "select * from tbl_admin d inner join tbl_login c on d.login_id=c.login_id ";
                                                ResultSet s = con.select(select);
                                                while (s.next()) {
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
                                        <td><%=s.getString("ad_fname")%>&nbsp;<%=s.getString("ad_lname")%></td>
                                        <td><%=s.getString("ad_dob")%></td>
                                        <td><%=s.getString("ad_address")%> </td>
                                        <td><%=s.getString("ad_phone")%></td>
                                        <td><%=s.getString("login_email")%></td>

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
        </div>
    </div>
</div>
                                

    <%@include file="includes/footer.jsp" %>