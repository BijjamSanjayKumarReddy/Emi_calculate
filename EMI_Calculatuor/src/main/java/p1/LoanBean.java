package p1;

import java.io.Serializable;

public class LoanBean implements Serializable {
    private double amount;
    private double rate;
    private int years;
    private double emi;
    private double interest;
    private double totalPayable;

    // Getters and Setters
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public double getRate() { return rate; }
    public void setRate(double rate) { this.rate = rate; }

    public int getYears() { return years; }
    public void setYears(int years) { this.years = years; }

    public double getEmi() { return emi; }
    public double getInterest() { return interest; }
    public double getTotalPayable() { return totalPayable; }

    // Business Logic
    public void calculateEMI() {
        double monthlyRate = rate / (12 * 100);
        int months = years * 12;

        emi = (amount * monthlyRate * Math.pow(1 + monthlyRate, months)) /
              (Math.pow(1 + monthlyRate, months) - 1);

        totalPayable = emi * months;
        interest = totalPayable - amount;
    }
}
