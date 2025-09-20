<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw Cash - NexusBank</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="<c:url value='/resources/css/style-form.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
     <link rel="stylesheet" href="<c:url value = "/resources/css/style-deposite.css" />">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
<jsp:include page="tab-manage.jsp"></jsp:include>
<jsp:include page="header.jsp" />
     <c:if test="${showWithdrawSuccessPopup}">
    <div class="modal-overlay active" id="withdrawSuccessModal">
        <%-- The white box that contains everything --%>
        <div class="modal-content">

            <%-- The header, body, and footer MUST be INSIDE modal-content --%>
            <div class="modal-header">
                <h2>Transaction Successful</h2>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>

            <div class="modal-body" style="text-align: center;">
                <i class="fas fa-check-circle" style="font-size: 4rem; color: #00C49A; margin-bottom: 1rem;"></i>
                <h3>Withdrawal Successful!</h3>
                <p>You have successfully withdrawn</p>
                <h2 style="font-size: 2.5rem; color: var(--secondary-color);">
                    <fmt:setLocale value="en_IN"/>
                    ₹ <fmt:formatNumber value="${withdrawnAmount}" type="currency" currencySymbol="" maxFractionDigits="2"/>
                </h2>
            </div>

            <div class="modal-footer">
                <a href="<c:url value='/services'/>" class="btn btn-primary">Done</a>
            </div>

        </div> <%-- End of modal-content --%>
    </div>
</c:if>
    
    <main>
        <div class="form-page-container">
            <div class="form-wrapper">
                <div class="form-header">
                    <i class="fas fa-hand-holding-dollar icon"></i>
                    <h1>Withdraw Cash</h1>
                    <p>Enter amount and PIN to withdraw funds from your account.</p>
                     <c:if test="${not empty error}">
                        <p class="message error">${error}</p>
                    </c:if>
                </div>
                
                <form action="withdraw-submit" method="POST">
                    <div class="form-group">
                        <label for="amount">Amount to Withdraw (₹)</label>
                        <input type="number" id="amount" name="amount" placeholder="e.g., 2000" min="1" step="0.01" required>
                    </div>

                    <div class="form-group">
                        <label for="securityPin">4-Digit Security PIN</label>
                        <input type="password" id="securityPin" name="securityPin" placeholder="••••" maxlength="4" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Withdraw Now</button>
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