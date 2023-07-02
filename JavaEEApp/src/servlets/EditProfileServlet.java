package servlets;

import com.example.javaee.project.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/edit-profile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("currentUser");

        if (user != null){
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login");
        }
        response.sendRedirect("/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("id");
        String old = request.getParameter("old_password");
        String ne = request.getParameter("new_password");
        String full = request.getParameter("full_name");
        User user = DBManager.getUser(email);
        if (user != null){
            if (old.equals("") && ne.equals("")){
                User user1 = (User) request.getSession().getAttribute("currentUser");
                user1.setFull_name(full);
                DBManager.updateUser(user1);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            }
        }
        if (user != null) {
            if (user.getPassword().equals(old)) {
                User user1 = (User) request.getSession().getAttribute("currentUser");
                user1.setFull_name(full);
                user1.setPassword(ne);
                DBManager.updateUser(user1);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            }
        }
        response.sendRedirect("/login");
    }
}