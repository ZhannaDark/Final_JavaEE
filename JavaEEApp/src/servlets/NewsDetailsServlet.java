package servlets;

import com.example.javaee.project.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/new_details")
public class NewsDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));

        News news = DBManager.getNewsByID(id);
        request.setAttribute("news", news);

        if (news != null) {
            ArrayList<Comment> comments = DBManager.getComments(news.getId());
            request.setAttribute("comments", comments);
        }
        request.getRequestDispatcher("/newsDetails.jsp").forward(request, response);
    }
}
