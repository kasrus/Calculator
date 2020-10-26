//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Kasumi Ruslim on 10/15/20.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Negative = "-"
    case Multiply = "x"
    case Divide = "/"
    case NULL = "Null"
}
class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
   
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
        
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 10 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }

    @IBAction func allClearPressed(_ sender: Any) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        currentOperation = .NULL
        result = ""
        outputLabel.text = "0"
    }
    
    @IBAction func negatePressed(_ sender: Any) {
    }
    
    @IBAction func percentPressed(_ sender: Any) {
        
    }
    
    @IBAction func dividePressed(_ sender: Any) {
        operation (operation: .Divide)
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        operation (operation: .Multiply)
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        operation(operation: .Negative)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        operation(operation: .Add)
    }
    
    
    @IBAction func equalPressed(_ sender: Any) {
        operation(operation: currentOperation)
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if runningNumber.count <= 9 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                switch operation {
                case .Add:
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                case .Negative:
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                case .Divide:
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                case .Multiply:
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                case .NULL:
                    result = ""
                }
            }
            leftValue = result
            if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                result = "\(Int(Double(result)!))"
            }
            outputLabel.text = result
            currentOperation = operation
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

