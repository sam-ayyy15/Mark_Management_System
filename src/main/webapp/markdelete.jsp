<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student Mark - Mark Management System</title>
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
        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }
        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b;
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
        .student-info {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
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
                                <a class="nav-link active" href="markdelete.jsp">Delete Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
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
                        Delete Student Mark
                    </div>
                    <div class="card-body">
                        <!-- Display success or error messages if any -->
                        <% if (request.getAttribute("successMessage") != null) { %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%= request.getAttribute("successMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <%= request.getAttribute("errorMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <!-- Search Form -->
                        <div class="card mb-3">
                            <div class="card-header bg-warning text-dark">
                                Search Student by ID
                            </div>
                            <div class="card-body">
                                <form action="DeleteMarkServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID" required>
                                    <button type="submit" class="btn btn-warning">Search</button>
                                </form>
                            </div>
                        </div>
                        
                        <!-- Student Information and Delete Confirmation -->
                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            if (studentMark != null) {
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        %>
                        
                        <div class="student-info">
                            <h5 class="text-danger">⚠️ Student Record Found</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                    <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Subject:</strong> <%= studentMark.getSubject() %></p>
                                    <p><strong>Marks:</strong> <%= studentMark.getMarks() %></p>
                                    <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="alert alert-warning" role="alert">
                            <h6 class="alert-heading">⚠️ Warning!</h6>
                            This action will permanently delete the student record. This cannot be undone.
                        </div>
                        
                        <form action="DeleteMarkServlet" method="post" id="deleteForm">
                            <input type="hidden" name="studentId" value="<%= studentMark.getStudentId() %>">
                            
                            <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="confirmDelete" name="confirmation" value="yes" required>
                                    <label class="form-check-label text-danger" for="confirmDelete">
                                        <strong>I confirm that I want to permanently delete this student record</strong>
                                    </label>
                                    <div class="invalid-feedback">You must confirm the deletion before proceeding.</div>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-danger" id="deleteBtn" disabled>Delete Student Record</button>
                                <a href="markdelete.jsp" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                        
                        <% } else { %>
                        
                        <div class="text-center">
                            <div class="mb-4">
                                <i class="bi bi-search" style="font-size: 48px; color: #6c757d;">🔍</i>
                            </div>
                            <h5 class="text-muted">Search for a student record to delete</h5>
                            <p class="text-muted">Enter a Student ID in the search box above to find the record you want to delete.</p>
                        </div>
                        
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Form validation and confirmation script -->
    <script>
        // Enable delete button only when confirmation checkbox is checked
        document.getElementById('confirmDelete')?.addEventListener('change', function() {
            document.getElementById('deleteBtn').disabled = !this.checked;
        });
        
        // Additional confirmation before form submission
        document.getElementById('deleteForm')?.addEventListener('submit', function(event) {
            if (!confirm('Are you absolutely sure you want to delete this student record? This action cannot be undone.')) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>