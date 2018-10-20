//
//  ViewController2.swift
//  Simple-Calc-iOS2
//
//  Created by GeFrank on 10/20/18.
//  Copyright © 2018 GeFrank. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var records: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for line in calcData.calcRecord {
            records.text! = "\(line)\n"//got some problems gotta fix tmr
        
        }
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
