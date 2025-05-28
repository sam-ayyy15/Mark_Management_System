<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Mark - Mark Management System</title>
    <style>
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

        .content {
            flex: 2;
            min-width: 300px;
        }

        /* Form section */
        .form-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .form-section h3 {
            color: #2196F3;
            margin-bottom: 20px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-input, .form-select {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: #2196F3;
        }

        .form-input:invalid {
            border-color: #dc3545;
        }

        .form-input:valid {
            border-color: #28a745;
        }

        .search-form {
            display: flex;
            gap: 10px;
            align-items: end;
        }

        .search-form .form-group {
            flex: 1;
            margin-bottom: 0;
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

        .btn-info {
            background-color: #17a2b8;
            color: white;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        .btn-full {
            width: 100%;
            margin-right: 0;
        }

        .button-group {
            text-align: center;
            margin-top: 20px;
        }

        .alert {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
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

        .search-card {
            background-color: #e3f2fd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .search-card h3 {
            color: #17a2b8;
            margin-bottom: 15px;
            border-bottom: 2px solid #17a2b8;
            padding-bottom: 5px;
        }

     
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Update Student Mark</h1>
            <p>Search and modify student examination details</p>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <!-- Navigation Sidebar -->
            <div class="sidebar">
                <h3>Navigation Menu</h3>
                <ul class="nav-menu">
                    <li><a href="index.jsp">🏠 Home</a></li>
                    <li><a href="markadd.jsp">➕ Add Marks</a></li>
                    <li><a href="markupdate.jsp" class="active">✏️ Update Marks</a></li>
                    <li><a href="markdelete.jsp">🗑️ Delete Marks</a></li>
                    <li><a href="DisplayMarksServlet">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Main Content -->
            <div class="content">
                <!-- Display Messages -->
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
                
                <!-- Search Student Card -->
                <div class="search-card">
                    <h3>Search Student by ID</h3>
                    <form action="UpdateMarkServlet" method="get" class="search-form">
                        <div class="form-group">
                            <label class="form-label">Student ID</label>
                            <input type="text" class="form-input" name="studentId" placeholder="Enter Student ID" required>
                        </div>
                        <button type="submit" class="btn btn-info">Search</button>
                    </form>
                </div>
                
                <!-- Update Form Section -->
                <div class="form-section">
                    <h3>Update Student Mark</h3>
                    
                    <%
                        StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    %>
                    
                    <form action="UpdateMarkServlet" method="post">
                        <div class="form-group">
                            <label for="studentId" class="form-label">Student ID</label>
                            <input type="text" class="form-input" id="studentId" name="studentId" 
                                   value="<%= studentMark != null ? studentMark.getStudentId() : "" %>" 
                                   <%= studentMark != null ? "readonly" : "" %> required>
                        </div>
                        
                        <div class="form-group">
                            <label for="studentName" class="form-label">Student Name</label>
                            <input type="text" class="form-input" id="studentName" name="studentName" 
                                   value="<%= studentMark != null ? studentMark.getStudentName() : "" %>" 
                                   maxlength="100" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="subject" class="form-label">Subject</label>
                            <select class="form-select" id="subject" name="subject" required>
                                <option value="">Select a subject</option>
                                <option value="Mathematics" <%= studentMark != null && "Mathematics".equals(studentMark.getSubject()) ? "selected" : "" %>>Mathematics</option>
                                <option value="Physics" <%= studentMark != null && "Physics".equals(studentMark.getSubject()) ? "selected" : "" %>>Physics</option>
                                <option value="Chemistry" <%= studentMark != null && "Chemistry".equals(studentMark.getSubject()) ? "selected" : "" %>>Chemistry</option>
                                <option value="Biology" <%= studentMark != null && "Biology".equals(studentMark.getSubject()) ? "selected" : "" %>>Biology</option>
                                <option value="Computer Science" <%= studentMark != null && "Computer Science".equals(studentMark.getSubject()) ? "selected" : "" %>>Computer Science</option>
                                <option value="English" <%= studentMark != null && "English".equals(studentMark.getSubject()) ? "selected" : "" %>>English</option>
                                <option value="History" <%= studentMark != null && "History".equals(studentMark.getSubject()) ? "selected" : "" %>>History</option>
                                <option value="Geography" <%= studentMark != null && "Geography".equals(studentMark.getSubject()) ? "selected" : "" %>>Geography</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="marks" class="form-label">Marks (0-100)</label>
                            <input type="number" class="form-input" id="marks" name="marks" 
                                   min="0" max="100" 
                                   value="<%= studentMark != null ? studentMark.getMarks() : "" %>" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="examDate" class="form-label">Exam Date</label>
                            <input type="date" class="form-input" id="examDate" name="examDate" 
                                   value="<%= studentMark != null ? dateFormat.format(studentMark.getExamDate()) : "" %>" required>
                        </div>
                        
                        <div class="button-group">
                            <button type="submit" class="btn btn-primary">Update Student Mark</button>
                            <button type="reset" class="btn btn-secondary">Clear Form</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>