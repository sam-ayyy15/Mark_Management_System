<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark Management System</title>
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
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* Header section */
        .header {
            background-color: #2196F3;
            color: white;
            text-align: center;
            padding: 40px 20px;
            margin-bottom: 30px;
            border-radius: 8px;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .header p {
            font-size: 1.2em;
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
        
        /* Features section */
        .features {
            flex: 2;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
        }
        
        .features h3 {
            color: #2196F3;
            margin-bottom: 20px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .feature-card {
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: border-color 0.3s;
        }
        
        .feature-card:hover {
            border-color: #2196F3;
        }
        
        .feature-icon {
            font-size: 3em;
            margin-bottom: 15px;
        }
        
        .feature-card h4 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .feature-card p {
            color: #666;
            margin-bottom: 15px;
        }
        
        .btn {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #1976D2;
        }
        
        /* Footer */
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 30px 20px;
            margin-top: 40px;
            border-radius: 8px;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        
        .footer-section {
            margin-bottom: 20px;
        }
        
        .footer-section h4 {
            color: #64B5F6;
            margin-bottom: 10px;
        }
        
        .footer-section ul {
            list-style: none;
        }
        
        .footer-section ul li {
            margin-bottom: 5px;
        }
        
        .footer-section a {
            color: #ccc;
            text-decoration: none;
        }
        
        .footer-section a:hover {
            color: white;
        }
        
        .footer-bottom {
            border-top: 1px solid #555;
            padding-top: 15px;
            color: #ccc;
        }
        
    
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Student Mark Management System</h1>
            <p>Simple and efficient way to manage student examination marks</p>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <!-- Navigation Sidebar -->
            <div class="sidebar">
                <h3>Navigation Menu</h3>
                <ul class="nav-menu">
                    <li><a href="index.jsp" class="active">🏠 Home</a></li>
                    <li><a href="markadd.jsp">➕ Add Marks</a></li>
                    <li><a href="markupdate.jsp">✏️ Update Marks</a></li>
                    <li><a href="markdelete.jsp">🗑️ Delete Marks</a></li>
                    <li><a href="DisplayMarksServlet">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Features Section -->
            <div class="features">
                <h3>System Features</h3>
                <div class="feature-grid">
                    <div class="feature-card">
                        <div class="feature-icon">📝</div>
                        <h4>Add Student Marks</h4>
                        <p>Add new student examination marks to the database</p>
                        <a href="markadd.jsp" class="btn">Add Marks</a>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">✏️</div>
                        <h4>Update Marks</h4>
                        <p>Modify existing student examination records</p>
                        <a href="markupdate.jsp" class="btn">Update Marks</a>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">🗑️</div>
                        <h4>Delete Marks</h4>
                        <p>Remove student records from the system</p>
                        <a href="markdelete.jsp" class="btn">Delete Marks</a>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">📊</div>
                        <h4>Display Marks</h4>
                        <p>View all student marks or search by student ID</p>
                        <a href="DisplayMarksServlet" class="btn">Display Marks</a>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">📈</div>
                        <h4>Generate Reports</h4>
                        <p>Create reports based on student performance</p>
                        <a href="report_form.jsp" class="btn">Generate Reports</a>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">ℹ️</div>
                        <h4>About System</h4>
                        <p>This system helps manage student examination marks efficiently using JSP, Servlets, and JDBC for reliable database operations.</p>
                        <div style="margin-top: 15px; text-align: left;">
                            <strong>Key Features:</strong>
                            <ul style="margin-top: 10px; text-align: left;">
                                <li>Add new student marks</li>
                                <li>Update existing records</li>
                                <li>Delete records when needed</li>
                                <li>View all records or search by ID</li>
                                <li>Generate performance reports</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Student Mark Management</h4>
                <p>Simple platform to manage student examination marks</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="markadd.jsp">Add Marks</a></li>
                    <li><a href="DisplayMarksServlet">Display Marks</a></li>
                    <li><a href="report_form.jsp">Reports</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Contact</h4>
                <p>📧 Email: support@markmanagement.com</p>
                <p>📱 Phone: +1 234 567 8900</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Student Mark Management System | Designed by Samay Shetty - 4AL22CS143</p>
        </div>
    </div>
</body>
</html>