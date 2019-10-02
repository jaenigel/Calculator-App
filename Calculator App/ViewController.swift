//
// Jae Nigel Miranda
// 301106338
//
//  ViewController.swift
//  Calculator App
//
//  Created by Jae Nigel Miranda on 2019-09-25.
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var m_operand = ""
    private var m_operand2 = ""
    private var m_currentValue: Double = 0.0
    private var isWaiting = false
    private var isShowingResult = false
    private var lastOperation = ""
    //var person:  = (name: "Tom", age:29)
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ResultLabel.text="0"
        
        //person.saysHello();
    }


    @IBAction func CalculatorButtonClick(_ sender: UIButton) {
        let calculatorButton = sender.titleLabel?.text
        
        
        switch(calculatorButton) {
        case "Clear":
            m_operand = "0"
            m_currentValue = 0.0
            isWaiting = false
            ResultLabel.text = m_operand
            
            
        case "Back":
            m_operand = String(m_operand.dropLast(1))
            break
            
        case ".":
            if(isWaiting == true)//getting 2nd operand
            {
                ResultLabel.text = "0."
                m_operand = "0."
                isWaiting = false
                
            }
            if(!(ResultLabel.text?.contains("."))!)
            {
                m_operand += calculatorButton!
            }
            break
            
        case "+/-":
            if((ResultLabel.text?.contains("-"))!)
            {
                ResultLabel.text = ResultLabel.text?.replacingOccurrences(of: "-", with: "")
            }
            else
            {
                ResultLabel.text = "-" + ResultLabel.text!
            }
            isShowingResult = true
            break
            
        case "√":
            ResultLabel.text = String(sqrt(Double(ResultLabel.text!)!))
            isShowingResult = true
            break
            
        case "=":

            if(lastOperation == "Addition")
            {
            
                m_currentValue =  add(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
            }
            else if(lastOperation == "Subtraction")
            {
                
                m_currentValue =  subtract(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
            }
            else if(lastOperation == "Division")
            {
                
                m_currentValue =  divide(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                    
                }
                
                isShowingResult = true
            }
            else if(lastOperation == "Multiplication")
            {
                
                m_currentValue =  multiply(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
            }
            
            break
            
            
            
        case "+":
            if(m_currentValue == 0.0)
            {
                m_currentValue = Double(ResultLabel.text!)!
                isWaiting = true
                lastOperation = "Addition"
            }
            else if(isShowingResult)
            {
                lastOperation = "Addition"
            }
            else
            {
                m_operand = ResultLabel.text!
                m_currentValue =  add(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
                print("isShowingResult set to true")
                lastOperation = "Addition"
            }
            break
            
            
            
        case "-":
            if(m_currentValue == 0.0)
            {
                m_currentValue = Double(ResultLabel.text!)!
                isWaiting = true
                lastOperation = "Subtraction"
            }
            else if(isShowingResult)
            {
                lastOperation = "Subtraction"
            }
            else
            {
                m_operand = ResultLabel.text!
                m_currentValue =  subtract(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
            
                isShowingResult = true
                lastOperation = "Subtraction"
            }
            break
            
        case "/":
            if(m_currentValue == 0.0)
            {
                m_currentValue = Double(ResultLabel.text!)!
                isWaiting = true
                lastOperation = "Division"
            }
            else if(isShowingResult)
            {
                lastOperation = "Division"
            }
            else
            {
                m_operand = ResultLabel.text!
                m_currentValue =  divide(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
                lastOperation = "Division"
            }
            break
            
        case "x":
            if(m_currentValue == 0.0)
            {
                m_currentValue = Double(ResultLabel.text!)!
                isWaiting = true
                lastOperation = "Multiplication"
            }
            else if(isShowingResult)
            {
                lastOperation = "Multiplication"
            }
            else
            {
                m_operand = ResultLabel.text!
                m_currentValue =  multiply(current: m_currentValue,op:m_operand)
                if((String(m_currentValue)).hasSuffix(".0"))
                {
                    ResultLabel.text = String((String(m_currentValue)).dropLast(2))
                    
                }
                else
                {
                    ResultLabel.text = String(m_currentValue)
                }
                
                isShowingResult = true
                lastOperation = "Multiplication"
            }
            break
            
            
            
        default:
            if(ResultLabel.text == "0")// no multiple 0s
            {
                m_operand = ""
            }
            if(isWaiting == true)//getting 2nd operand
            {
                if((ResultLabel.text?.contains("0."))!)
                {
                    ResultLabel.text = "0." //clears label to get 2nd operand
                    m_operand = "0."

                }
                else
                {
                    ResultLabel.text = "" //clears label to get 2nd operand
                    m_operand = ""
                }
                isWaiting = false //m_operand gets a value now so no more waiting
                
            }
            m_operand += calculatorButton!
            isShowingResult = false
            
            
        }
        
        if(isShowingResult)
        {
            isWaiting = true
            
        }
        else
        {
            ResultLabel.text = m_operand
        }
    }
    
    func add (current:Double, op:String) -> Double
    {
        var num1: Double = 0.0
        var num2: Double = 0.0
        
        num1 = current
        num2 = Double(op)!
        return (num1 + num2)
    }
    
    func subtract (current:Double, op:String) -> Double
    {
        var num1: Double = 0.0
        var num2: Double = 0.0
        
        num1 = current
        num2 = Double(op)!
        return (num1 - num2)
    }
    
    func divide (current:Double, op:String) -> Double
    {
        var num1: Double = 0.0
        var num2: Double = 0.0
        
        num1 = current
        num2 = Double(op)!
        return (num1 / num2)
    }
    func multiply (current:Double, op:String) -> Double
    {
        var num1: Double = 0.0
        var num2: Double = 0.0
        
        num1 = current
        num2 = Double(op)!
        return (num1 * num2)
    }
}

