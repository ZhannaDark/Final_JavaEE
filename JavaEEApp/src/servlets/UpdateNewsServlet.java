package servlets;

import com.example.javaee.project.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/save-news")
public class UpdateNewsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) (request.getSession().getAttribute("currentUser"));

        if (user != null){
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Long id = Long.parseLong(request.getParameter("id"));

            News news = DBManager.getNewsByID(id);

            if (news != null){
                news.setTitle(title);
                news.setContent(content);
                news.setUser(user);
                DBManager.updateNews(news);

                response.sendRedirect("/new_details?id=" + id);
            } else {
                response.sendRedirect("/home");
            }

        } else {
            response.sendRedirect("/login");
        }
    }
}
