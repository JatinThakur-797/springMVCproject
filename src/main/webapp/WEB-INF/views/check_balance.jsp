<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Balance - NexusBank</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
     <link rel="stylesheet" href="<c:url value = "/resources/css/style-deposite.css" />">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style-form.css'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
	<jsp:include page="tab-manage.jsp"></jsp:include>
   <jsp:include page="header.jsp" />

    <c:if test="${showPopup}">
        <div class="modal-overlay active" id="balanceModal">
            <div class="modal-mobile-screen">
                <div class="modal-header m">
                    <img src="<c:url value='/resources/images/logo.png'/>" alt="Logo"/>
                    
                </div>
                <div class="modal-content m">
                    <i class="fas fa-wallet"></i>
                    <h3>Your Available Balance</h3>
                    <h2>
                        <fmt:setLocale value="en_IN"/>
                        ₹ <fmt:formatNumber value="${currentBalance}" type="currency" currencySymbol="" maxFractionDigits="2"/>
                    </h2>
                </div>
                <div class="modal-footer m">
                    <a href="<c:url value='/check-balance'/>" class="btn btn-secondary">Close</a>
                </div>
            </div>
        </div>
    </c:if>

    <main>
        <div class="form-page-container">
            <div class="form-wrapper">
                <div class="form-header">
                    <i class="fas fa-search-dollar icon"></i>
                    <h1>Check Account Balance</h1>
                    <p>Enter your 4-digit security PIN to view your balance.</p>
                    <c:if test="${not empty error}">
                        <p class="message error">${error}</p>
                    </c:if>
                </div>
                
                <form action="check-balance-submit" method="POST">
                    <div class="form-group">
                        <label for="securityPin">Security PIN</label>
                        <input type="password" id="securityPin" name="securityPin" placeholder="••••" maxlength="4" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

                <div class="form-footer-link">
                    <a href="<c:url value='/services'/>">&larr; Back to Services</a>
                </div>
            </div>
        </div>
    </main>

     <jsp:include page="footer.jsp" />
</body>
</html>