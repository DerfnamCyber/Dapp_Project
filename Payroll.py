while True:
    print("\nThe work time must be greater or equal to 40")

    #accept input for time worked
    time = int(input("Enter the time worked in hours :"))

    #accept input for dependants
    dependants = int(input("\nEnter the number of dependants :"))

    #Declared Variables
    overtime = None
    overtimePay = None
    grossPay = None
    deductions = None
    netPay = 0
    numOfDependants = None
    dependantsIncome = None
    nationalTax = None
    totalTaxes = None

    #Fixed values for Variables
    socialSecTax, constituencyTax, welfareTax = 0.06, 0.03, 0.02
    additionalTax = socialSecTax + constituencyTax + welfareTax
    regularPay = 25000
    overtimeRate = 1.5 * regularPay


    #Calculating the GROSSPAY
    if time > 40:
        overtime = time - 40
        overtimePay = overtime * overtimeRate
        grossPay = regularPay + overtimePay
    elif time == 40:
        grossPay = regularPay
    else:
        grossPay = 0
        print("The work time is not due")

    print(f"\nThe grossPay is {grossPay:.2f} cedis")




    #Calculating the DEDUCTIONS
    if grossPay > 5000000:
        nationalTax = 0.3
    elif grossPay >= 2750001:
        nationalTax = 0.2
    elif grossPay >= 1750001:
        nationalTax = 0.15
    elif grossPay >= 250001:
        nationalTax = 0.1
    elif grossPay >= 125001:
        nationalTax = 0.05
    elif grossPay == 0:
        nationalTax = 0
        print("Sorry, worker can't be paid")
    else:
        nationalTax = 0

    totalTaxes = nationalTax + additionalTax
    deductions = totalTaxes * grossPay

    print(f"\nAnd the deduction is {deductions:.2f} cedis")



    #Caculating the NETPAY
    if dependants > 3:
        numOfDependants = dependants - 3
        dependantsIncome = numOfDependants * 5000
        netPay = grossPay - deductions + dependantsIncome
    elif dependants == 0:
        print("Worker has no dependants")
    elif dependants < 0:
        print("Dependants can't be negative")
    else:
        netPay = grossPay - deductions

    #Check not to pay unserious workers
    if time < 40:
        netPay = 0


    print(f"\nTherefore the total NetPay is {netPay:.2f} cedis")

    print("""\n\n\n        Check Netpay for another worker""")

#Infinite loop continues



