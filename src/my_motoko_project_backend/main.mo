//Please read the comments for better understanding


import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Float "mo:base/Float";

actor SalaryCalculator {
    // Fixed values for Variables
    let socialSecTax : Float = 0.06;
    let constituencyTax : Float = 0.03;
    let welfareTax : Float = 0.02;
    let additionalTax : Float = socialSecTax + constituencyTax + welfareTax;
    let regularPay : Float = 25000.0;
    let overtimeRate : Float = 1.5 * regularPay;

    // Function to calculate salary
    public func calculateSalary(time : Int, dependants : Int) : async Text {
        var overtime : Float = 0.0;
        var overtimePay : Float = 0.0;
        var grossPay : Float = 0.0;
        var deductions : Float = 0.0;
        var netPay : Float = 0.0;
        var numOfDependants : Int = 0;
        var dependantsIncome : Float = 0.0;
        var nationalTax : Float = 0.0;
        var totalTaxes : Float = 0.0;

        // Check work time
        if (time < 40) {
            Debug.print("\nThe work time is not due");
            grossPay := 0.0;
        } else if (time == 40) {
            grossPay := regularPay;
        } else {
            overtime := Float.fromInt(time - 40);
            overtimePay := overtime * overtimeRate;
            grossPay := regularPay + overtimePay;
        };

        Debug.print("\nThe grossPay is " # Float.toText(grossPay) # " cedis");

        // Calculate national tax based on grossPay
        if (grossPay > 5000000.0) {
            nationalTax := 0.3;
        } else if (grossPay >= 2750001.0) {
            nationalTax := 0.2;
        } else if (grossPay >= 1750001.0) {
            nationalTax := 0.15;
        } else if (grossPay >= 250001.0) {
            nationalTax := 0.1;
        } else if (grossPay >= 125001.0) {
            nationalTax := 0.05;
        } else if (grossPay == 0.0) {
            nationalTax := 0.0;
            Debug.print("Sorry, worker can't be paid");
        } else {
            nationalTax := 0.0;
        };

        totalTaxes := nationalTax + additionalTax;
        deductions := totalTaxes * grossPay;

        Debug.print("\nAnd the deduction is " # Float.toText(deductions) # " cedis");

        // Calculate netPay based on dependants
        if (dependants > 3) {
            numOfDependants := dependants - 3;
            dependantsIncome := Float.fromInt(numOfDependants) * 5000.0;
            netPay := grossPay - deductions + dependantsIncome;
        } else if (dependants == 0) {
            Debug.print("Worker has no dependants");
        } else if (dependants < 0) {
            Debug.print("Dependants can't be negative");
        } else {
            netPay := grossPay - deductions;
        };

        // Check not to pay unserious workers
        if (time < 40) {
            netPay := 0.0;
        };

        Debug.print("\nTherefore the total NetPay is " # Float.toText(netPay) # " cedis");

        return "The Netpay for the worker has been checked";
    };
};