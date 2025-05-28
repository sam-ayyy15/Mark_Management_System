<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Mark - Mark Management System</title>
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
        
        /* Form styling */
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
        
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
       
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Add Student Mark</h1>
            <p>Enter student examination details</p>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <!-- Navigation Sidebar -->
            <div class="sidebar">
                <h3>Navigation Menu</h3>
                <ul class="nav-menu">
                    <li><a href="index.jsp">🏠 Home</a></li>
                    <li><a href="markadd.jsp" class="active">➕ Add Marks</a></li>
                    <li><a href="markupdate.jsp">✏️ Update Marks</a></li>
                    <li><a href="markdelete.jsp">🗑️ Delete Marks</a></li>
                    <li><a href="DisplayMarksServlet">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Form Section -->
            <div class="form-section">
                <h3>Add New Student Mark</h3>
                
                <!-- Display success or error messages if any -->
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
                
                <form action="AddMarkServlet" method="post">
                    <div class="form-group">
                        <label for="studentId" class="form-label">Student ID</label>
                        <input type="text" class="form-input" id="studentId" name="studentId" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="studentName" class="form-label">Student Name</label>
                        <input type="text" class="form-input" id="studentName" name="studentName" required maxlength="100">
                    </div>
                    
                    <div class="form-group">
                        <label for="subject" class="form-label">Subject</label>
                        <select class="form-select" id="subject" name="subject" required>
                            <option value="" selected disabled>Select a subject</option>
                            <option value="Mathematics">Mathematics</option>
                            <option value="Physics">Physics</option>
                            <option value="Chemistry">Chemistry</option>
                            <option value="Biology">Biology</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="English">English</option>
                            <option value="History">History</option>
                            <option value="Geography">Geography</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="marks" class="form-label">Marks (0-100)</label>
                        <input type="number" class="form-input" id="marks" name="marks" min="0" max="100" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="examDate" class="form-label">Exam Date</label>
                        <input type="date" class="form-input" id="examDate" name="examDate" required>
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">Add Student Mark</button>
                        <button type="reset" class="btn btn-secondary">Clear Form</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>