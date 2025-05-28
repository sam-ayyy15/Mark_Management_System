<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student Mark - Mark Management System</title>
    <style>
        /* Simple reset and basic styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            line-height: 1.6;
            color: #333;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* Header section */
        .header {
            background-color: #2196F3;
            color: white;
            text-align: center;
            padding: 30px 20px;
            margin-bottom: 30px;
            border-radius: 8px;
        }
        
        .header h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }
        
        /* Main content area */
        .main-content {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        /* Navigation sidebar */
        .sidebar {
            flex: 1;
            min-width: 250px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            height: fit-content;
        }
        
        .sidebar h3 {
            color: #2196F3;
            margin-bottom: 15px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }
        
        .nav-menu {
            list-style: none;
        }
        
        .nav-menu li {
            margin-bottom: 10px;
        }
        
        .nav-menu a {
            display: block;
            padding: 12px 15px;
            background-color: #f9f9f9;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        
        .nav-menu a:hover {
            background-color: #2196F3;
            color: white;
        }
        
        .nav-menu a.active {
            background-color: #2196F3;
            color: white;
        }
        
        /* Form section */
        .form-section {
            flex: 2;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
        }
        
        .form-section h3 {
            color: #2196F3;
            margin-bottom: 20px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }
        
        /* Alert messages */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeaa7;
        }
        
        /* Search section */
        .search-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
        }
        
        .search-title {
            color: #2196F3;
            margin-bottom: 15px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }
        
        .search-form {
            display: flex;
            gap: 10px;
        }
        
        .form-input {
            flex: 1;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #2196F3;
        }
        
        /* Button styling */
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
            transition: background-color 0.3s;
        }
        
        .btn-primary {
            background-color: #2196F3;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #1976D2;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-delete:hover {
            background-color: #c82333;
        }
        
        /* Student info section */
        .student-info {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
        }
        
        .student-info h4 {
            color: #dc3545;
            margin-bottom: 15px;
            border-bottom: 2px solid #dc3545;
            padding-bottom: 5px;
        }
        
        .info-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .info-column {
            flex: 1;
            min-width: 250px;
        }
        
        .info-item {
            margin-bottom: 10px;
        }
        
        .info-item strong {
            color: #2196F3;
        }
        
        .delete-form {
            margin-top: 20px;
        }
        
        .checkbox-container {
            margin-bottom: 20px;
        }
        
        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #dc3545;
            font-weight: bold;
        }
        
        .checkbox-input {
            width: 18px;
            height: 18px;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
        
        .search-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
       
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Delete Student Mark</h1>
            <p>Search and remove student examination records</p>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <!-- Navigation Sidebar -->
            <div class="sidebar">
                <h3>Navigation Menu</h3>
                <ul class="nav-menu">
                    <li><a href="index.jsp">🏠 Home</a></li>
                    <li><a href="markadd.jsp">➕ Add Marks</a></li>
                    <li><a href="markupdate.jsp">✏️ Update Marks</a></li>
                    <li><a href="markdelete.jsp" class="active">🗑️ Delete Marks</a></li>
                    <li><a href="DisplayMarksServlet">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Form Section -->
            <div class="form-section">
                <h3>Delete Student Mark</h3>
                
                <!-- Success/Error Messages -->
                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
                
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <!-- Search Section -->
                <div class="search-section">
                    <h3 class="search-title">Search Student by ID</h3>
                    <form action="DeleteMarkServlet" method="get" class="search-form">
                        <input class="form-input" name="studentId" placeholder="Enter Student ID" required>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>
                
                <!-- Student Information and Delete Form -->
                <%
                    StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                    if (studentMark != null) {
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                %>
                
                <div class="student-info">
                    <h4>⚠️ Student Record Found</h4>
                    <div class="info-row">
                        <div class="info-column">
                            <div class="info-item">
                                <strong>Student ID:</strong> <%= studentMark.getStudentId() %>
                            </div>
                            <div class="info-item">
                                <strong>Student Name:</strong> <%= studentMark.getStudentName() %>
                            </div>
                        </div>
                        <div class="info-column">
                            <div class="info-item">
                                <strong>Subject:</strong> <%= studentMark.getSubject() %>
                            </div>
                            <div class="info-item">
                                <strong>Marks:</strong> <%= studentMark.getMarks() %>
                            </div>
                            <div class="info-item">
                                <strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="alert alert-warning">
                    <strong>⚠️ Warning!</strong><br>
                    This action will permanently delete the student record. This cannot be undone.
                </div>
                
                <form action="DeleteMarkServlet" method="post" class="delete-form">
                    <input type="hidden" name="studentId" value="<%= studentMark.getStudentId() %>">
                    
                    <div class="checkbox-container">
                        <label class="checkbox-label">
                            <input class="checkbox-input" type="checkbox" name="confirmation" value="yes" required>
                            I confirm that I want to permanently delete this student record
                        </label>
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-delete">Delete Student Record</button>
                        <a href="markdelete.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
                
                <% } else { %>
                
                <div class="empty-state">
                    <div class="search-icon">🔍</div>
                    <h4>Search for a student record to delete</h4>
                    <p>Enter a Student ID in the search box above to find the record you want to delete.</p>
                </div>
                
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>