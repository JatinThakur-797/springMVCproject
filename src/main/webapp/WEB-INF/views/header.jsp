<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexusBank - Modern header for You</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

     <link rel="stylesheet" href="<c:url value = "/resources/css/style.css" />">
    <style>
    .header-profile-image {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #fff;
        vertical-align: middle;
        margin-right: 8px;
    }
    </style>
</head>
<body>
<jsp:include page="tab-manage.jsp"></jsp:include>
<c:if test="${not empty logoutSuccess}">
    <script type="text/javascript">
        alert("Logout Successful!");
    </script>
    <c:remove var="logoutSuccess" scope="session"/>
</c:if>

<header class="header">
    <div class="container">
        <a href="home" class="logo">
            <img src="<c:url value = "/resources/images/logo.png"/>" alt="NexusBank Logo">
        </a>
        <nav class="navbar">
            <ul>
                <li><a href="home">Home</a></li>
                <li><a href="#features">About us</a></li>
                <li><a href="<c:choose>
                    <%-- This block is shown ONLY if the user IS logged in --%>
                    <c:when test="${not empty sessionScope.loggedInUser}">
                        services
                    </c:when>
                    <%-- This block is shown ONLY if the user is NOT logged in --%>
                    <c:otherwise>
                        login
                    </c:otherwise>
                </c:choose>">Services</a></li>
                <li><a href="#footer">Contact us</a></li>
            </ul>
        </nav>

        <div class="login-signup">
            <c:choose>
                <%-- This block is shown ONLY if the user IS logged in --%>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <div class="btn btn-login">
                        <a href="account-success" class="btn-info">
                           <c:if test="${not empty sessionScope.userAccount.profileImageName}">
                                <img src="<c:url value='/resources/images/${sessionScope.userAccount.profileImageName}' />"
                                     alt="Profile" class="header-profile-image">
                           </c:if>
                           <span>Welcome, <b>${sessionScope.loggedInUser.username}</b>!</span>
                           Profile
                        </a>
                    </div>
                    <div class="btn btn-signup">
                        <a href="logout" class="btn-warning">Logout</a>
                    </div>
                </c:when>
                <%-- This block is shown ONLY if the user is NOT logged in --%>
                <c:otherwise>
                    <div class="btn btn-login">
                        <a href="login">Login</a>
                    </div>
                    <div class="btn btn-signup">
                        <a href="signup">Sign up</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>


</body>
</html>