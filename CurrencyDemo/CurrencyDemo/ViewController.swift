//
//  ViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/18.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var assetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "首页"
        self.assetBtn.onTap {
            self.navigationController?.pushViewController(AssetViewController(), animated: true)
        }
    }
    
}

