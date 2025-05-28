<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - Mark Management System</title>
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
        
        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
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
        
        /* Radio button styling */
        .radio-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .radio-option {
            display: flex;
            align-items: flex-start;
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            cursor: pointer;
            transition: border-color 0.3s;
        }
        
        .radio-option:hover {
            border-color: #2196F3;
        }
        
        .radio-option input[type="radio"] {
            margin-right: 15px;
            margin-top: 2px;
        }
        
        .radio-content h4 {
            color: #2196F3;
            margin-bottom: 5px;
            font-size: 1.1em;
        }
        
        .radio-content p {
            color: #666;
            font-size: 0.9em;
            margin: 0;
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
        
        /* Instructions section */
        .instructions {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .instructions h4 {
            color: #2196F3;
            margin-bottom: 15px;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 5px;
        }
        
        .instructions ul {
            padding-left: 20px;
            margin-bottom: 15px;
        }
        
        .instructions li {
            margin-bottom: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Generate Reports</h1>
            <p>Create detailed reports based on student performance data</p>
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
                    <li><a href="DisplayMarksServlet">📊 Display Marks</a></li>
                    <li><a href="report_form.jsp" class="active">📈 Generate Reports</a></li>
                </ul>
            </div>
            
            <!-- Form Section -->
            <div class="form-section">
                <h3>Report Generation</h3>
                
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
                
                <form action="ReportServlet" method="post">
                    <div class="form-group">
                        <label class="form-label">Select Report Type</label>
                        <div class="radio-group">
                            <label class="radio-option">
                                <input type="radio" name="reportType" value="aboveThreshold" required onchange="showInput('threshold')">
                                <div class="radio-content">
                                    <h4>📊 Students Above Threshold</h4>
                                    <p>Find students with marks above a specified value</p>
                                </div>
                            </label>
                            
                            <label class="radio-option">
                                <input type="radio" name="reportType" value="bySubject" required onchange="showInput('subject')">
                                <div class="radio-content">
                                    <h4>📚 Students by Subject</h4>
                                    <p>View all students who took a specific subject</p>
                                </div>
                            </label>
                            
                            <label class="radio-option">
                                <input type="radio" name="reportType" value="topStudents" required onchange="showInput('count')">
                                <div class="radio-content">
                                    <h4>🏆 Top Students</h4>
                                    <p>Display top N students based on their marks</p>
                                </div>
                            </label>
                        </div>
                    </div>
                    
                    <!-- Threshold input (hidden by default) -->
                    <div class="form-group" id="thresholdGroup" style="display: none;">
                        <label for="threshold" class="form-label">Minimum Marks Threshold</label>
                        <input type="number" class="form-input" id="threshold" name="threshold" min="0" max="100" placeholder="Enter minimum marks (0-100)">
                    </div>
                    
                    <!-- Subject input (hidden by default) -->
                    <div class="form-group" id="subjectGroup" style="display: none;">
                        <label for="subject" class="form-label">Select Subject</label>
                        <select class="form-select" id="subject" name="subject">
                            <option value="" selected disabled>Choose a subject</option>
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
                    
                    <!-- Count input (hidden by default) -->
                    <div class="form-group" id="countGroup" style="display: none;">
                        <label for="count" class="form-label">Number of Top Students</label>
                        <input type="number" class="form-input" id="count" name="count" min="1" max="100" placeholder="Enter number of students">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                        <button type="reset" class="btn btn-secondary">Clear Form</button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Instructions Section -->
        <div class="instructions">
            <h4>Instructions</h4>
            <p><strong>How to use:</strong></p>
            <ul>
                <li><strong>Students Above Threshold:</strong> Select this option and enter a minimum marks value in the field that appears.</li>
                <li><strong>Students by Subject:</strong> Select this option and choose a subject from the dropdown that appears.</li>
                <li><strong>Top Students:</strong> Select this option and enter how many top students you want to see in the field that appears.</li>
            </ul>
            <div class="alert alert-info">
                <strong>Note:</strong> Select a report type above to see the input field for that specific report.
            </div>
        </div>
    </div>
    
    <!-- Simple JavaScript for showing/hiding inputs -->
    <script>
        function showInput(inputType) {
            // Hide all input groups
            document.getElementById('thresholdGroup').style.display = 'none';
            document.getElementById('subjectGroup').style.display = 'none';
            document.getElementById('countGroup').style.display = 'none';
            
            // Clear all input values
            document.getElementById('threshold').value = '';
            document.getElementById('subject').value = '';
            document.getElementById('count').value = '';
            
            // Show the selected input group
            document.getElementById(inputType + 'Group').style.display = 'block';
            
            // Set required attribute only for the visible input
            document.getElementById('threshold').required = (inputType === 'threshold');
            document.getElementById('subject').required = (inputType === 'subject');
            document.getElementById('count').required = (inputType === 'count');
        }
    </script>
</body>
</html>