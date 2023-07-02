<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.javaee.project.News" %>
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
                ArrayList<News> news = (ArrayList<News>)request.getAttribute("news");
                if (news != null){
                    for (News n : news){
            %>
            <div class="p-5 mb-3 rounded-5" style="background-color: #81aeaf">
                <a class="text-decoration-none" href="/new_details?id=<%=n.getId()%>"><h3 class="fst-italic"><%=n.getTitle()%></h3></a>
                <p class="text-light"><%=n.getContent()%></p>
                <p class="text-light">
                    Posted by <strong><%=n.getUser().getFull_name()%></strong>
                    At <strong><%=n.getPostDate()%></strong>
                </p>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>