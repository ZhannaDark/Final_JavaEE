package com.example.javaee.project;

import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:8889/javaee_dbms",
                    "root",
                    "root");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static User getUser(String email){
        User user = null;

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM users where email = ?");

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                user = new User();
                user.setId((long) resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFull_name(resultSet.getString("full_name"));
                user.setRole_id(resultSet.getString("role_id"));
            }

            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static boolean addUser(User user){
        int rows = 0;
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "insert into users (email, password, full_name, role_id)" +
                            " values (?, ?, ?, ?)");

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFull_name());
            if (user.getRole_id().equals("user")) {
                user.setRole_id("2");
            } else {
                user.setRole_id("1");
            }
            statement.setString(4, "user");

            rows = statement.executeUpdate();

            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static void addNews(News news){

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "insert into news (title, content, post_date, user_id) values" +
                            " (?, ?, NOW(), ?)");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setLong(3, news.getUser().getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getAllNews(){
        ArrayList<News> news = new ArrayList<>();
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id, n.title, n.content, n.user_id, u.full_name, n.post_date" +
                            " FROM news n " +
                            " INNER JOIN users u ON u.id = n.user_id " +
                            " ORDER BY n.post_date DESC"
            );

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){

                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setFull_name(resultSet.getString("full_name"));

                News newNews = new News();
                newNews.setId(resultSet.getLong("id"));
                newNews.setTitle(resultSet.getString("title"));
                newNews.setContent(resultSet.getString("content"));
                newNews.setPostDate(resultSet.getTimestamp("post_date"));
                newNews.setUser(user);


                news.add(newNews);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static News getNewsByID(Long id){
        News newNews = null;

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id, n.title, n.content, n.user_id, u.full_name, n.post_date" +
                            " FROM news n " +
                            " INNER JOIN users u ON u.id = n.user_id " +
                            " WHERE n.id = ?"
            );
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setFull_name(resultSet.getString("full_name"));

                newNews = new News();
                newNews.setId(resultSet.getLong("id"));
                newNews.setTitle(resultSet.getString("title"));
                newNews.setContent(resultSet.getString("content"));
                newNews.setPostDate(resultSet.getTimestamp("post_date"));
                newNews.setUser(user);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return newNews;

    }
    public static void updateNews(News news) {

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE news SET title = ?, content = ?" +
                            " WHERE id = ?");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setLong(3, news.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteNews(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM news WHERE id = ?");

            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addComment(Comment comment){
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "insert into comments (comment, user_id, news_id, post_date) values " +
                            "( ?, ?, ?, NOW())");

            statement.setString(1, comment.getComment());
            statement.setLong(2, comment.getUser().getId());
            statement.setLong(3, comment.getNews().getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Comment> getComments(Long id){
        ArrayList<Comment> comments = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT co.id, co.comment, co.post_date, co.news_id, co.user_id, u.full_name" +
                    " FROM comments co INNER JOIN users u ON u.id = co.user_id" +
                    " WHERE co.news_id = ?" +
                    " ORDER BY co.post_date DESC");
            statement.setLong(1, (id));
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setTimestamp(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setFull_name(resultSet.getString("full_name"));

                News news = new News();
                news.setId(resultSet.getLong("news_id"));

                comment.setUser(user);
                comment.setNews(news);
                comments.add(comment);
            }
            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }

        return comments;
    }

    public static void updateUser(User user){
        User user1 = null;
        try {
            PreparedStatement statement = connection.prepareStatement("update users set full_name = ?, password = ? where email = ?");
            statement.setString(1, user.getFull_name());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }




}
