<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title>Title</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
</div>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">
            <h4 class="mb-3 text-center">
                LOGIN TO SYSTEM
            </h4>
            <%
                String passError = request.getParameter("password_error");

                if (passError != null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect password
                <button type="button" class="btn btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <%
                }
            %>
            <%
                String email = request.getParameter("email_error");

                if (email != null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect email
                <button type="button" class="btn btn-close"  data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <%
                }
            %>
            <form action="/login" method="post" style="margin-left: 200px">
                <div class="row mt-3">
                    <label for="email" class="col-sm-2 mt-2 col-form-label">EMAIL : </label>
                    <div class="col-7">
                        <input type="email" id="email" class="form-control mt-3" name="email" required placeholder="Write email">
                    </div>
                </div>
                <div class="row mt-4">
                    <label for="password" class="col-sm-2 mt-2 col-form-label">PASSWORD : </label>
                    <div class="col-7">
                        <input type="password" id="password" class="form-control mt-3" name="password" required placeholder="Write password">
                    </div>
                </div>
                <div class="row mt-5">
                    <label>
                        <button class="btn" style="margin-left: 350px; background-color: #61b4b6">LOGIN</button>
                    </label>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>