<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String amount = request.getParameter("amount");
    String rate = request.getParameter("rate");

    if (amount != null && rate != null) {
        session.setAttribute("amount", amount);
        session.setAttribute("rate", rate);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Loan Duration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      min-height: 100vh;
      background: linear-gradient(rgba(0, 0, 60, 0.6), rgba(0, 0, 80, 0.7)),
        url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80') center/cover no-repeat;
      display: flex;
      flex-direction: column;
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
      max-width: 420px;
      width: 100%;
    }

    input[type="text"] {
      background: rgba(255, 255, 255, 0.85);
      border: none;
      border-radius: 8px;
    }

    button {
      width: 100%;
      border-radius: 8px;
      font-weight: 600;
      transition: 0.3s;
    }

    button:hover {
      background-color: #0056b3 !important;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>

  <nav>
    <div class="container d-flex justify-content-between align-items-center">
      <h1>📆 Loan Duration</h1>
      <a href="index.html" class="btn btn-light fw-bold">Back</a>
    </div>
  </nav>

  <div class="d-flex justify-content-center align-items-center flex-grow-1">
    <div class="card p-4">
      <h3 class="text-center mb-4">Enter Loan Duration</h3>

      <form action="LoanServlet" method="post">
        <div class="mb-3">
          <label for="years" class="form-label">Duration (Years)</label>
          <input type="text" id="years" name="years" class="form-control" placeholder="e.g., 5" required>
        </div>

        <!-- Hidden values from previous page -->
        <input type="hidden" name="amount" value="<%= session.getAttribute("amount") %>">
        <input type="hidden" name="rate" value="<%= session.getAttribute("rate") %>">

        <button type="submit" class="btn btn-primary btn-lg mt-2">Calculate EMI</button>
      </form>
    </div>
  </div>

</body>
</html>
