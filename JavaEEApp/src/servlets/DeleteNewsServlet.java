package servlets;

import com.example.javaee.project.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete-news")
public class DeleteNewsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        User user = (User) (request.getSession().getAttribute("currentUser"));

        if (user != null){
            Long id = Long.parseLong(request.getParameter("id"));
            News news = DBManager.getNewsByID(id);

            if (news != null){
                DBManager.deleteNews(news.getId());
            }
            response.sendRedirect("/home");

        } else {
            response.sendRedirect("/login");
        }
    }
}