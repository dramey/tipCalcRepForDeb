//
//  Interactive.swift
//  commandBaseLineForTip
//
//  Created by Deb Ramey on 10/10/16.
//  Copyright © 2016 Deb Ramey. All rights reserved.
//

import Foundation

class tipCalculator{
    private var done: Bool = false
    private var currentInput: String = "q"
    private var io = Io()
    
    func go(){
        
        while !done{
            
            //ask the user for input right here
            io.writeMessage("\nEnter 'Start' to calculate a new amount \nEnter 'Help' for the Help Menu \nEnter 'Quit' to End")
            currentInput = io.getInput()
                        if currentInput.uppercased() == "Quit".uppercased(){
                done = true
            } else if currentInput.uppercased() == "Start".uppercased(){
                calcTip()
            } else if currentInput.uppercased() == "Help".uppercased(){
                helpFunction()
            }else{
                calcTip()
            }

        
        }
        print ("Exiting....")
        
        return
    }
    
    func calcTip() {
        
        io.writeMessage("\nHow much was your Meal?")
        currentInput = io.getInput()
        
        // Get the meal amount
        let amountOfMeal: Double? = Double(currentInput)
        
        //Multiply Meal by tax percent obtained by user
        io.writeMessage("\nWhat is the tax percentage? (enter a whole number i.e. if 6% enter '6')")
        currentInput = io.getInput()
        let userTaxAmount: Double? = Double(currentInput)
        let calcTax = ((userTaxAmount ?? 0.0) / 100)
        let amountOfTax = ((amountOfMeal ?? 0.0) * calcTax)
        let amountOfBill = ((amountOfMeal ?? 0.0) + amountOfTax)
        print("\nThe Amount of your Tax is: $\(String(format:"%.02f", roundTwoDigits(num: amountOfTax)))")
        
        //Get Tip amount
        
        io.writeMessage("\nWhat percent of tip are you giving? (enter a whole number i.e. if 20% enter '20')")
        currentInput = io.getInput()
        
        let percentOfTip: Double? = Double(currentInput)
        let totalOfTip = ((percentOfTip ?? 0.0) / 100)
        //print(totalOfTip)
        
        // Do math for tip amount, print result
        let amountOfTip = (amountOfBill * totalOfTip)
        print("\nThe amount of your tip is: $\(String(format:"%.02f", roundTwoDigits(num: amountOfTip)))")
        
        //Do math to add the tip amount to the Bill Amount for total Bill
        let totalCompleteBill = (amountOfBill + amountOfTip)
        sleep(2)
        
        print("\nThe amount of your bill is: \(String(format: "%.02f", roundTwoDigits(num: totalCompleteBill)))")
        
        io.writeMessage("\nDo you want to Split your bill?")
        currentInput = io.getInput()
        if currentInput.uppercased() == "yes".uppercased(){
            io.writeMessage("\nHow Many in Your Party?")
            currentInput = io.getInput()
            let partyNum: Double? = Double(currentInput)
            let partyNumCal = (partyNum ?? 0.0)
            let perTip = amountOfTip / partyNumCal
            print("\nThe amount of tip per person is: $\(String(format: "%.02f", roundTwoDigits(num: perTip)))")
            let perAmount = totalCompleteBill / partyNumCal
            print("\nThe amount of your bill per person is: S\(String(format: "%.02f", roundTwoDigits(num: perAmount)))")
        }else{
            print("Your bill is all on you! Have a Nice Day!")
        }
        
    }
    
    func roundTwoDigits(num: Double) -> Double {
        let tmp = (num*100).rounded(.toNearestOrAwayFromZero)
        return tmp/100
    }
    func helpFunction(){
        print("This is a simple app. \n* First step would be to type in the word 'start'. \n* After prompted 'How Much is Your Meal?' enter your meal amount. \n* After prompted enter the tax percentage in a whole number i.e. '6' for 6% - Your Tax will be calculated for you! \n* After prompted Enter your tip percentage. For Good service tip at least 15%-enter this as a whole number- i.e. '15'! \n* The Amount of your tip and the total Bill will be calculated for you! \n* You will also have an option to Split your bill with as many people in your party as you would like. \n* When prompted answer 'yes' or 'no' to whether or not you want to split your bill. \n* Enter the amount of people you are splitting the bill with (as a whole number) -i.e. if 2 people just enter '2'!\n* The Amount of your TIP and TOTAL BILL will be divided evenly amongst the number of people.\n* Now type START to begin the process and Have a beautiful Day!")
    }
    
}
