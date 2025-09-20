<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexusBank - Modern Banking for You</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
   
     <link rel="stylesheet" href="<c:url value = "/resources/css/style.css" />">
    
</head>
<body>
	<jsp:include page="tab-manage.jsp"></jsp:include>
	<jsp:include page="header.jsp" />

    <main>
        <section id="hero" class="hero">
            <div class="hero-content">
                <h1>The Future of Banking is Here.</h1>
                <p>Simple, secure, and seamless banking designed for your modern life. Join NexusBank today and take control of your finances.</p>
                <a href="<c:choose>
        
        <c:when test="${not empty sessionScope.loggedInUser}">
           create-account
        </c:when>
		 <c:otherwise>
           login
        </c:otherwise>
    </c:choose>" class="btn btn-primary">Open an Account</a>
            </div>
        </section>

        <section id="features" class="features">
            <div class="container">
                <div class="section-title">
                    <h2>Everything You Need, All in One Place</h2>
                    <p>We provide top-tier services to make your banking experience exceptional.</p>
                </div>
                <div class="features-grid">
                    <div class="feature-card">
                        <i class="fas fa-mobile-alt"></i>
                        <h3>Digital Banking</h3>
                        <p>Manage your account, transfer funds, and pay bills from anywhere with our award-winning mobile app.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-shield-halved"></i>
                        <h3>Secure Transactions</h3>
                        <p>With multi-layer security and fraud detection, your money is always safe with us.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-headset"></i>
                        <h3>24/7 Support</h3>
                        <p>Our dedicated support team is available around the clock to help you with any questions or concerns.</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="about" class="about">
            <div class="container about-container">
                <div class="about-image">
                   <img src= "<c:url value = "/resources/images/manUsingUpi.png"/>" alt="Customer using digital payment">    </div>
                <div class="about-content">
                    <h2>Designed for You, Inspired by Your Goals</h2>
                    <p>At NexusBank, we're more than just a bank; we're your financial partner. We leverage cutting-edge technology to offer personalized solutions that help you save, invest, and achieve your dreams faster.</p>
                    <ul>
                        <li><i class="fas fa-check-circle"></i> Competitive Interest Rates</li>
                        <li><i class="fas fa-check-circle"></i> No Hidden Fees</li>
                        <li><i class="fas fa-check-circle"></i> Quick Loan Approvals</li>
                    </ul>
                    <a href="#" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </section>
        
        <section class="cta">
            <div class="container">
                <h2>Ready to Join NexusBank?</h2>
                <p>It only takes 5 minutes to open an account and start your journey towards financial freedom.</p>
                <a href="#" class="btn btn-primary-light">Get Started Today</a>
            </div>
        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>