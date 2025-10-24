<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="p1.LoanBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Loan Calculator Result</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <style>
    body {
      min-height: 100vh;
      background: linear-gradient(rgba(0, 0, 60, 0.6), rgba(0, 0, 80, 0.7)),
        url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80') center/cover no-repeat;
      display: flex;
      flex-direction: column;
      color: #fff;
      font-family: "Poppins", Arial, sans-serif;
    }

    nav {
      background-color: rgba(0, 128, 255, 0.9);
      padding: 1rem 2rem;
    }

    nav h1 {
      color: #fff;
      font-weight: 700;
      letter-spacing: 1px;
    }

    .card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(6px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: white;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.3);
      max-width: 480px;
      width: 100%;
    }

    .result-label {
      font-weight: 500;
      color: #e0e0e0;
    }

    .value {
      font-size: 1.1rem;
      color: #fff;
    }

    .chart-container {
      width: 300px;
      margin: 20px auto;
    }

    .btn-custom {
      border-radius: 8px;
      font-weight: 600;
      transition: 0.3s;
    }

    .btn-custom:hover {
      background-color: #0056b3 !important;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>

  <nav>
    <div class="container d-flex justify-content-between align-items-center">
      <h1>📊 Loan Result</h1>
      <a href="index.html" class="btn btn-light fw-bold">Start New</a>
    </div>
  </nav>

  <div class="d-flex justify-content-center align-items-center flex-grow-1">
    <div class="card p-4 text-center">

      <jsp:useBean id="loan" class="p1.LoanBean" scope="session" />

      <%
          if (session.getAttribute("loan") == null) {
      %>
          <h3 class="text-danger">Session expired or no data found!</h3>
      <%
          } else {
      %>
          <h3 class="mb-4">Loan Calculation Summary</h3>

          <div class="text-start">
            <p><span class="result-label">Amount:</span> <span class="value">&#8377; <jsp:getProperty name="loan" property="amount" /></span></p>
            <p><span class="result-label"> Rate:</span> <span class="value"><jsp:getProperty name="loan" property="rate" /> %</span></p>
            <p><span class="result-label"> Years:</span> <span class="value"><jsp:getProperty name="loan" property="years" /></span></p>
            <hr>
            <p><span class="result-label">Monthly EMI:</span> <span class="value text-info fw-bold">&#8377; <jsp:getProperty name="loan" property="emi" /></span></p>
            <p><span class="result-label"> Total Interest:</span> <span class="value text-warning fw-bold">&#8377; <jsp:getProperty name="loan" property="interest" /></span></p>
            <p><span class="result-label">Total Payable:</span> <span class="value text-success fw-bold">&#8377;<jsp:getProperty name="loan" property="totalPayable" /></span></p>
          </div>

          <div class="chart-container">
            <canvas id="loanChart"></canvas>
          </div>

          <a href="duration.jsp" class="btn btn-primary btn-lg mt-3 btn-custom">Recalculate</a>

          <script>
            const ctx = document.getElementById('loanChart').getContext('2d');
            const chart = new Chart(ctx, {
              type: 'doughnut',
              data: {
                labels: ['Principal', 'Interest'],
                datasets: [{
                  data: [
                    <jsp:getProperty name="loan" property="amount" />,
                    <jsp:getProperty name="loan" property="interest" />
                  ],
                  backgroundColor: ['#4CAF50', '#FF7043']
                }]
              },
              options: {
                plugins: {
                  legend: { position: 'bottom', labels: { color: '#fff' } }
                }
              }
            });
          </script>
      <%
          }
      %>
    </div>
  </div>

</body>
</html>
