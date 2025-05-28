<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Mark Management System</title>
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
        
        /* Results section */
        .results-section {
            flex: 2;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
        }
        
        .results-section h3 {
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
        
        /* Report header */
        .report-header {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }
        
        .report-header h4 {
            color: #2196F3;
            margin-bottom: 10px;
        }
        
        .report-actions {
            display: flex;
            gap: 10px;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .report-date {
            color: #666;
            font-size: 0.9em;
        }
        
        /* Statistics cards */
        .stats-container {
            background: linear-gradient(135deg, #2196F3 0%, #1976D2 100%);
            color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
        }
        
        .stats-item {
            text-align: center;
        }
        
        .stats-number {
            font-size: 2rem;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        
        .stats-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        /* Table styling */
        .table-container {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #ddd;
        }
        
        .table-header {
            background-color: #2196F3;
            color: white;
            padding: 15px;
            font-weight: bold;
        }
        
        .table-responsive {
            overflow-x: auto;
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 0;
        }
        
        .table th {
            background-color: #2196F3;
            color: white;
            padding: 12px;
            text-align: left;
            border: none;
            font-weight: bold;
        }
        
        .table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        
        .table tbody tr:hover {
            background-color: #f9f9f9;
        }
        
        .table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        /* Badge styling */
        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.85em;
            font-weight: bold;
            text-align: center;
            color: white;
        }
        
        .badge-primary {
            background-color: #2196F3;
        }
        
        .badge-success {
            background-color: #28a745;
        }
        
        .badge-warning {
            background-color: #ffc107;
            color: #333;
        }
        
        .badge-danger {
            background-color: #dc3545;
        }
        
        .badge-rank {
            background-color: #ff9800;
            color: white;
        }
        
        /* Button styling */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
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
        
        .btn-outline {
            background-color: transparent;
            border: 2px solid #2196F3;
            color: #2196F3;
        }
        
        .btn-outline:hover {
            background-color: #2196F3;
            color: white;
        }
        
        /* Empty state styling */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #666;
        }
        
        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 20px;
            display: block;
        }
        
        .empty-state h4 {
            color: #2196F3;
            margin-bottom: 10px;
        }
        
        .empty-state p {
            margin-bottom: 20px;
        }
        
        /* Print styles */
        @media print {
            .no-print {
                display: none !important;
            }
            
            .sidebar {
                display: none !important;
            }
            
            .main-content {
                flex-direction: column;
            }
            
            .results-section {
                flex: none;
            }
            
            body {
                background-color: white;
                padding: 0;
            }
            
            .header {
                background-color: #2196F3 !important;
                -webkit-print-color-adjust: exact;
                color-adjust: exact;
            }
        }
        
       
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>Report Results</h1>
            <p>Detailed analysis of student performance data</p>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <!-- Navigation Sidebar -->
            <div class="sidebar no-print">
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
            
            <!-- Results Section -->
            <div class="results-section">
                <!-- Display error messages if any -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger no-print">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <%
                    String reportTitle = (String) request.getAttribute("reportTitle");
                    List<StudentMark> reportResults = (List<StudentMark>) request.getAttribute("reportResults");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    
                    if (reportResults != null && !reportResults.isEmpty()) {
                        // Calculate statistics
                        double totalMarks = 0;
                        int maxMarks = Integer.MIN_VALUE;
                        int minMarks = Integer.MAX_VALUE;
                        
                        for (StudentMark mark : reportResults) {
                            totalMarks += mark.getMarks();
                            maxMarks = Math.max(maxMarks, mark.getMarks());
                            minMarks = Math.min(minMarks, mark.getMarks());
                        }
                        
                        double averageMarks = totalMarks / reportResults.size();
                %>
                
                <h3><%= reportTitle != null ? reportTitle : "Report Results" %></h3>
                
                <!-- Report Header -->
                <div class="report-header">
                    <div class="report-actions">
                        <div class="report-date">Generated on: <%= new java.util.Date() %></div>
                        <div class="no-print">
                            <button onclick="window.print()" class="btn btn-outline">🖨️ Print Report</button>
                            <a href="report_form.jsp" class="btn btn-secondary">🔙 New Report</a>
                        </div>
                    </div>
                </div>
                
                <!-- Statistics -->
                <div class="stats-container">
                    <div class="stats-grid">
                        <div class="stats-item">
                            <span class="stats-number"><%= reportResults.size() %></span>
                            <span class="stats-label">Total Students</span>
                        </div>
                        <div class="stats-item">
                            <span class="stats-number"><%= String.format("%.1f", averageMarks) %></span>
                            <span class="stats-label">Average Marks</span>
                        </div>
                        <div class="stats-item">
                            <span class="stats-number"><%= maxMarks %></span>
                            <span class="stats-label">Highest Marks</span>
                        </div>
                        <div class="stats-item">
                            <span class="stats-number"><%= minMarks %></span>
                            <span class="stats-label">Lowest Marks</span>
                        </div>
                    </div>
                </div>
                
                <!-- Results Table -->
                <div class="table-container">
                    <div class="table-header">
                        Detailed Results
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                    <th>Exam Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                int rank = 1;
                                for (StudentMark mark : reportResults) { %>
                                <tr>
                                    <td>
                                        <% if (rank <= 3) { %>
                                            <span class="badge badge-rank">🏆 <%= rank %></span>
                                        <% } else { %>
                                            <%= rank %>
                                        <% } %>
                                    </td>
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
                                </tr>
                                <% 
                                    rank++;
                                } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <% } else if (reportResults != null) { %>
                
                <!-- No Results Found -->
                <h3><%= reportTitle != null ? reportTitle : "Report Results" %></h3>
                <div class="empty-state">
                    <span class="empty-state-icon">📊</span>
                    <h4>No Results Found</h4>
                    <p>No student records match the specified criteria.</p>
                    <a href="report_form.jsp" class="btn btn-primary">Generate New Report</a>
                </div>
                
                <% } else { %>
                
                <!-- Default view - no report generated -->
                <h3>Report Results</h3>
                <div class="empty-state">
                    <span class="empty-state-icon">📈</span>
                    <h4>No Report Generated</h4>
                    <p>Please generate a report first to see the results.</p>
                    <a href="report_form.jsp" class="btn btn-primary">Generate Report</a>
                </div>
                
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>