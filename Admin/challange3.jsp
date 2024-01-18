<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%@include file="includes/header.jsp" %>
<%    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String weight = request.getParameter("weight");
        String weightsub = request.getParameter("weightsub");
        String age = request.getParameter("age");
        String agesub = request.getParameter("agesub");
        String distance = request.getParameter("distance");
        String time = request.getParameter("time");
        String heartrate = request.getParameter("heartrate");
        String sel = "select * from tbl_challange3 where c_name='" + name + "' and c_date='" + date + "' and c_weight='" + weight + "'";
        ResultSet s = con.select(sel);
        if (s.next()) {
%>
<script>alert('item already exist');</script>
<%
} else {
    String ins = "insert into tbl_challange3(c_name,c_date,c_weight,c_weight_sub,c_age,c_age_sub,c_distance,c_time,c_heartrate) values('" + name + "','" + date + "','" + weight + "','" + weightsub + "','" + age + ",'" + agesub + ",'" + distance + "','" + time + "','" + heartrate + "')";
    boolean b = con.insert(ins);
    if (b) {
%>
<script>alert('item inserted');</script>
<%
} else {
%>
<script>alert('item not inserted');</script>
<%
            }
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
                    <form class="form-horizontal" method="POST">
                        <div class="card-body">
                            <h4 class="card-title">Challenges </h4>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Challange name</label>
                                <div class="col-sm-9">
                                    <input type="text"  name="name" class="form-control" id="lname" placeholder="Name" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="lname" name="date" placeholder="date " required="">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Weight</label>
                                <div class="col-sm-4">
                                    <input type="number" min="2" max="100" name="weight" class="form-control" id="lname" placeholder="in Kg" required="">
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check form-check-inline col-sm-4">
                                        <input class="form-check-input" type="radio" name="weightsub" id="inlineRadio3" value="lessweight">
                                        <label class="form-check-label" for="inlineRadio3">Less</label>
                                    </div>

                                    <div class="form-check form-check-inline col-sm-4">
                                        <input class="form-check-input" type="radio" name="weightsub" id="inlineRadio3" value="moreweight">
                                        <label class="form-check-label" for="inlineRadio3">Greater</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Age</label>
                                <div class="col-sm-4">
                                    <input type="number" min="18" max="100" name="age" class="form-control" id="lname" placeholder="in yrs" required="">
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check form-check-inline col-sm-4">
                                        <input class="form-check-input" type="radio" name="agesub" id="inlineRadio3" value="lessage">
                                        <label class="form-check-label" for="inlineRadio3">Less</label>
                                    </div>

                                    <div class="form-check form-check-inline col-sm-4">
                                        <input class="form-check-input" type="radio" name="agesub" id="inlineRadio3" value="moreage">
                                        <label class="form-check-label" for="inlineRadio3">Greater</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Distance</label>
                                <div class="col-sm-9">
                                    <input type="number" min="2" max="100" name="distance" class="form-control" id="lname" placeholder="in KM" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Time</label>
                                <div class="col-sm-9">
                                    <input type="time"  name="time" class="form-control" id="lname" placeholder="in Min" required="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lname" class="col-sm-2 text-right control-label col-form-label">Herat rate</label>
                                <div class="col-sm-9">
                                    <input type="number" min="50" max="200" name="heartrate" class="form-control" id="lname" placeholder="in bpm" required="">
                                </div>
                            </div>



                        </div>
                        <div class="border-top">
                            <div class="card-body">
                                <button type="reset" class="btn btn-danger" style='margin-right:16px'>Reset</button> &nbsp; 
                                <button type="submit" class="btn btn-primary" name="submit">Submit</button> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>