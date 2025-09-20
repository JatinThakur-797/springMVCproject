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
    <title>Sign Up - NexusBank</title>
    <link rel="stylesheet" href="<c:url value = "/resources/css/style-auth.css" />">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="tab-manage.jsp"></jsp:include>
    <div class="auth-container">
        <div class="auth-promo">
             <a href="home" class="logo">
                    <img src="<c:url value = "/resources/images/logo.png"/>" alt="NexusBank Logo">
       
            </a>
            <h2>Join the Future of Banking Today.</h2>
            <img src="<c:url value = "/resources/images/bank.png"/>" alt="Digital banking illustration">
            <p>Simple, secure, and built for you.</p>
        </div>

        <div class="auth-form-container">
            <div class="auth-form">
                <h1>Create Your Account</h1>
                <p class="subtitle">Start your journey with NexusBank in just a few steps.</p>
                <form action="signup-submit" method="post">
                    <div class="form-group">
                        <label for="username">username</label>
                        <input type="text" id="username" name="username" placeholder="e.g. rohankumar123" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="you@example.com" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Create Password</label>
                        <input type="password" id="password" name="password" placeholder="Minimum 8 characters" required>
                    </div>
                     <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required>
                    </div>
                    <div class="alert alert-danger" role="alert">
 		 			<form:errors path="user.*" />
					</div>
                    <button type="submit" class="btn btn-primary">Create Account</button>
                </form>
                <div class="form-footer">
                    <p>Already have an account? <a href="login">Login</a></p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>