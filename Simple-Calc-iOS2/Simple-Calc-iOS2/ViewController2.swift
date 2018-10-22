//
//  ViewController2.swift
//  Simple-Calc-iOS2
//
//  Created by GeFrank on 10/20/18.
//  Copyright © 2018 GeFrank. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var records: UIView!
    @IBOutlet weak var sv: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        for line in calcData.calcRecord {
            let record:UILabel = UILabel()
            record.text = line
            record.textColor = .lightGray
            record.sizeToFit()
            record.frame.origin.y = CGFloat(i * Int(record.frame.size.height))
            records.frame.size.height += record.frame.size.height
            records.addSubview(record)
//            NSLog("\( records.frame.size.height)")
            i += 1
        }
        sv.contentSize.height = records.frame.size.height
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
