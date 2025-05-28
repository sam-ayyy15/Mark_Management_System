<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Student Marks - Mark Management System</title>
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
        
        /* Main section */
        .main-section {
            flex: 2;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
        }
        
        .main-section h3 {
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
        
        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
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
            color: #28a745;
            margin-bottom: 15px;
            border-bottom: 2px solid #28a745;
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
        
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        
        .btn-success:hover {
            background-color: #218838;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .btn-warning {
            background-color: #ffc107;
            color: #000;
        }
        
        .btn-warning:hover {
            background-color: #e0a800;
        }
        
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c82333;
        }
        
        .btn-sm {
            padding: 8px 15px;
            font-size: 14px;
        }
        
        /* Student result section */
        .student-result {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
        }
        
        .student-result h4 {
            color: #17a2b8;
            margin-bottom: 15px;
            border-bottom: 2px solid #17a2b8;
            padding-bottom: 5px;
        }
        
        .result-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .result-column {
            flex: 1;
            min-width: 250px;
        }
        
        .result-item {
            margin-bottom: 10px;
        }
        
        .result-item strong {
            color: #2196F3;
        }
        
        .badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.9em;
            color: white;
            display: inline-block;
        }
        
        .badge-primary {
            background-color: #2196F3;
        }
        
        .badge-success {
            background-color: #28a745;
        }
        
        .badge-warning {
            background-color: #ffc107;
            color: #000;
        }
        
        .badge-danger {
            background-color: #dc3545;
        }
        
        /* Table styling */
        .table-section {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .table-header {
            background-color: #2196F3;
            color: white;
            padding: 15px 20px;
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .table th {
            background-color: #2196F3;
            color: white;
            padding: 12px;
            text-align: left;
            border: none;
        }
        
        .table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
        
        .empty-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
     
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Display Student Marks</h1>
            <p>View and manage student examination records</p>
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
                    <li><a href="markdelete.jsp">🗑️ Delete Marks</a></li>
                    <li><a href="DisplayMarksServlet" class="active">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Main Section -->
            <div class="main-section">
                <h3>Display Student Marks</h3>
                
                <!-- Display error messages if any -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <!-- Search Form -->
                <div class="search-section">
                    <h3 class="search-title">Search Student by ID</h3>
                    <form action="DisplayMarksServlet" method="get" class="search-form">
                        <input class="form-input" name="studentId" placeholder="Enter Student ID">
                        <button type="submit" class="btn btn-success">Search</button>
                        <a href="DisplayMarksServlet" class="btn btn-secondary">Show All</a>
                    </form>
                </div>
                
                <%
                    StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                    List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
                    Boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    
                    if (studentMark != null) {
                %>
                
                <!-- Single Student Result -->
                <div class="student-result">
                    <h4>🔍 Search Result</h4>
                    <div class="result-row">
                        <div class="result-column">
                            <div class="result-item">
                                <strong>Student ID:</strong> <%= studentMark.getStudentId() %>
                            </div>
                            <div class="result-item">
                                <strong>Student Name:</strong> <%= studentMark.getStudentName() %>
                            </div>
                            <div class="result-item">
                                <strong>Subject:</strong> <span class="badge badge-primary"><%= studentMark.getSubject() %></span>
                            </div>
                        </div>
                        <div class="result-column">
                            <div class="result-item">
                                <strong>Marks:</strong> 
                                <span class="badge <%= studentMark.getMarks() >= 80 ? "badge-success" : studentMark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                    <%= studentMark.getMarks() %>
                                </span>
                            </div>
                            <div class="result-item">
                                <strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %>
                            </div>
                            <div class="result-item">
                                <strong>Grade:</strong> 
                                <span class="badge <%= studentMark.getMarks() >= 80 ? "badge-success" : studentMark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                    <%= studentMark.getMarks() >= 80 ? "A" : studentMark.getMarks() >= 60 ? "B" : "C" %>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 15px;">
                        <a href="UpdateMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-danger btn-sm">Delete</a>
                    </div>
                </div>
                
                <% } else if (marksList != null && !marksList.isEmpty()) { %>
                
                <!-- All Students Table -->
                <div class="table-section">
                    <div class="table-header">
                        All Student Marks (Total: <%= marksList.size() %> records)
                    </div>
                    <div style="overflow-x: auto;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                    <th>Exam Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (StudentMark mark : marksList) { %>
                                <tr>
                                    <td><%= mark.getStudentId() %></td>
                                    <td><%= mark.getStudentName() %></td>
                                    <td><span class="badge badge-primary"><%= mark.getSubject() %></span></td>
                                    <td>
                                        <span class="badge <%= mark.getMarks() >= 80 ? "badge-success" : mark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= mark.getMarks() %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge <%= mark.getMarks() >= 80 ? "badge-success" : mark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= mark.getMarks() >= 80 ? "A" : mark.getMarks() >= 60 ? "B" : "C" %>
                                        </span>
                                    </td>
                                    <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                    <td>
                                        <a href="UpdateMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="DeleteMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <% } else if (searchPerformed != null && searchPerformed) { %>
                
                <!-- No results found -->
                <div class="empty-state">
                    <div class="empty-icon">🔍</div>
                    <h4>No student record found</h4>
                    <p>The student ID you searched for does not exist in the database.</p>
                </div>
                
                <% } else { %>
                
                <!-- Default view - no data -->
                <div class="empty-state">
                    <div class="empty-icon">📊</div>
                    <h4>No student marks to display</h4>
                    <p>Use the search box above to find a specific student or click "Show All" to display all records.</p>
                </div>
                
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>