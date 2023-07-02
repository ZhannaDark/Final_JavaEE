<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.javaee.project.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title>Start</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
</div>
<div class="container">
    <div class="row mt-3">
        <div class="col-12">
            <%
                News news = (News) (request.getAttribute("news"));
                if (news != null){

            %>
            <div class="p-5 mb-3 text-light rounded-5" style="background-color: #81aeaf">
                <h3 class="fst-italic"><%=news.getTitle()%></h3>
                <p><%=news.getContent()%></p>
                <p>
                    Posted by <strong><%=news.getUser().getFull_name()%></strong>
                    At <strong><%=news.getPostDate()%></strong>
                </p>
                <%
                    if (user != null && user.getId().equals(news.getUser().getId()))  {
                %>
                <div>
                    <button type="button" class="btn btn-primary btn-sm rounded-2" data-bs-toggle="modal"
                            data-bs-target="#editNews">
                        EDIT
                    </button>
                    <div class="modal fade" id="editNews" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <form action="/save-news" method="post">
                                    <input type="hidden" name="id" value="<%=news.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit News</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <label>
                                                    TITLE:
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="title"
                                                       required value="<%=news.getTitle()%>">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>
                                                    CONTENT:
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                    <textarea class="form-control" name="content"
                                                              placeholder="Write a content:"
                                                              required rows="10"><%=news.getContent()%></textarea>
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
                    <button type="button" class="btn btn-danger btn-sm rounded-1" data-bs-toggle="modal"
                            data-bs-target="#deleteNews">
                        DELETE
                    </button>
                    <div class="modal fade" id="deleteNews" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete-news" method="post">
                                    <div class="modal-header">
                                        <input type="hidden" name="id" value="<%=news.getId()%>">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel1">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h2> Are you sure?</h2>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn btn-danger">Yes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                if (user != null ){
            %>
            <div>
                <form action="/add-comments" method="post">
                    <input type="hidden" name="news_id" value="<%=news.getId()%>">
                    <div class="row rounded-4">
                        <div class="col-12">
                            <textarea name="comment"  class="form-control rounded-4"></textarea>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <button class="btn btn-success btn-sm">ADD COMMENT</button>
                        </div>
                    </div>
                </form>
            </div>
            <%
                }
            %>
            <div class="row">
                <div class="col-12">
                    <%
                        ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
                        if (comments != null){
                            for (Comment comment : comments){
                    %>
                    <div class="list-group rounded-4">
                        <a href="JavaScript:void(0)" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1 fst-italic"><%=comment.getUser().getFull_name()%></h5>
                                <small class="text-body-secondary"><%=comment.getTimestamp()%></small>
                            </div>
                            <p class="mb-1"><%=comment.getComment()%></p>
                        </a>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>