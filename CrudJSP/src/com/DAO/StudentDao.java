package com.DAO;

import java.util.List;

import com.Model.Student;

public interface StudentDao {
	public Integer addStudent(Student s);
    public Integer deleteStudent(Integer studentId);
    public Integer updateStudent(Student s);
    public List<Student> viewAllRecord();
    public Integer viewByName(String username);
    public Student viewById(Integer studentId);
}
