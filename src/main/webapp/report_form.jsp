<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - Mark Management System</title>
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
        .report-option {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .report-option:hover {
            border-color: #3498db;
            background-color: #f8f9fa;
        }
        .report-option.selected {
            border-color: #3498db;
            background-color: #e3f2fd;
        }
        .report-icon {
            font-size: 24px;
            margin-bottom: 10px;
            display: block;
        }
        #criteriaContainer {
            display: none;
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
                                <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="report_form.jsp">Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header">
                        Generate Reports
                    </div>
                    <div class="card-body">
                        <form action="ReportServlet" method="post" id="reportForm">
                            <div class="mb-4">
                                <h5>Select Report Type</h5>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="report-option" data-report="aboveThreshold">
                                            <span class="report-icon">📊</span>
                                            <h6>Students Above Threshold</h6>
                                            <p class="text-muted small">Find students with marks above a specified value</p>
                                            <input type="radio" name="reportType" value="aboveThreshold" class="d-none">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="report-option" data-report="bySubject">
                                            <span class="report-icon">📚</span>
                                            <h6>Students by Subject</h6>
                                            <p class="text-muted small">View all students who took a specific subject</p>
                                            <input type="radio" name="reportType" value="bySubject" class="d-none">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="report-option" data-report="topStudents">
                                            <span class="report-icon">🏆</span>
                                            <h6>Top Students</h6>
                                            <p class="text-muted small">Display top N students based on their marks</p>
                                            <input type="radio" name="reportType" value="topStudents" class="d-none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Dynamic criteria container -->
                            <div id="criteriaContainer" class="mb-4">
                                <div class="card">
                                    <div class="card-header bg-info text-white">
                                        Report Criteria
                                    </div>
                                    <div class="card-body" id="criteriaContent">
                                        <!-- Dynamic content will be loaded here -->
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" id="generateBtn" disabled>Generate Report</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- Instructions Card -->
                <div class="card">
                    <div class="card-header bg-secondary text-white">
                        Instructions
                    </div>
                    <div class="card-body">
                        <h6>Report Types:</h6>
                        <ul class="mb-3">
                            <li><strong>Students Above Threshold:</strong> Enter a minimum marks value to find all students who scored above that threshold.</li>
                            <li><strong>Students by Subject:</strong> Select a subject to view all students who took that subject.</li>
                            <li><strong>Top Students:</strong> Enter the number of top-performing students you want to display.</li>
                        </ul>
                        <div class="alert alert-info">
                            <strong>Note:</strong> Select a report type above to see the specific criteria options for that report.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Report form script -->
    <script>
        // Handle report option selection
        document.querySelectorAll('.report-option').forEach(option => {
            option.addEventListener('click', function() {
                // Remove selected class from all options
                document.querySelectorAll('.report-option').forEach(opt => {
                    opt.classList.remove('selected');
                });
                
                // Add selected class to clicked option
                this.classList.add('selected');
                
                // Check the corresponding radio button
                const radio = this.querySelector('input[type="radio"]');
                radio.checked = true;
                
                // Show criteria container and load appropriate content
                const reportType = this.dataset.report;
                showCriteriaFor(reportType);
                
                // Enable generate button
                document.getElementById('generateBtn').disabled = false;
            });
        });
        
        function showCriteriaFor(reportType) {
            const criteriaContainer = document.getElementById('criteriaContainer');
            const criteriaContent = document.getElementById('criteriaContent');
            
            criteriaContainer.style.display = 'block';
            
            let content = '';
            
            switch(reportType) {
                case 'aboveThreshold':
                    content = `
                        <div class="mb-3">
                            <label for="threshold" class="form-label">Minimum Marks Threshold</label>
                            <input type="number" class="form-control" id="threshold" name="threshold" 
                                   min="0" max="100" placeholder="Enter minimum marks (0-100)" required>
                            <div class="form-text">Students with marks equal to or above this value will be included in the report.</div>
                        </div>
                    `;
                    break;
                    
                case 'bySubject':
                    content = `
                        <div class="mb-3">
                            <label for="subject" class="form-label">Select Subject</label>
                            <select class="form-select" id="subject" name="subject" required>
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
                            <div class="form-text">All students who took the selected subject will be included in the report.</div>
                        </div>
                    `;
                    break;
                    
                case 'topStudents':
                    content = `
                        <div class="mb-3">
                            <label for="count" class="form-label">Number of Top Students</label>
                            <input type="number" class="form-control" id="count" name="count" 
                                   min="1" max="100" placeholder="Enter number of students" required>
                            <div class="form-text">The top performers based on marks will be displayed in descending order.</div>
                        </div>
                    `;
                    break;
            }
            
            criteriaContent.innerHTML = content;
        }
    </script>
</body>
</html>