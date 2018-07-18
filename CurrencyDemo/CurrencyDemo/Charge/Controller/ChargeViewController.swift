//
//  ChargeViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class ChargeViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var chargeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBtn.layer.cornerRadius = 22
        self.addBtn.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
