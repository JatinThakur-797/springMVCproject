<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bank Details - NexusBank</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>

/* ======== BANK DETAILS PAGE STYLES ======== */

.details-section {
    padding: 5rem 0;
    background-color: var(--background-light);
}

.details-wrapper {
    background-color: var(--background-white);
    border-radius: 12px;
    box-shadow: 0 4px D20px rgba(0,0,0,0.05);
    padding: 2rem 3rem;
    max-width: 800px;
    margin: 0 auto;
}

.details-header {
	
    text-align: center;
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1.5rem;
    margin-bottom: 2rem;
}
.details-header i {
    font-size: 3rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}
.details-header h2 {
    color: var(--secondary-color);
}

.details-list dt {
    color: var(--text-secondary);
    font-weight: 600;
    margin-top: 1.5rem;
    font-size: 0.9rem;
}

.details-list dd {
    color: var(--text-primary);
    font-size: 1.1rem;
    margin-left: 0;
    padding-bottom: 1.5rem;
    border-bottom: 1px solid var(--border-color);
}

.details-list dd:last-of-type {
    border-bottom: none;
}

.details-footer {
    text-align: center;
    margin-top: 2rem;
}
</style>
</head>
<body>
		<jsp:include page="tab-manage.jsp"></jsp:include>
      <jsp:include page="header.jsp" />
		
    <main>
      

        <section class="details-section">
            <div class="container">
                <div class="details-wrapper">
                    <div class="details-header">
                        <i class="fas fa-university"></i>
                        <h2>NexusBank Information</h2>
                    </div>
                   
                    <section class="page-header ">
            <div class="container">
                <h1>Our Bank Details</h1>
                <p>Information for all your banking needs.</p>
            </div>
        </section>
        <br>
                    <dl class="details-list">
                        <dt>Bank Name</dt>
                        <dd>${bankInfo.bankName}</dd>

                        <dt>IFSC Code</dt>
                        <dd>${bankInfo.ifscCode}</dd>

                        <dt>Branch Address</dt>
                        <dd>${bankInfo.bankBranchCode}</dd>

                        <dt>Branch Name</dt>
                        <dd>${bankInfo.bankBranchName}</dd>
                        
                        <dt>Branch Address</dt>
                        <dd>${bankInfo.bankBranchAddress}</dd>
                        
                        <dt>Customer Care Phone</dt>
                        <dd>${bankInfo.customerCarePhone}</dd>
                        
                        <dt>Customer Care Email</dt>
                        <dd>${bankInfo.customerCareEmail}</dd>
                    </dl>
                    <div class="details-footer">
                        <a href="<c:url value='/services'/>" class="btn btn-secondary">&larr; Back to Services</a>
                    </div>
                </div>
            </div>
        </section>
    </main>

   <jsp:include page="footer.jsp" />
</body>
</html>