package StudentDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.StudentDao;
import com.DBConnection.DBConnection;
import com.Model.Student;

public class StudentDaoImpl implements StudentDao{
	static Connection con = DBConnection.getConnection();
	@Override
	public Integer addStudent(Student s) {
		Integer roll = null;
		try {
			String add = "INSERT INTO studenttable(student_name,email,username,passwords,phone_number) VALUE(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(add);
			ps.setString(1, s.getStudentName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getUsername());
			ps.setString(4, s.getPasword());
			ps.setString(5, s.getPhoneNumber());
			roll = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roll;
	}

	@Override
	public Integer deleteStudent(Integer studentId) {
		Integer roll = null;
		try {
			String delete = "DELETE FROM studenttable WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(delete);
			ps.setInt(1, studentId);
			roll = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roll;
	}

	@Override
	public Integer updateStudent(Student s) {
		Integer roll = null;
		try {
			String update = "update studenttable set student_name = ?, email = ?, username = ?, passwords = ?, phone_number = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(update);
			ps.setString(1, s.getStudentName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getUsername());
			ps.setString(4, s.getPasword());
			ps.setString(5, s.getPhoneNumber());
			ps.setInt(6, s.getId());
			roll = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roll;
	}

	@Override
	public List<Student> viewAllRecord() {
		List<Student> list = new ArrayList<>();
		try {
			String all = "SELECT * FROM studenttable";
			PreparedStatement ps = con.prepareStatement(all);
			ResultSet set = ps.executeQuery();
			while(set.next())
			{
				Student s = new Student();
				s.setEmail(set.getString("email"));
				s.setPasword(set.getString("passwords"));
				s.setPhoneNumber(set.getString("phone_number"));
				s.setStudentName(set.getString("student_name"));
				s.setUsername(set.getString("username"));
				s.setId(set.getInt("id"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Integer viewByName(String username) {
		Integer roll = null;
		ResultSet set = null;
		try {
			String viewName = "SELECT id FROM studenttable WHERE username = ?";
			PreparedStatement ps = con.prepareStatement(viewName);
			ps.setString(1, username);
			set = ps.executeQuery();
			while (set.next()) {
				roll = set.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return roll;
	}

	@Override
	public Student viewById(Integer studentId) {
		Student s = new Student();
		try {
			String name = "SELECT * FROM studenttable where id= ?";
			PreparedStatement ps = con.prepareStatement(name);
			ps.setInt(1, studentId);
			ResultSet set = ps.executeQuery();
			while(set.next())
			{
				s.setEmail(set.getString("email"));
				s.setPasword(set.getString("passwords"));
				s.setPhoneNumber(set.getString("phone_number"));
				s.setStudentName(set.getString("student_name"));
				s.setUsername(set.getString("username"));
				s.setId(set.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

}
