//
//  ViewController.swift
//  Calculator
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Foundation

enum Operator: Int {
    case plus = 200, minus, multiply, divide
    case `default` = 0
}

class CalculatorLogic {
    // save last value
    var lastRetainValue : Double
    var currentOperator : Operator
    //The last selected operator (addition, subtraction, multiplication, and division)
    var isMainLabelTextTemporary : Bool
    
    init() {
        print("Calculator init")
        lastRetainValue = 0.0
        isMainLabelTextTemporary = false
        currentOperator = .default
    }
    
    deinit {
        print("Calculator deinit")
    }
    
    // Update main label method
    func updateMainLabelStringByNumberTag(_ tag : Int, withMainLabelString mainLabelString : String) -> String {
        
        var string = mainLabelString
        
        if (isMainLabelTextTemporary) {
            string = "0"
            isMainLabelTextTemporary = false
        }
        
        let optNumber = tag - 100
        let mainLabelDouble = (string as NSString).doubleValue
        
        // Determine whether the content of the main label is equal to zero after conversion to a double type, the method doesStringContainDecimal to determine if there is a decimal point
        if mainLabelDouble == 0 && doesStringContainDecimal(string) == false {
            return String(optNumber)
        }
        
        let resultString = string + String(optNumber)
        
        return resultString
    }
    
    // Determine if there is a decimal point method
    func doesStringContainDecimal(_ string : String) -> Bool {
        for ch in string {
            if ch == "." {
                return true
            }
        }
        return false
    }
    
    // Phương pháp tính toán
    
    func calculatorByTag(_ tag : Int, withMainLabelString mainLabelString : String) -> String {
        
        let currentValue = (mainLabelString as NSString).doubleValue
        
        switch currentOperator {
        case .plus:
            lastRetainValue += currentValue
        case .minus:
            lastRetainValue -= currentValue
        case .multiply:
            lastRetainValue *= currentValue
        case .divide:
            if currentValue != 0 {
                lastRetainValue /= currentValue
            } else {
                currentOperator = .default
                isMainLabelTextTemporary = true
                return "Error"
            }
        default:
            lastRetainValue = currentValue
        }
        
        currentOperator = Operator(rawValue: tag)!
        
        let resultString = NSString(format: "%g", lastRetainValue)
        
        isMainLabelTextTemporary = true
        
        return resultString as String
    }
    
    func clean() {
        lastRetainValue = 0.0
        isMainLabelTextTemporary = false
        currentOperator = .default
    }
}

