<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("register") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String age = request.getParameter("age");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        
        if (password.equals(cpassword)) {
            String sel = "select * from tbl_login where login_email='" + email + "'";
            ResultSet rs = con.select(sel);
            if (rs.next()) {
%>
<script>alert('This user already Exist');</script>
<%
    } else {
        String ins = "insert into tbl_login (login_email,login_password,login_role,login_status) values('" + email + "','" + password + "','user','active')";
        boolean r = con.insert(ins);
        if (r) {
            String seld = "select * from tbl_login order by login_id desc limit 1";
            ResultSet rsd = con.select(seld);
            if (rsd.next()) {
                String loginid = rsd.getString("login_id");
                String insr = "insert into tbl_user_reg (user_name,user_phone,user_age,user_height,user_weight,login_id) values('" + name + "','" + phone + "','" + age + "','" + height + "','" + weight + "','" + loginid + "')";
                boolean i = con.insert(insr);
                if (i) {
                    response.sendRedirect("login.jsp");
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


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Here</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="logreg/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="logreg/css/style.css">
    </head>
    <body>

        <div class="main">

            <div class="container">
                <div class="booking-content">
                    <div class="booking-image">
                        <img class="booking-img" src="logreg/images/register.jpg" alt="Booking Image">
                    </div>
                    <div class="booking-form">
                        <form method="POST">
                            <h2>REGISTER HERE</h2>
                            <div class="form-group form-input">
                                <input type="text" name="name" id="name" value="" required autocomplete="off"/>
                                <label for="name" class="form-label">Your name</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="email" name="email" id="phone" value="" required autocomplete="off"/>
                                <label for="email" class="form-label">E-mail</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="number" name="phone" id="phone" value="" required autocomplete="off"/>
                                <label for="" class="form-label">Your phone number</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="number" name="age" id="phone" value="" required autocomplete="off"/>
                                <label for="" class="form-label">Age</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="number" name="height" id="phone" value="" required autocomplete="off"/>
                                <label for="" class="form-label">Height</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="number" name="weight" id="phone" value="" required autocomplete="off"/>
                                <label for="" class="form-label">Weight</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="password" name="password" id="phone" value="" required autocomplete="off" />
                                <label for="" class="form-label">Password</label>
                            </div>
                            <div class="form-group form-input">
                                <input type="password" name="cpassword" id="phone" value="" required autocomplete="off"/>
                                <label for="" class="form-label">confirm password</label>
                            </div>

               
                            <div class="form-submit">
                                <input type="submit" value="Register" class="submit" id="submit" name="register" />
                                <a href="login.jsp" class="vertify-booking">Already have an account,  Login here </a>
                                <br>
<!--                                <a href="feed.jsp" class="vertify-booking">Home</a>-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- JS -->
        <script src="logreg/vendor/jquery/jquery.min.js"></script>
        <script src="logreg/js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>