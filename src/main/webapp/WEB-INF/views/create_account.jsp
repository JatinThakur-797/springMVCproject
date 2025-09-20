<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Open a New Account - NexusBank</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/style-create.css" />">
    
</head>
<body>
	<jsp:include page="tab-manage.jsp"></jsp:include>
	<c:if test="${not empty error}">
    <script type="text/javascript">
        alert("${error}");
    </script>
    </c:if>
    <div class="form-wizard-container">
        <h2>Create Your NexusBank Account</h2>
        <p>Follow the steps below to get started with your new account.</p>

        <div class="stepper-wrapper">
            <div class="stepper-item active">
                <div class="step-counter">1</div>
                <div class="step-name">Personal Details</div>
            </div>
            <div class="stepper-item">
                <div class="step-counter">2</div>
                <div class="step-name">Family and Account</div>
            </div>
            <div class="stepper-item">
                <div class="step-counter">3</div>
                <div class="step-name">Documentation</div>
            </div>
        </div>
             <div class="alert alert-danger" role="alert">
 		 			<form:errors path="newAccount.*" />
					</div>

        <form id="multiPhaseForm" action="create-account-submit" method="post" enctype="multipart/form-data">
            
            <div class="form-phase active" id="phase1">
                <h3><i class="fas fa-user-circle"></i> Personal Details</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" placeholder="e.g., Rohan" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" placeholder="e.g., Kumar" required>
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                     <div class="form-group">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gender" required>
                            <option value="" disabled selected>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="form-group full-width">
                        <label for="address.street">Street Address</label>
                        <input type="text" id="address.street" name="address.street" placeholder="House No, Street, Area" required>
                    </div>
                    <div class="form-group">
                        <label for="address.city">City / Town</label>
                        <input type="text" id="address.city" name="address.city" required>
                    </div>
                    <div class="form-group">
                        <label for="address.district">District</label>
                        <input type="text" id="address.district" name="address.district" required>
                    </div>
                     <div class="form-group">
                        <label for="address.state">State</label>
                        <input type="text" id="address.state" name="address.state" required>
                    </div>
                    <div class="form-group">
                        <label for="address.pincode">Pincode</label>
                        <input type="text" id="address.pincode" maxlength="6"  name="pincode" required>
                    </div>
                    <div class="form-group">
                        <label for="securityPin">Enter 4-Digit PIN:</label>
        <input type="password" id="securityPin" name="securityPin" inputmode="numeric"
            pattern="[0-9]{4}" maxlength="4" autocomplete="one-time-code" required placeholder="••••"> </div>
                    <div class="form-group">
                        <label for="phone">Mobile Number</label>
                        <input type="tel" id="phone" name="phone" maxlength="12"  placeholder="+91 XXXXX XXXXX" required>
                    </div>
                </div>
            </div>

            <div class="form-phase" id="phase2">
                <h3><i class="fas fa-users"></i> Family and Account Details</h3>
                 <div class="form-grid">
                    <div class="form-group">
                        <label for="fatherName">Father's Name</label>
                        <input type="text" id="fatherName" name="fatherName" placeholder="Full Name" required>
                    </div>
                    <div class="form-group">
                        <label for="motherName">Mother's Name</label>
                        <input type="text" id="motherName" name="motherName" placeholder="Full Name" required>
                    </div>
                     <div class="form-group">
                        <label for="maritalStatus">Marital Status</label>
                        <select id="maritalStatus" name="maritalStatus" required>
                            <option value="" disabled selected>Select Status</option>
                            <option value="single">Single</option>
                            <option value="married">Married</option>
                            <option value="divorced">Divorced</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="accountType">Account Type</label>
                        <select id="accountType" name="accountType" required>
                            <option value="" disabled selected>Select Account Type</option>
                            <option value="savings">Savings Account</option>
                            <option value="current">Current Account</option>
                            <option value="salary">Salary Account</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-phase" id="phase3">
                <h3><i class="fas fa-file-alt"></i> Documentation</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="panCard">PAN Card Number</label>
                        <input type="text" id="panCard" name="panCard"  maxlength="10"  placeholder="ABCDE1234F" required>
                    </div>
                    <div class="form-group">
                        <label for="aadhaarCard">Aadhaar Card Number</label>
                        <input type="text" id="aadhaarCard" name="aadhaarCard" placeholder="XXXX XXXX XXXX" 
       required
       maxlength="12" 
       pattern="\d{12}"
       title="Please enter a valid 12-digit Aadhaar number."
       inputmode="numeric"></div>
                </div>
                <div class = "form-group">
                <label for="profileImage">Upload Profile Image</label>
                <input type = "file" id = "profileImage" name = "profileImage" required />
                </div>
                <div class = "form-group">
                <label for="signatureImage">Upload Signature Image</label>
                <input type = "file" id = "signatureImage" name = "signatureImage" required />
                </div>
            </div>

            <div class="form-navigation">
                <button type="button" class="btn btn-secondary" id="prevBtn">Previous</button>
                <button type="button" class="btn btn-primary" id="nextBtn">Next</button>
                <button type="submit" class="btn btn-primary" id="submitBtn">Submit Application</button>
            </div>
        </form>
    </div>

    <script src="<c:url value="/resources/js/script.js" />"></script>
</body>
</html>