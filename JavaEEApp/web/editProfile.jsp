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

<div class="container" style="margin-left: 200px">
    <h5 class="mt-3 fw-bold" style="color: #61b4b6; margin-left: 400px">EDIT PROFILE</h5>
    <div class="row mt-4">
        <label for="fn" class="col-sm-2 mt-2 col-form-label">EMAIL : </label>
            <div class="col-7">
                <input type="text" id="fn" name="full_name" class="form-control mt-2"
                       readonly value="<%=user.getFull_name()%>">
            </div>
    </div>
    <div class="row mt-4">
        <label for="ps" class="col-sm-2 mt-2 col-form-label">PASSWORD:</label>
            <div class="col-7">
                <input type="text" id="ps" name="password"  class="form-control mt-2"
                       readonly value="<%=user.getPassword()%>">
            </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <div>
                <button type="button" class="btn btn-sm" style="background-color: #61b4b6; margin-left: 400px"
                        data-bs-toggle="modal" data-bs-target="#editNews">
                    EDIT
                </button>
                <div class="modal fade" id="editNews" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <form action="/edit-profile" method="post">
                                <input type="hidden" name="id" value="<%=user.getEmail()%>">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit News</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <label>
                                                FULL NAME:
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <input type="text" class="form-control" name="full_name"
                                                   value="<%=user.getFull_name()%>">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>
                                                OLD PASSWORD:
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <input type="password" class="form-control" name="old_password">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>
                                                PASSWORD:
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <input type="password" class="form-control" name="new_password" >
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>