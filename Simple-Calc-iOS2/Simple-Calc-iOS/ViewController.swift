//
//  ViewController.swift
//  Simple-Calc-iOS
//
//  Created by GeFrank on 10/16/18.
//  Copyright © 2018 GeFrank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcDisplay: UILabel!
    var args: [String] = []
    let operators = ["+", "-", "*", "/", "%", "count", "avg", "fact"]

    @IBAction func numBtnClick(_ sender: UIButton) {
        if numberIsValid(numOfDigit(displayInt()) + 1) {
            calcDisplay.text = "\(displayInt() * 10 + sender.tag)"
        }
    }
    
    @IBAction func opClick(_ sender: UIButton) {
        args.append(calcDisplay.text!)
        args.append(sender.titleLabel!.text!)
        if sender.titleLabel!.text! == "fact" {
            calcDisplay.text = "\(calc())"
            args = []
        } else {
            calcDisplay.text = "0"
        }
    }
    
    @IBAction func calculate(_: UIButton) {
        if (args.count > 0) {
            args.append(calcDisplay.text!)
            calcDisplay.text = "\(calc())"
            args = []
        }
    }
    
    @IBAction func clearDisplay(_ sender: Any) {
        calcDisplay.text = "0"
        args = []
    }
    
    private func displayInt() -> Int{
        return Int(calcDisplay.text!)!
    }
    
    private func numOfDigit(_ num: Int) -> Int{
        if abs(num) < 10 {
            return 1
        } else {
            return 1 + numOfDigit(num / 10)
        }
    }
    
    private func numberIsValid(_ num: Int) -> Bool {
        return num < numOfDigit(Int.max)
    }
    
    private func calc() -> Int {
        var result = Int(args[0])!
        var elementIndex = 0
        for element in args {
            if operators.contains(element) {
                switch element {
                case operators[0]:
                    result += Int(args[elementIndex + 1])!
                case operators[1]:
                    result -= Int(args[elementIndex + 1])!
                case operators[2]:
                    result *= Int(args[elementIndex + 1])!
                case operators[3]:
                    if Int(args[elementIndex + 1])! != 0 {
                        result /= Int(args[elementIndex + 1])!
                    }
                case operators[4]:
                    result %= Int(args[elementIndex + 1])!
                case operators[5]:
                    result = args.count - args.count / 2
                case operators[6]:
                    result += Int(args[elementIndex + 1])!
                    if elementIndex == args.lastIndex(of: element)  {
                        result = result / ((args.count - 1) / 2 + 1)
                    }
                default:
                    if (Int(args[0])! < 26) {
                        result = fact(Int(args[0])!)
                    } else {
                        calcDisplay.text = "0"
                    }
                }
            }
            elementIndex += 1
        }
        return result
    }
    
    private func fact(_ num: Int) -> Int {
        switch num {
        case 0:
            return 1
        default:
            return num * fact(num - 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

