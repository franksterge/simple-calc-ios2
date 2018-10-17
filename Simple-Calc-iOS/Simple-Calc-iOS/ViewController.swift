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
    var op: [String?] = []
    @IBAction func numBtnClick(_ sender: UIButton) {
        if numberIsValid(numOfDigit(displayInt()) + 1) {
            calcDisplay.text = "\(displayInt() * 10 + sender.tag)"
        }
    }
    
    @IBAction func simpleOpClick(_ sender: UIButton) {
        op.append(sender.titleLabel!.text!)
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
    
//    private func simpleCalc(_ sender: UIButton) -> Int {
//        let operators = ["+", "-", "*", "/", "%", "count", "avg", "fact"];
//                let ope = sender.titleLabel!
//                switch ope {
//                case operators[0]:
//                    result = Int(args[opeIndex! - 1])! + Int(args[opeIndex! + 1])!
//                case operators[1]:
//                    result = Int(args[opeIndex! - 1])! - Int(args[opeIndex! + 1])!
//                case operators[2]:
//                    result = Int(args[opeIndex! - 1])! * Int(args[opeIndex! + 1])!
//                case operators[3]:
//                    result = Int(args[opeIndex! - 1])! / Int(args[opeIndex! + 1])!
//                case operators[4]:
//                    result = Int(args[opeIndex! - 1])! % Int(args[opeIndex! + 1])!
//                case operators[5]:
//                    result = args.count - 1
//                case operators[6]:
//                    if args.count != 1 {
//                        var sum = 0
//                        for i in 0...args.count - 2 {
//                            sum += Int(args[i])!
//                        }
//                        result = sum / (args.count - 1)
//                    }
//                default:
//                    if args.count == 2 {
//                        result = fact(Int(args[0])!)
//                    }
//                }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

