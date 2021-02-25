<%@page import="com.Model.Student"%>
<%@page import="com.DAO.StudentDao"%>
<%@page import="StudentDaoImpl.StudentDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	Integer id = Integer.parseInt(request.getParameter("id"));
    
    String action = request.getParameter("action");
    
    System.out.println("id is "+ id);
    
    StudentDao studentDao = new StudentDaoImpl();
    
    Student student = studentDao.viewById(id);
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="./AddServlet" style="background-color: #055ada;color: white;border: 2px;border-radius: 30px;width: 100px;text-align: center;">ADD</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="./ViewAllServlet" style="background-color: #055ada;color: white;border: 2px;border-radius: 30px;width: 150px;text-align: center;margin-left: 10px;">View All</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="contact-clean">
        <form  action="Handle?id=<%=id %>&action=<%=action %>" method="post">
            <h2 class="text-center">Update</h2>
            <div class="form-group"><input class="form-control" type="text" name="StudentName" placeholder="Student Name" value="<%=student.getStudentName()%>"></div>
            <div class="form-group"><input class="form-control" type="text" name="Username" placeholder="Username" value="<%=student.getUsername()%>"></div>
            <div class="form-group"><input class="form-control" type="number" name="Email" placeholder="Email" value="<%=student.getEmail()%>"></div>
            <div class="form-group"><input class="form-control" type="email" name="Password" placeholder="Password" value="<%=student.getPasword()%>"></div>
            <div class="form-group"><input class="form-control" type="email" name="PhoneNumber" placeholder="Phone Number" value="<%=student.getPhoneNumber()%>"></div>
            <div class="form-group"><button class="btn btn-primary btn btn-light" type="submit">Update</button></div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>