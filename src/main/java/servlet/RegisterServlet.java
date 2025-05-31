package servlet;

import dao.StudentDAO;
import model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String major = request.getParameter("major");
        String email = request.getParameter("email");

        Student student = new Student();
        student.setStudentId(studentId);
        student.setName(name);
        student.setPassword(password);
        student.setGender(gender);
        student.setAge(age);
        student.setMajor(major);
        student.setEmail(email);

        boolean success = studentDAO.addStudent(student);
        String msg = success ? "注册成功！" : "注册失败，学号已存在或数据有误！";
        String redirect = "login.jsp";
        response.getWriter().println("<script>alert('" + msg + "');window.location='" + redirect + "';</script>");
    }
} 