package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.StudentDao;
import com.Model.Student;

import StudentDaoImpl.StudentDaoImpl;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	StudentDao studentDAOImpl = new StudentDaoImpl();
	Student student = null;
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentName = request.getParameter("StudentName");
		String username = request.getParameter("Username");
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String phonenumber = request.getParameter("phoneNumber");
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		
		if(action.equals("update"))
		{
			Integer studentId = Integer.parseInt(id);
			student  = studentDAOImpl.viewById(studentId);
			
			student.setEmail(email);
			student.setPasword(password);
			student.setPhoneNumber(phonenumber);
			student.setStudentName(studentName);
			student.setUsername(username);
			
			int result = studentDAOImpl.updateStudent(student);

			if (result > 0) {
				response.sendRedirect("view-all.jsp");
			} else {
				response.getWriter().print("<h1>Error</h1>");
			}
		}
		else if(action.equals("delete")) {
			Integer studentId = Integer.parseInt(id);
			int result = studentDAOImpl.deleteStudent(studentId);

			if (result > 0) {
				response.sendRedirect("view-all.jsp");
			} else {
				response.getWriter().print("<center><h1>ERROR</h1></center>");
			}
		}
		else if(action.equals("add"))
		{
			student = new Student();
			student.setEmail(email);
			student.setPasword(password);
			student.setPhoneNumber(phonenumber);
			student.setStudentName(studentName);
			student.setUsername(username);
			int result = studentDAOImpl.addStudent(student);

			if (result > 0) {
				response.sendRedirect("view-all.jsp");
			} else {
				response.getWriter().print("<h1>Error</h1>");
			}
		}
		else if (action.equals("view")) {
			response.sendRedirect("view-all.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
