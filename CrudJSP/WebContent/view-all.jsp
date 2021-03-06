<%@page import="com.Model.Student"%>
<%@page import="com.DAO.StudentDao"%>
<%@page import="StudentDaoImpl.StudentDaoImpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
                StudentDao studentDaoImpl = new StudentDaoImpl();
            	List<Student> allStudents = studentDaoImpl.viewAllRecord();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Record</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
<nav class="navbar navbar-light navbar-expand-md" style="background-color: rgba(224,222,222,0.79);">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="add.jsp?action=add" style="background-color: #055ada;color: white;border: 2px;border-radius: 30px;width: 100px;text-align: center;">ADD</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="./Handle?action=view" style="background-color: #055ada;color: white;border: 2px;border-radius: 30px;width: 150px;text-align: center;margin-left: 10px;">View All</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <% if(allStudents.size() > 0){ %>
    <section style="display: flex;justify-content: center;text-align: center;align-items: center;height: 200px;"><label style="height: 90px;font-size: 50px;font-weight: bold;font-family: sans-serif;color: #868e9a;">View All</label></section>
    <section style="width: 80%;margin: 0px auto;/*margin-top: 40px;*/">
    
    
    
        <div class="table-responsive table-bordered">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Roll No</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                <% for(Student s: allStudents){ %>
                    <tr>
                        <td><%=s.getStudentName() %></td>
                        <td><%=s.getUsername() %></td>
                        <td><%=s.getEmail() %></td>
                        <td><%=s.getPasword() %></td>
                        <td><%=s.getPhoneNumber() %></td>
                        <td style="width: 150px;"><a href='update.jsp?id=<%=s.getId()%>&action=update'><i class="icon ion-edit" style="margin: 0px 10px;"></i>Update</a></td>
                        <td style="width: 150px;"><a href="Handle?id=<%=s.getId()%>&action=delete"><i class="icon ion-android-delete" style="margin: 0px 10px;color: rgb(228,12,12);"></i>Delete</a></td>
                    </tr>
                    <%} %>
                    
              	<tbody>
            </table>
        </div>
     <% } else {%>
        	<section style="display: flex;justify-content: center;text-align: center;align-items: center;height: 200px;"><label style="height: 90px;font-size: 50px;font-weight: bold;font-family: sans-serif;color: #868e9a;">No Records!</label></section>
     <%} %>   
    </section>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>