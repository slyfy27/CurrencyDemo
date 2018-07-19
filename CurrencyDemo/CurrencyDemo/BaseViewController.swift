//
//  BaseViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customBack()
    }
    
    func customBack() {
        let leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 65, height: 44)
        leftButton.onTap {
            self.goBack()
        }
        leftButton.setImage(UIImage(named: "返回-蓝"), for: .normal)
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 44)
        let leftBarButton = UIBarButtonItem.init(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton;
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
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
