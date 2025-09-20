<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="tab-manage.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Created Successfully</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            border: 1px solid #e6e9f0;
        }

        .header {
            text-align: center;
            border-bottom: 1px solid #e6e9f0;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #2c3e50;
            font-size: 28px;
            margin: 0;
            font-weight: 600;
        }

        .header .success-icon {
            font-size: 40px;
            color: #27ae60;
        }
        
        .header p {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
        }

        .details-table {
            width: 100%;
            border-collapse: collapse;
        }

        .details-table td {
            padding: 15px 10px;
            border-bottom: 1px solid #f0f2f5;
            font-size: 15px;
        }

        .details-table tr:last-child td {
            border-bottom: none;
        }

        .details-table .label {
            font-weight: 600;
            color: #34495e;
            width: 35%;
        }

        .details-table .value {
            color: #555;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: #2980b9;
            margin-top: 30px;
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 2px solid #2980b9;
        }

        .footer-actions {
            text-align: center;
            margin-top: 40px;
        }

        .btn {
            display: inline-block;
            background-color: #3498db;
            color: #ffffff;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }
        
        .user-image {
            max-width: 320px; /* Set a max-width for responsiveness */
            height: 160px;     /* Maintain aspect ratio */
            border-radius: 8px;
            border: 2px solid #e6e9f0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            margin-top: 5px;
        }
    </style>
</head>
<body>
	
    <div class="container">
        <div class="header">
            <div class="success-icon">&#10004;</div>
            <h1>Account Creation Successful!</h1>
            <p>Welcome! Your new account has been created. Please review your details below.</p>
        </div>

        <c:if test="${not empty sessionScope.userAccount}">
        
            <div class="section-title">Account Holder Details</div>
            <table class="details-table">
                <tr>
                    <td class="label">Full Name</td>
                    <td class="value">${sessionScope.userAccount.firstName} ${sessionScope.userAccount.lastName}</td>
                </tr>
                <tr>
                    <td class="label">Date of Birth</td>
                   <td class="value">
                       
                        <fmt:formatDate value="${sessionScope.userAccount.dob}" pattern="dd MMMM yyyy" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Father's Name</td>
                    <td class="value">${sessionScope.userAccount.fatherName}</td>
                </tr>
                <tr>
                    <td class="label">Mother's Name</td>
                    <td class="value">${sessionScope.userAccount.motherName}</td>
                </tr>
                 <tr>
                    <td class="label">Contact Phone</td>
                    <td class="value">${sessionScope.userAccount.phone}</td>
                </tr>
            </table>

            <div class="section-title">Account Information</div>
            <table class="details-table">
                <tr>
                    <td class="label">Account Number</td>
                    <td class="value">${sessionScope.userAccount.accountNumber}</td>
                </tr>
                <tr>
                    <td class="label">Account Type</td>
                    <td class="value">${sessionScope.userAccount.accountType}</td>
                </tr>
                <tr>
                    <td class="label">Creation Date</td>
                    <td class="value">
                       <fmt:formatDate value="${sessionScope.userAccount.accountCreationDateTimeAsDate}" pattern="dd MMMM yyyy" /> </td>
                </tr>
                <tr>
                    <td class="label">PAN Card</td>
                    <td class="value">${sessionScope.userAccount.panCard}</td>
                </tr>
                <tr>
                    <td class="label">Aadhaar Number</td>
                    <td class="value">${sessionScope.userAccount.aadhaarCard}</td>
                </tr>
                <tr>
                    <td class="label">Registered Address</td>
                    <td class="value">
                        ${sessionScope.userAccount.address.street}, ${sessionScope.userAccount.address.city}, 
                        ${sessionScope.userAccount.address.district}, ${sessionScope.userAccount.address.state} - 
                        ${sessionScope.userAccount.address.pincode}
                    </td>
            
                </tr>
    <tr>
    <td class="label">Profile Image</td>
    <td class="value">
        <c:if test="${not empty sessionScope.userAccount.profileImageName}">
            <img src= "<c:url value = "/resources/images/${sessionScope.userAccount.profileImageName}"/>" 
                 alt="Profile Image" class="user-image">
        	<p>${sessionScope.userAccount.profileImageName}</p>
        </c:if>
        <c:if test="${empty sessionScope.userAccount.profileImageName}">
            <span>Not Provided</span>
        </c:if>
    </td>
</tr>
<tr>
    <td class="label">Signature Image</td>
    <td class="value">
        <c:if test="${not empty sessionScope.userAccount.signatureImageName}">
            <img src="<c:url value='/resources/images/${sessionScope.userAccount.signatureImageName}' />" 
                 alt="Signature Image" class="user-image">
                 <p>${sessionScope.userAccount.signatureImageName}</p>
        </c:if>
        <c:if test="${empty sessionScope.userAccount.signatureImageName}">
            <span>Not Provided</span>
        </c:if>
    </td>
</tr>
</table>
</c:if>


        <div class="footer-actions">
            <a href="${pageContext.request.contextPath}/services" class="btn">Back to Services</a>
        </div>
    </div>

</body>
</html>