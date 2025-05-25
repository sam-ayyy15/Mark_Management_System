<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
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
        .jumbotron {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            padding: 3rem 2rem;
            border-radius: 15px;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
        }
        .jumbotron::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            z-index: 1;
        }
        .jumbotron .content {
            position: relative;
            z-index: 2;
        }
        .jumbotron h1 {
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 1rem;
            font-size: 3rem;
            letter-spacing: -1px;
        }
        .jumbotron .lead {
            font-family: 'Poppins', sans-serif;
            font-weight: 300;
            color: #f8f9fa;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
            font-size: 1.3rem;
            margin-bottom: 0;
            opacity: 0.95;
        }
        @media (max-width: 768px) {
            .jumbotron h1 {
                font-size: 2.2rem;
            }
            .jumbotron .lead {
                font-size: 1.1rem;
            }
        }
        .feature-icon {
            font-size: 40px;
            color: #3498db;
            margin-bottom: 15px;
        }
        .nav-pills .nav-link.active {
            background-color: #3498db;
        }
        
        /* Footer Styles */
        .footer {
            background: linear-gradient(135deg, #2980b9 0%, #3498db 100%);
            color: white;
            padding: 40px 0 20px 0;
            margin-top: 50px;
            border-radius: 15px 15px 0 0;
        }
        .footer h5 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            color: #fff;
            margin-bottom: 20px;
        }
        .footer p, .footer li {
            font-family: 'Poppins', sans-serif;
            font-weight: 300;
            color: #ecf0f1;
            line-height: 1.6;
        }
        .footer ul {
            list-style: none;
            padding: 0;
        }
        .footer ul li {
            margin-bottom: 8px;
        }
        .footer ul li a {
            color: #ecf0f1;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .footer ul li a:hover {
            color: #fff;
            text-decoration: underline;
        }
        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: 30px;
            padding-top: 20px;
            text-align: center;
        }
        .footer-bottom p {
            margin: 0;
            font-size: 14px;
            opacity: 0.8;
        }
        .social-icons {
            margin-top: 15px;
        }
        .social-icons a {
            color: #ecf0f1;
            font-size: 20px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        .social-icons a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <div class="content">
                <h1 class="display-4">Student Mark Management System</h1>
                <p class="lead">A comprehensive system to manage student examination marks</p>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-header">
                        Navigation
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="index.jsp">Home</a>
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
                        Available Features
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-plus-circle"></i>📝
                                </div>
                                <h5>Add Student Marks</h5>
                                <p>Add new student examination marks to the system</p>
                                <a href="markadd.jsp" class="btn btn-primary">Add Marks</a>
                            </div>
                            
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-pencil-square"></i>✏️
                                </div>
                                <h5>Update Marks</h5>
                                <p>Modify existing student examination records</p>
                                <a href="markupdate.jsp" class="btn btn-primary">Update Marks</a>
                            </div>
                            
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-trash"></i>🗑️
                                </div>
                                <h5>Delete Marks</h5>
                                <p>Remove student examination records from the system</p>
                                <a href="markdelete.jsp" class="btn btn-primary">Delete Marks</a>
                            </div>
                            
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-table"></i>📊
                                </div>
                                <h5>Display Marks</h5>
                                <p>View all student marks or search by student ID</p>
                                <a href="DisplayMarksServlet" class="btn btn-primary">Display Marks</a>
                            </div>
                            
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-file-bar-graph"></i>📈
                                </div>
                                <h5>Generate Reports</h5>
                                <p>Create various reports based on student performance</p>
                                <a href="report_form.jsp" class="btn btn-primary">Generate Reports</a>
                            </div>
                            
                            <div class="col-md-4 text-center mb-4">
                                <div class="feature-icon">
                                    <i class="bi bi-info-circle"></i>ℹ️
                                </div>
                                <h5>About</h5>
                                <p>Learn more about the Student Mark Management System</p>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#aboutModal">
                                    About System
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>Student Mark Management System</h5>
                    <p>A comprehensive platform designed to efficiently manage and track student examination marks with advanced reporting capabilities.</p>
                    <div class="social-icons">
                        <a href="https://github.com/sam-ayyy15" title="Github">📂</a>
                        <a href="https://x.com/home" title="Twitter">𝕏</a>
                        <a href="www.linkedin.com/in/samayshetty" title="LinkedIn">📧</a>
                        <a href="https://www.instagram.com/sam.ayyy15/?__pwa=1" title="Instagram">🅾</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5>Quick Start</h5>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="markadd.jsp">Add Marks</a></li>
                        <li><a href="markupdate.jsp">Update Marks</a></li>
                        <li><a href="DisplayMarksServlet">Display Marks</a></li>
                        <li><a href="report_form.jsp">Generate Reports</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#" data-bs-toggle="modal" data-bs-target="#aboutModal">About System</a></li>
                   
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Student Mark Management System | Designed by Samay Shetty - 4AL22CS143</p>
            </div>
        </div>
    </footer>
    
    <!-- About Modal -->
    <div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="aboutModalLabel">About Student Mark Management System</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>This system was developed to manage student examination marks efficiently. It follows the MVC architecture pattern and utilizes JSP, Servlets, and JDBC for database operations.</p>
                    <p>Key features include:</p>
                    <ul>
                        <li>Adding new student marks</li>
                        <li>Updating existing records</li>
                        <li>Deleting records</li>
                        <li>Displaying all records or searching by student ID</li>
                        <li>Generating various reports like top performers, subject-wise performance, etc.</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>