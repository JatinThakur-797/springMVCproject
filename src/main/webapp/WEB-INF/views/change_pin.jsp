<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change PIN - NexusBank</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style-form.css'/>">
    <%-- Other head elements like fonts and icons --%>
</head>
<body>
		<jsp:include page="tab-manage.jsp"></jsp:include>
      <jsp:include page="header.jsp" />
    <main>
        <div class="form-page-container">
            <div class="form-wrapper">
                <div class="form-header">
                    <i class="fas fa-key icon"></i>
                    <h1>Change Security PIN</h1>
                    <p>Enter your old and new PIN to update your account security.</p>
                     <c:if test="${param.error != null}">
                        <p class="message error">${error}</p>
                    </c:if>
                </div>
                
                <form action="change-pin-submit" method="POST">
                    <div class="form-group">
                        <label for="oldPin">Previous PIN</label>
                        <input type="password" id="oldPin" name="oldPin" placeholder="Enter your current 4-digit PIN" maxlength="4" required>
                    </div>

                    <div class="form-group">
                        <label for="newPin">New PIN</label>
                        <input type="password" id="newPin" name="newPin" placeholder="Enter your new 4-digit PIN" maxlength="4" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update PIN</button>
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