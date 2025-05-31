package servlet;

import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;
import java.util.List;

@WebServlet("/student/*")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null || action.equals("/list")) {
            listStudents(request, response);
        } else if (action.equals("/edit")) {
            showEditForm(request, response);
        } else if (action.equals("/delete")) {
            deleteStudent(request, response);
        } else if (action.equals("/add")) {
            request.getRequestDispatcher("/addStudent.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null || action.equals("/add")) {
            addStudent(request, response);
        } else if (action.equals("/update")) {
            updateStudent(request, response);
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Student> students = studentDAO.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/studentList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String studentId = request.getParameter("id");
        Student student = studentDAO.getStudentById(studentId);
        request.setAttribute("student", student);
        request.getRequestDispatcher("/editStudent.jsp").forward(request, response);
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Student student = new Student();
        student.setStudentId(request.getParameter("studentId"));
        student.setName(request.getParameter("name"));
        student.setPassword(request.getParameter("password"));
        student.setGender(request.getParameter("gender"));
        student.setAge(Integer.parseInt(request.getParameter("age")));
        student.setMajor(request.getParameter("major"));
        student.setEmail(request.getParameter("email"));

        if (studentDAO.addStudent(student)) {
            response.sendRedirect(request.getContextPath() + "/student/list");
        } else {
            request.setAttribute("error", "Failed to add student");
            request.getRequestDispatcher("/addStudent.jsp").forward(request, response);
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Student student = new Student();
        student.setStudentId(request.getParameter("studentId"));
        student.setName(request.getParameter("name"));
        student.setPassword(request.getParameter("password"));
        student.setGender(request.getParameter("gender"));
        student.setAge(Integer.parseInt(request.getParameter("age")));
        student.setMajor(request.getParameter("major"));
        student.setEmail(request.getParameter("email"));

        if (studentDAO.updateStudent(student)) {
            response.sendRedirect(request.getContextPath() + "/student/list");
        } else {
            request.setAttribute("error", "Failed to update student");
            request.getRequestDispatcher("/editStudent.jsp").forward(request, response);
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String studentId = request.getParameter("id");
        if (studentDAO.deleteStudent(studentId)) {
            response.sendRedirect(request.getContextPath() + "/student/list");
        } else {
            request.setAttribute("error", "Failed to delete student");
            request.getRequestDispatcher("/studentList.jsp").forward(request, response);
        }
    }
} 