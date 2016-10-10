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
            io.writeMessage("\nEnter 'c' to calculate tip OR 'q' to Quit")
            currentInput = io.getInput()
            
            if currentInput == "q"{
                done = true
            } else if currentInput == "c" {
                calcTip()
            } else {
                print("Can you repeat that?")
            }

        
        }
        print ("Exiting....")
        
        return
    }
    
    func calcTip() {
        
        io.writeMessage("\nHow much was your Bill?")
        currentInput = io.getInput()
        
        // Get the bill amount
        let amountOfBill: Double? = Double(currentInput)
        //print(amountOfBill ?? 0.0)
        
        //Get Tip amount
        
        io.writeMessage("\nWhat percent is your tip?")
        currentInput = io.getInput()
        
        let percentOfTip: Double? = Double(currentInput)
        let totalOfTip = ((percentOfTip ?? 0.0) / 100)
        //print(totalOfTip)
        
        // Do math for tip amount, print result
        let amountOfTip = ((amountOfBill ?? 0.0) * totalOfTip)
        print("\nThe amount of your tip is: \(String(format:"%.02f", roundTwoDigits(num: amountOfTip)))")
        
        //Do math to add the tip amount to the Bill Amount for total Bill
        let totalCompleteBill = ((amountOfBill ?? 0.0) + amountOfTip)
        sleep(1)
        
        print("\nThe amount of your bill is: \(String(format: "%.02f", roundTwoDigits(num: totalCompleteBill)))")
        
    }
    
    func roundTwoDigits(num: Double) -> Double {
        let tmp = (num*100).rounded(.toNearestOrAwayFromZero)
        return tmp/100
    }
    
   
}
