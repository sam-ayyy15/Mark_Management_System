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
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 30px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border-radius: 10px 10px 0 0 !important;
        }
        .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
        }
        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }
        .form-label {
            font-weight: 500;
        }
        .alert {
            border-radius: 8px;
        }
        .nav-pills .nav-link.active {
            background-color: #3498db;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #3498db;
            color: white;
            border: none;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .badge {
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-header">
                        Navigation
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markadd.jsp">Add Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markupdate.jsp">Update Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markdelete.jsp">Delete Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="DisplayMarksServlet">Display Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="report_form.jsp">Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header">
                        Display Student Marks
                    </div>
                    <div class="card-body">
                        <!-- Display error messages if any -->
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <%= request.getAttribute("errorMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <!-- Search Form -->
                        <div class="card mb-3">
                            <div class="card-header bg-success text-white">
                                Search Student by ID
                            </div>
                            <div class="card-body">
                                <form action="DisplayMarksServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID">
                                    <button type="submit" class="btn btn-success me-2">Search</button>
                                    <a href="DisplayMarksServlet" class="btn btn-outline-secondary">Show All</a>
                                </form>
                            </div>
                        </div>
                        
                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
                            Boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            
                            if (studentMark != null) {
                        %>
                        
                        <!-- Single Student Result -->
                        <div class="card">
                            <div class="card-header bg-info text-white">
                                Search Result
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                        <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                        <p><strong>Subject:</strong> <span class="badge bg-primary"><%= studentMark.getSubject() %></span></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>Marks:</strong> 
                                            <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= studentMark.getMarks() %>
                                            </span>
                                        </p>
                                        <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                        <p><strong>Grade:</strong> 
                                            <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= studentMark.getMarks() >= 80 ? "A" : studentMark.getMarks() >= 60 ? "B" : "C" %>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <a href="UpdateMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="DeleteMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-danger btn-sm">Delete</a>
                                </div>
                            </div>
                        </div>
                        
                        <% } else if (marksList != null && !marksList.isEmpty()) { %>
                        
                        <!-- All Students Table -->
                        <div class="card">
                            <div class="card-header">
                                All Student Marks (Total: <%= marksList.size() %> records)
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
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
                                                <td><span class="badge bg-primary"><%= mark.getSubject() %></span></td>
                                                <td>
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                        <%= mark.getMarks() %>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
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
                        </div>
                        
                        <% } else if (searchPerformed != null && searchPerformed) { %>
                        
                        <!-- No results found -->
                        <div class="text-center">
                            <div class="mb-4">
                                <i class="bi bi-search" style="font-size: 48px; color: #6c757d;">🔍</i>
                            </div>
                            <h5 class="text-muted">No student record found</h5>
                            <p class="text-muted">The student ID you searched for does not exist in the database.</p>
                        </div>
                        
                        <% } else { %>
                        
                        <!-- Default view - no data -->
                        <div class="text-center">
                            <div class="mb-4">
                                <i class="bi bi-table" style="font-size: 48px; color: #6c757d;">📊</i>
                            </div>
                            <h5 class="text-muted">No student marks to display</h5>
                            <p class="text-muted">Use the search box above to find a specific student or click "Show All" to display all records.</p>
                        </div>
                        
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>