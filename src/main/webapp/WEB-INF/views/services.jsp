<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - NexusBank</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="<c:url value = "/resources/css/style.css" />">
    <link rel="stylesheet" href="<c:url value = "/resources/css/style-services.css" />">
</head>

<body>
<jsp:include page="tab-manage.jsp"></jsp:include>
	<c:if test="${not empty accountExistsError}">
    <script type="text/javascript">
        alert("${accountExistsError}");
    </script>
</c:if>
	<c:if test="${not empty changePinSuccess}">
    <script type="text/javascript">
        alert("Change Pin Successfull");
    </script>
</c:if>
    <jsp:include page="header.jsp" />

    <main>
        <section class="page-header">
            <div class="container">
                <h1>Account Services</h1>
                <p>All your banking needs, right at your fingertips.</p>
            </div>
        </section>

        <section class="services-dashboard">
            <div class="container">
                <div class="services-grid">
                    <div class="service-card">
                        <i class="fas fa-user-plus"></i>
                        <h3>Create Account</h3>
                        <p>New to NexusBank? Open your digital account in minutes and start banking smarter.</p>
                        <a href="create-account" class="service-action">Get Started &rarr;</a>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-wallet"></i>
                        <h3>Check Balance</h3>
                        <p>View your current account balance and recent transactions instantly.</p>
                        <a href="check-balance" class="service-action">View Now &rarr;</a>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-money-bill-wave"></i>
                        <h3>Deposit Money</h3>
                        <p>Add funds to your account easily through various methods.</p>
                        <a href="deposite" class="service-action">Make Deposit &rarr;</a>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-hand-holding-dollar"></i>
                        <h3>Withdraw Money</h3>
                        <p>Access your cash from ATMs or schedule a branch pickup.</p>
                        <a href="withdraw" class="service-action">Withdraw &rarr;</a>
                    </div>
                    
                    <div class="service-card">
                        <i class="fas fa-user-circle"></i>
                        <h3>View Profile</h3>
                        <p>Check and update your personal information and contact details.</p>
                        <a href="account-success" class="service-action">My Profile &rarr;</a>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-key"></i>
                        <h3>Change Pin</h3>
                        <p>Keep your account secure by regularly updating your pin.</p>
                        <a href="change-pin" class="service-action">Update Now &rarr;</a>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-university"></i>
                        <h3>Bank Details</h3>
                        <p>View your account number, IFSC code, and other bank details.</p>
                        <a href="bank-details" class="service-action">View Details &rarr;</a>
                    </div>
                    <div class="service-card logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <h3>Logout</h3>
                        <p>Securely sign out of your NexusBank account.</p>
                        <a href="logout" class="service-action">Logout &rarr;</a>
                    </div>
                </div>
            </div>
        </section>


        <section class="services-cta hidden-for-demo">
            <div class="container">
                <h2>Create an Account to Access Our Services</h2>
                <p>Join NexusBank to enjoy a world of seamless, secure, and modern banking services. It only takes a few
                    minutes to get started.</p>
                <div class="cta-buttons">
                    <a href="signup" class="btn btn-primary">Create Account</a>
                    <a href="login" class="btn btn-secondary">I Already Have an Account</a>
                </div>
            </div>
        </section>


    </main>

    <jsp:include page="footer.jsp" />

</body>

</html>