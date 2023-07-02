<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp" %>
    <title>Title</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp" %>
</div>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">
            <h4 class="mb-3 text-center">
                REGISTER TO SYSTEM
            </h4>
            <%
                String success = request.getParameter("success");
                if (success != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                You are successfully registered
                <button type="button" class="btn btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <%
                }
            %>
            <%
                String password_error = request.getParameter("password_error");
                if (password_error != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Passwords are not same
                <button type="button" class="btn btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <%
                }
            %>
            <%
                String email_error = request.getParameter("email_error");
                if (email_error != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                User exists
                <button type="button" class="btn btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <%
                }
            %>
            <form action="/register" method="post" style="margin-left: 250px">
                <div class="row mt-3">
                    <label for="email" class="col-sm-2 col-form-label">EMAIL : </label>
                    <div class="col-6">
                        <input type="email" id="email" class="form-control mt-2" name="email" required placeholder="Write email">
                    </div>
                </div>
                <div class="row mt-5">
                    <label for="password" class="col-sm-2 col-form-label">Password : </label>
                    <div class="col-6">
                       <input type="password" id="password" class="form-control mt-2" name="password" required
                               placeholder="Write password">
                    </div>
                </div>
                <div class="row mt-5">
                    <label for="re_pass" class="col-sm-2 col-form-label">REPEAT PASSWORD</label>
                    <div class="col-6">
                        <input type="password" id="re_pass" class="form-control" name="re_password" required
                               placeholder="Repeat the password">
                    </div>
                </div>
                <div class="row mt-5">
                    <label for="full_name" class="col-sm-2 col-form-label">FULL NAME : </label>
                    <div class="col-6">
                        <input type="text" id="full_name" class="form-control mt-2" name="full_name" required placeholder="Write full name">
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-6">
                        <button class="btn btn-success" style="margin-left: 280px; background-color: #61b4b6">REGISTER</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>