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
    <title>Login - NexusBank</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value = "/resources/css/style-auth.css" />">
</head>
<body>
	<jsp:include page="tab-manage.jsp"></jsp:include>
    <div class="auth-container">
        <div class="auth-promo">
            <a href="home" class="logo">
                    <img src="<c:url value = "/resources/images/logo.png"/>" alt="NexusBank Logo">
       
            </a>
            <h2>Welcome Back to the Future of Banking.</h2>
            <img src="<c:url value = "/resources/images/bank.png"/>" alt="Digital banking illustration">
            <p>Secure, seamless, and always by your side.</p>
        </div>

        <div class="auth-form-container">
            <div class="auth-form">
                <h1>Member Login</h1>
                <p class="subtitle">Enter your details to access your account.</p>
                <form action="login-submit" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="e.g. rohankumar123" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="••••••••" required>
                    </div>
                        <c:if test="${param.error != null}">
                <div class="alert alert-danger" role="alert">
                    Invalid username or password. Please try again.
                </div>
            </c:if>
                    <div class="form-options">
                        <a href="#" class="forgot-password">Forgot Password?</a>
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <div class="form-footer">
                    <p>Don't have an account? <a href="signup">Sign Up Now</a></p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>