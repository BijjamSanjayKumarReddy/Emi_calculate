package p1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoanServlet")
public class LoanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		PrintWriter out=response.getWriter();

        String amountStr = request.getParameter("amount");
        String rateStr = request.getParameter("rate");
        String yearsStr = request.getParameter("years");


            double amount = Double.parseDouble(amountStr);
            double rate = Double.parseDouble(rateStr);
            int years = Integer.parseInt(yearsStr);

            LoanBean loan = new LoanBean();
            loan.setAmount(amount);
            loan.setRate(rate);
            loan.setYears(years);
            loan.calculateEMI();

            HttpSession session = request.getSession();
            session.setAttribute("loan", loan);

            RequestDispatcher rd = request. getRequestDispatcher("result.jsp");
        	rd.forward(request, response);
    }
}
